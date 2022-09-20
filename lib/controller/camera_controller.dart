import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_national_card_reader/flutter_national_card_reader.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mime/mime.dart';
import 'package:mrz_parser/mrz_parser.dart';
import 'package:tamine/model/ocr_model.dart';
import 'package:tamine/sheet/alert_dialog.dart';
import 'package:tamine/utils/routers.dart';

import 'package:http/http.dart' as http;
import 'package:tamine/utils/utils.dart';

import '../utils/snackbar.dart';

class CamerContorller extends GetxController {
  final begin = true.obs;
  final loading = false.obs;
  final nfcStep = 0.obs;
  final msg = "ضع وجهك داخل الشكل".obs;
  final Rx<XFile?> imageUni8 = (null as XFile?).obs;
  final Rx<MRZResult?> mrzResult = (null as MRZResult?).obs;
  late List<CameraDescription> cameras;
  final Rx<CameraController?> cameraController =
      (null as CameraController?).obs;

  final text = "----".obs;
  final cardReader = FlutterNationalCardReader().obs;
  final codeError = 0.obs;

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );
  ini(
      {int? cameraIndex,
      ResolutionPreset? resolutionPreset,
      ImageFormatGroup? imageFormatGroup}) async {
    if (cameraController.value == null) {
      cameras = await availableCameras();
      cameraController.value = CameraController(
          cameraIndex != null ? cameras[cameraIndex] : cameras.first,
          resolutionPreset ?? ResolutionPreset.veryHigh,
          imageFormatGroup: imageFormatGroup ?? ImageFormatGroup.bgra8888);

      cameraController.value!.initialize().then((_) {
        cameraController.refresh();
        update();
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              break;
            default:
              break;
          }
        }
      });
      return;
    }
    cameraController.value!.resumePreview();
  }

  Future tackPickture(MediaQueryData query, type,
      {required Function(String path) onComplete,
      required BuildContext context}) async {
    loading.value = true;
    var f = await cameraController.value!.takePicture();

    var d = await cropImage(f.path, query,
        hAspect: 2,
        wAspect: 1.5,
        x: (query.size.width - query.size.width / 1.5) / 2,
        y: query.size.height -
            (query.size.height / 2) -
            (query.size.height * 0.14));
    try {
      print("test camer 2022==1");
      var inputImage = InputImage.fromFilePath(d);
      final faces = await _faceDetector.processImage(inputImage);
      if (inputImage.inputImageData?.size != null || true) {
        if (faces.length == 1 &&
            faces[0].leftEyeOpenProbability! > 0 &&
            faces[0].rightEyeOpenProbability! > 0 &&
            // faces[0].headEulerAngleX! < 0.5 &&
            faces[0].headEulerAngleY! < 1) {
          imageUni8.value = XFile(d);
          print(
              "headEulerAngleX===${faces[0].headEulerAngleX}\n headEulerAngleY===${faces[0].headEulerAngleY}\n  headEulerAngleZ===${faces[0].headEulerAngleZ}\n");
        }
        print(
            "headEulerAngleX===${faces[0].headEulerAngleX}\n headEulerAngleY===${faces[0].headEulerAngleY}\n  headEulerAngleZ===${faces[0].headEulerAngleZ}\n");

        if (faces.length > 1) {
          msg.value = "يجب ان تكون الصورة لشخص واحد";
          showSnackbar(context,
              subtitle: "يجب ان تكون الصورة لشخص واحد",
              style: SnackbarStyle.error);
        }
        if (faces.length == 0) {
          msg.value = "ضع وجهك داخل الشكل";
        }
      } else {
        msg.value = "ضع وجهك داخل الشكل";
      }
    } catch (e) {
      msg.value = "ضع وجهك داخل الشكل";
      showSnackbar(context,
          subtitle: "ضع وجهك داخل الشكل", style: SnackbarStyle.error);
    }
    onComplete(f.path);

    loading.value = false;
    update();

    return;
  }

  Future recoginitionTaumin(MediaQueryData query, type,
      {void Function(String text)? onComplete,
      required BuildContext context}) async {
    loading.value = true;
    var f = await cameraController.value!.takePicture();

    var resizeImage = await _resizePhotoCard(f.path, query);

    var d = await File(resizeImage);
    // imageUni8.value = await d.readAsBytes();

    var imageBytes = d.readAsBytesSync();

    String base64Image = base64Encode(imageBytes);
    Map<dynamic, dynamic> jsondata = {};
    List<String> stringArray = [];

    try {
      jsondata = (await cardReader.value.textRecognition(base64Image));
    } catch (e) {
      text.value = e.toString();
      onComplete!(text.value);
      return;
    }
    text.value = jsondata["result"].toString();
    onComplete!(text.value);

    if ((jsondata["status"] == "1" && jsondata["result"].length == 3) || true) {
      List<dynamic> dynamicArray = jsondata["result"];

      stringArray = dynamicArray.map((e) => e.toString()).toList();

      try {
        mrzResult.value = MRZParser.parse(stringArray);
        Navigator.pop(context, mrzResult.value);
      } catch (e) {
        try {
          mrzResult.value = MRZParser.parse(stringArray.reversed.toList());
          Navigator.pop(context, mrzResult.value);
        } catch (e) {
          print(e);
          mrzResult.value = MRZResult(
              documentType: e.toString(),
              countryCode: "countryCode",
              surnames: "surnames",
              givenNames: "givenNames",
              documentNumber: "documentNumber",
              nationalityCountryCode: "nationalityCountryCode",
              birthDate: DateTime.now(),
              sex: Sex.male,
              expiryDate: DateTime.now(),
              personalNumber: "personalNumber");
        }
      }

      text.value =
          "${mrzResult.value!.documentNumber}  ==== ${mrzResult.value!.expiryDate}===${mrzResult.value!.birthDate}";
    } else {
      // List<dynamic> imlist = jsondata["img"];
      // imageUni8.value = Uint8List.fromList(
      //     imlist.map((e) => int.parse(e.toString())).toList());
      text.value = " error mrz ${jsondata["result"].length}";
    }
    loading.value = false;
    update();

    return;
  }

  Future<dynamic> readNfc(MRZResult data, BuildContext context) async {
    final format = new DateFormat("y-MM-d");
    final date1 = format.format(data.birthDate);
    final date2 = format.format(data.expiryDate);
    final finalPirhtday = date1.substring(2, date1.length).replaceAll("-", "");
    final finalExpday = date2.substring(2, date2.length).replaceAll("-", "");
    text.value = finalPirhtday + "--" + finalExpday;

    try {
      await cardReader.value.initNfcReader();
      var result = await cardReader.value.readCard(
          documentNumber: data.documentNumber,
          birthDay: finalPirhtday,
          expDay: finalExpday);
      text.value = result.toString();
    } catch (e) {
      text.value = e.toString();
    }
  }

  Future<List<String>> recognitionTextAPI(
      String resizeImage, BuildContext context) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(ocrUrl),
    );

    final minTypeData =
        lookupMimeType(resizeImage, headerBytes: [0xFF, 0xD8])?.split('/');
    final imuploadRequest = await http.MultipartFile.fromPath(
        'file', resizeImage,
        contentType: MediaType(minTypeData![0], minTypeData[1]));
    request.files.add(imuploadRequest);

    var requ = await request.send();
    var res = await http.Response.fromStream(requ)
        .timeout(const Duration(seconds: 30));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      try {
        var data = OcrModel.fromJson(body);
        return data.text!.split("\n");
      } catch (e) {
        showSnackbar(context,
            subtitle: "اعد المحاولة", style: SnackbarStyle.error);
        return [];
      }
    } else {
      showSnackbar(context,
          subtitle: "اعد المحاولة", style: SnackbarStyle.error);
      return [];
    }
  }

  Future<String> _resizePhotoCard(String filePath, MediaQueryData query) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);
    var widthAspect = 0;
    var heightAspect = 0;

    var hRatio = 0.0;
    var wRatio = 0.0;
    var h = 0.0;
    var w = 0.0;
    var h1 = 0.0;
    var w1 = 0.0;
    var endw = 0;
    var endh = 0;
    if (properties.width! > properties.height!) {
      widthAspect = properties.height!;
      heightAspect = properties.width!;

      hRatio = heightAspect / query.size.height;
      wRatio = widthAspect / query.size.width;
      h = query.size.height / 1.84;
      w = query.size.width / 3.52;
      h1 = ((query.size.height - h) / 2) * hRatio;
      w1 = ((query.size.width - w) / 2) * wRatio;
      endh = (w * wRatio).toInt();
      endw = (h * hRatio).toInt();
    } else {
      widthAspect = properties.width!;
      heightAspect = properties.height!;
      hRatio = heightAspect / query.size.height;
      wRatio = widthAspect / query.size.width;
      h = query.size.height / 1.84;
      w = query.size.width / 3.52;
      h1 = ((query.size.height - h) / 2) * hRatio;
      w1 = ((query.size.width - w) / 2) * wRatio;
      endw = (w * wRatio).toInt();
      endh = (h * hRatio).toInt();
    }

    // print("im_width:$widthAspect");

    // print("phone_width:${query.size.width}");

    // print("ratio_width:$wRatio");

    // print("rect_width:$w");

    // print("crop_width:$endw");

    // print("left_width:$w1");
    // print("---------------");

    // print("im_height:$heightAspect");

    // print("phone_height:${query.size.height}");

    // print("ratio_height:$hRatio");

    // print("rect_height:$h");

    // print("crop_height:$endh");

    // print("left_height:$h1");
    // print("\n");

    File croppedFile = await FlutterNativeImage.cropImage(
        filePath,
        (w1.toInt() + query.viewPadding.top + query.viewPadding.bottom).toInt(),
        h1.toInt(),
        endw,
        endh);

    return croppedFile.path;
  }

  Future<String> cropImage(String filePath, MediaQueryData query,
      {required double hAspect,
      required double wAspect,
      required double x,
      required double y}) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);
    var widthAspect = 0;
    var heightAspect = 0;

    var hRatio = 0.0;
    var wRatio = 0.0;
    var h = 0.0;
    var w = 0.0;
    var h1 = 0.0;
    var w1 = 0.0;
    var endw = 0;
    var endh = 0;
    if (properties.width! > properties.height!) {
      widthAspect = properties.height!;
      heightAspect = properties.width!;

      hRatio = heightAspect / query.size.height;
      wRatio = widthAspect / query.size.width;
      h = query.size.height / hAspect;
      w = query.size.width / wAspect;
      h1 = y * hRatio;
      w1 = x * wRatio;
      endh = (w * wRatio).toInt();
      endw = (h * hRatio).toInt();
    } else {
      widthAspect = properties.width!;
      heightAspect = properties.height!;
      hRatio = heightAspect / query.size.height;
      wRatio = widthAspect / query.size.width;
      h = query.size.height / hAspect;
      w = query.size.width / wAspect;
      h1 = y * hRatio;
      w1 = x * wRatio;
      endw = (w * wRatio).toInt();
      endh = (h * hRatio).toInt();
    }

    print("im_width:$widthAspect");

    print("phone_width:${query.size.width}");

    print("ratio_width:$wRatio");

    print("rect_width:$w");

    print("crop_width:$endw");

    print("left_width:$w1");
    print("---------------");

    print("im_height:$heightAspect");

    print("phone_height:${query.size.height}");

    print("ratio_height:$hRatio");

    print("rect_height:$h");

    print("crop_height:$endh");

    print("left_height:$h1");
    print("\n");

    File croppedFile = await FlutterNativeImage.cropImage(
        filePath, h1.toInt(), (w1.toInt()).toInt(), endw, endh);

    return croppedFile.path;
  }
}
