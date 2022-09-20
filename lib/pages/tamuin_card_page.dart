// import 'dart:collection';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_native_image/flutter_native_image.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
// import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:tamine/controller/camera_controller.dart';
// import 'package:tamine/pages/details_pager.dart';

// class TamuinCardPage extends StatefulWidget {
//   const TamuinCardPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TamuinCardPage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<TamuinCardPage> {
//   Uint8List? imageUni8;
//   late CamerContorller cameraController;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     try {
//       cameraController.controller?.pausePreview();
//     } catch (e) {}
//     super.dispose();
//   }

//   String? text;
//   int codeError = -1;
//   var first = true;
//   @override
//   Widget build(BuildContext context) {
//     final textRecognizer = TextRecognizer();
//     final query = MediaQuery.of(context);
//     cameraController = Get.put(CamerContorller());
//     if (first) {
//       first = false;
//       cameraController.ini();
//     }
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: Obx(
//         () => Stack(children: <Widget>[
//           Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: cameraController != null &&
//                       cameraController.controller != null
//                   ? CameraPreview(cameraController.controller!)
//                   : SizedBox()),
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.amber),
//                 borderRadius: BorderRadius.circular(10)),
//             margin: EdgeInsets.only(
//               left: query.size.width * 0.15,
//               right: query.size.width * 0.15,
//               top: 80,
//             ),
//             width: query.size.width * 0.7,
//             height: query.size.height / 1.2,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: const [
//                   Text(
//                     "------------------",
//                     style: TextStyle(color: Colors.amber, fontSize: 18),
//                   ),
//                   Text(
//                     "------------------",
//                     style: TextStyle(color: Colors.amber, fontSize: 18),
//                   ),
//                   Text(
//                     "-------------------",
//                     style: TextStyle(color: Colors.amber, fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   )
//                 ]), // this is my CameraPreview
//           ),
//           imageUni8 != null ? Image.memory(imageUni8!) : SizedBox(),
//           Align(
//             alignment: Alignment.topCenter,
//             child: SafeArea(
//               child: AnimatedOpacity(
//                 opacity: codeError > 0 ? 1 : 0,
//                 duration: Duration(milliseconds: 300),
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.black26),
//                   child: Text(
//                     text ?? "----",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.camera),
//           onPressed: imageUni8 != null
//               ? () async {
//                   imageUni8 = null;
//                   imageUni8 =
//                       await cameraController.recoginitionTaumin(query, 1);
//                   setState(() {});
//                 }
//               : () async {}),
//     );
//   }
// }
