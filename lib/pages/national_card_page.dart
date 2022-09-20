import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tamine/controller/camera_controller.dart';
import 'package:tamine/utils/utils.dart';

class NationalCardPage extends GetView<CamerContorller> {
  const NationalCardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    if (controller.begin.value) {
      controller.begin.value = false;
      controller.ini();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(
        () => Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: query.size.width,
              child: controller.cameraController.value != null
                  ? CameraPreview(controller.cameraController.value!)
                  : const SizedBox(),
            ),
            Container(
              width: query.size.width / 3.52,
              height: query.size.height / 1.84,
              margin: EdgeInsets.symmetric(
                  horizontal: (query.size.width - query.size.width / 3.52) / 2,
                  vertical: (query.size.height - query.size.height / 1.84) / 2),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: kDefaultDuration),
                child: controller.loading.value
                    ? const SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green.withOpacity(0.7), width: 10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
              ),
            ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: controller.imageUni8.value != null
            //       ? Image.memory(controller.imageUni8.value!)
            //       : SizedBox(),
            // ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: AnimatedOpacity(
                  opacity: controller.text.value.isNotEmpty ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black26),
                    child: Text(
                      controller.text.value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => controller
            .recoginitionTaumin(MediaQuery.of(context), 2, onComplete: (a) {
          controller.text.value = a;
        }, context: context),
        child: const Icon(
          Icons.camera,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
