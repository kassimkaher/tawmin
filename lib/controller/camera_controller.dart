import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:get/get.dart';

class CamerContorller extends GetxController {
  late List<CameraDescription> _cameras;
  CameraController? controller;
  var loading = false.obs;
  ini() async {
    if (controller == null) {
      _cameras = await availableCameras();
      controller = CameraController(_cameras[0], ResolutionPreset.max);
      controller?.initialize().then((_) {
        update();
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              print('User denied camera access.');
              break;
            default:
              print('Handle other errors.');
              break;
          }
        }
      });
      return;
    }
    controller?.resumePreview();
  }

  Future<Uint8List>? recoginitionTaumin(MediaQueryData query, type,
      {void Function(String text)? onComplete}) async {
    var f = await controller!.takePicture();

    var resizeImage = await (type == 1
        ? _resizePhoto(f.path, query)
        : _resizePhotoCard(f.path, query));
    // final RecognizedText recognizedText = await textRecognizer
    //     .processImage(InputImage.fromFile(File(resizeImage)));
    var text = await FlutterTesseractOcr.extractText(
      resizeImage,
      language: 'ara',
      // args: {
      //   "psm": "4",
      //   "preserve_interword_spaces": "1",
      // }
    );
    // text = recognizedText.text.replaceAll(" ", "");
    // text = f.path;
    text = text.replaceAll(" ", "");
    onComplete!(text);
    print("testRecognition12===texlen=${text.length}");
    print("testRecognition12===texlINd=${text.indexOf("البطاقة")}");
    var isFound = text.indexOf("البطاقة");
    if (isFound > -1) {
      text = text.substring(isFound, text.length);
      print("testRecognition12===$text");
    } else {
      if (text.contains("البطاقة")) {
        print("testRecognition12===found");
      }
      print("testRecognition12===$text");
    }

    var imageUni8 = await File(resizeImage).readAsBytes();
    var codeError = 1;
    update();
    return imageUni8;
  }

  Future<String> _resizePhoto(String filePath, MediaQueryData query) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);
    final widthAspect = (properties.width! / (query.size.height));
    final heightAspect = (properties.height! / (query.size.width));
    var h = (query.size.width * 0.7) * heightAspect;
    var w = (query.size.height / 1.2) * widthAspect;

    File croppedFile = await FlutterNativeImage.cropImage(
        filePath,
        ((query.size.width * 0.15) * heightAspect).toInt(),
        (80 * widthAspect).toInt(),
        w.toInt(),
        h.toInt());

    return croppedFile.path;
  }

  Future<String> _resizePhotoCard(String filePath, MediaQueryData query) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);
    final widthAspect = (properties.width! / (query.size.width));
    final heightAspect = (properties.height! / (query.size.height));
    var h = 240 * heightAspect;
    var w = (query.size.width / 2) * widthAspect;
    print("w =${properties.width}==$query.size.width}===$w");

    print("h =${properties.height!}=====${query.size.height}===$h");

    File croppedFile = await FlutterNativeImage.cropImage(
        filePath,
        ((query.size.width / 2 - query.size.width / 4) * widthAspect).toInt(),
        ((query.size.height / 2 - 115) * heightAspect).toInt(),
        w.toInt(),
        h.toInt());

    return croppedFile.path;
  }
}
