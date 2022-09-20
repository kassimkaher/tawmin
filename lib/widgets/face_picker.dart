import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tamine/controller/camera_controller.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';

import '../pages/face/test.dart';

class FDFacePicker extends GetView<CamerContorller> {
  const FDFacePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    if (controller.begin.value) {
      controller.begin.value = false;
      controller.ini(
          cameraIndex: 1,
          resolutionPreset: ResolutionPreset.max,
          imageFormatGroup: ImageFormatGroup.jpeg);
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(
        () => Stack(
          children: <Widget>[
            SizedBox(
              height: query.size.height,
              width: query.size.width,
            ),
            controller.cameraController.value != null
                ? Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 60),
                    width: double.infinity,
                    child: CameraPreview(controller.cameraController.value!),
                  )
                : const SizedBox(),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/face.png",
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: (query.size.height * 0.24),
                ),
                child: Text(controller.msg.value),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 30,
              child: controller.imageUni8.value != null
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            (query.size.width - query.size.width / 1.5) / 2,
                        vertical: (query.size.height * 0.24),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 3),
                          borderRadius:
                              BorderRadius.circular(kDefaultBorderRadius),
                        ),
                        child: Image.file(
                          File(controller.imageUni8.value!.path),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: controller.imageUni8.value != null
                  ? Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: FDButton(
                              title: "اختيار",
                              onPressed: () {
                                Navigator.pop(
                                    context, controller.imageUni8.value!.path);
                              },
                            ),
                          ),
                          const SizedBox(width: kDefaultPadding),
                          Expanded(
                              child: FDButton(
                            title: "اعادة",
                            onPressed: () => controller.imageUni8.value = null,
                          ))
                        ],
                      ),
                    )
                  : FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => controller.tackPickture(
                          MediaQuery.of(context), 2, onComplete: (a) {
                        controller.text.value = a;
                      }, context: context),
                      child: const Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
