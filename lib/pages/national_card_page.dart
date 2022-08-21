import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/instance_manager.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:tamine/controller/camera_controller.dart';
import 'package:tamine/pages/details_pager.dart';

class NationalCardPage extends StatefulWidget {
  const NationalCardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NationalCardPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NationalCardPage> {
  Uint8List? imageUni8;
  CamerContorller? cameraController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    try {
      cameraController?.controller?.pausePreview();
    } catch (e) {}
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  String? text;
  int codeError = -1;
  var first = true;
  @override
  Widget build(BuildContext context) {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    cameraController = Get.put(CamerContorller());
    if (first) {
      first = false;
      cameraController?.ini();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child:
                cameraController != null && cameraController!.controller != null
                    ? CameraPreview(cameraController!.controller!)
                    : SizedBox(),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 2 -
                    MediaQuery.of(context).size.width / 4,
                right: MediaQuery.of(context).size.width / 2 -
                    MediaQuery.of(context).size.width / 4,
                top: MediaQuery.of(context).size.height / 2 - 115),
            width: MediaQuery.of(context).size.width / 2,
            height: 230,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",
                    style: TextStyle(color: Colors.amber, fontSize: 18),
                  ),
                  Text(
                    "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",
                    style: TextStyle(color: Colors.amber, fontSize: 18),
                  ),
                  Text(
                    "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",
                    style: TextStyle(color: Colors.amber, fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ]), // this is my CameraPreview
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: AnimatedOpacity(
                opacity: codeError > 0 ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26),
                  child: Text(
                    text ?? "----",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: imageUni8 != null
              ? () {
                  imageUni8 = null;
                  setState(() {});
                }
              : () => cameraController?.recoginitionTaumin(
                      MediaQuery.of(context), 2, onComplete: (a) {
                    setState(() {
                      text = a;
                    });
                  })
          // ()async{
          //     cameraController?.recoginitionTaumin(MediaQuery.of(context));
          //     var f = await cameraController?.controller!.takePicture();

          //     var resizeImage = await _resizePhoto(f!.path);
          //     final RecognizedText recognizedText = await textRecognizer
          //         .processImage(InputImage.fromFile(File(resizeImage)));

          //     text = recognizedText.text.replaceAll(" ", "");
          //     // text = f.path;
          //     print(text);
          //     imageUni8 = await File(resizeImage).readAsBytes();
          //     if (text!.contains("IDIRQAE")) {
          //       var code =
          //           text!.substring(text!.indexOf("IDIRQAE"), text!.length);
          //       var dataList = code.split("\n");

          //       print(code.length);

          //       if (code.length == 92) {
          //         codeError = 0;
          //         cameraController?.controller!.pausePreview();
          //         await Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => DetailsPage(data: dataList),
          //           ),
          //         );
          //         cameraController?.controller!.resumePreview();
          //         SystemChrome.setPreferredOrientations([
          //           DeviceOrientation.landscapeRight,
          //           DeviceOrientation.landscapeLeft,
          //         ]);
          //         return;
          //       }
          //       text = "error detect";
          //       imageUni8 = null;
          //       codeError = 1;
          //       setState(() {});
          //       return;
          //     }
          //     text = "error detect";
          //     imageUni8 = null;
          //     codeError = 1;
          //     setState(() {});
          //   }
          ),
    );
  }

  Future<String> _resizePhoto(String filePath) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);
    final widthAspect =
        (properties.width! / (MediaQuery.of(context).size.width));
    final heightAspect =
        (properties.height! / (MediaQuery.of(context).size.height));
    var h = 240 * heightAspect;
    var w = (MediaQuery.of(context).size.width / 2) * widthAspect;
    print("w =${properties.width}==${MediaQuery.of(context).size.width}===$w");

    print(
        "h =${properties.height!}=====${MediaQuery.of(context).size.height}===$h");

    File croppedFile = await FlutterNativeImage.cropImage(
        filePath,
        ((MediaQuery.of(context).size.width / 2 -
                    MediaQuery.of(context).size.width / 4) *
                widthAspect)
            .toInt(),
        ((MediaQuery.of(context).size.height / 2 - 115) * heightAspect).toInt(),
        w.toInt(),
        h.toInt());

    return croppedFile.path;
  }
}
