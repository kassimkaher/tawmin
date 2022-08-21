import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/controller/on_boarding_controller.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/pages/onboarding_pager.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final theme = Theme.of(context);
    final controller = Get.put(OnBoardingController());
    final controllerInformation = Get.put(InformationControler());
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              Container(
                height: query.size.height,
                width: query.size.width,
                color: theme.scaffoldBackgroundColor,
                child: const Text("  "),
              ),
              OnBordingView(),

              AnimatedSwitcher(
                  duration: const Duration(milliseconds: kDefaultDuration),
                  child: controller.steps.value > 7
                      ? ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              padding: EdgeInsets.all(kDefaultPadding),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorderRadius),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "father_of_family".tr(),
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      const Spacer(),
                                      FDButton(
                                        title: "تعديل",
                                        padding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        color: theme.primaryColor,
                                        borderColor: Colors.transparent,
                                        textStyle: theme.textTheme.titleSmall
                                            ?.copyWith(
                                          color: theme.primaryColor,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2,
                                        ),
                                      ),
                                      SvgPicture.asset("assets/svg/edit.svg")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: kDefaultSpacing,
                                  ),
                                  Text(
                                    "${controllerInformation.fnController.text} ${controllerInformation.snController.text} ${controllerInformation.tnChildController.text}",
                                    style: theme.textTheme.titleMedium,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : const SizedBox()),

              Obx(
                () => AnimatedSlide(
                  offset: controller.steps.value < 7
                      ? const Offset(0, 1)
                      : const Offset(0, 0),
                  duration: const Duration(milliseconds: kDefaultDuration),
                  child: InputInformationPage(),
                ),
              ),
              // Obx(
              //   () => AnimatedSlide(
              //     offset: controller.steps.value < 8
              //         ? const Offset(0, 1)
              //         : const Offset(0, 0),
              //     duration: const Duration(milliseconds: kDefaultDuration),
              //     child: LocationInformation(),
              //   ),
              // ),
              const ButtonNavigator(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonNavigator extends GetView<OnBoardingController> {
  const ButtonNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context).size;
    final infControler = Get.find<InformationControler>();
    return Obx(
      () => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: kDefaultDuration),
          decoration: BoxDecoration(
              color: controller.steps.value < 7
                  ? Colors.transparent
                  : theme.appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              boxShadow: controller.steps.value < 7
                  ? null
                  : const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: const Offset(0, -5),
                          blurRadius: 10)
                    ]),
          padding: const EdgeInsets.all(kDefaultPadding),
          alignment: Alignment.center,
          height: query.height / 8.115,
          width: query.width,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: kDefaultDuration),
                height: query.height / 15,
                width: query.height / 15,
                margin: EdgeInsets.only(
                    right: controller.steps.value < 1 ||
                            controller.steps.value == 7
                        ? (query.height / 15) + kDefaultPadding / 2
                        : 0),
                child: FDButton(
                  title: "",
                  icon: Icons.arrow_back,
                  backgroundColor: theme.colorScheme.surface,
                  color: Colors.black,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (controller.steps == 7) {
                      return;
                    }
                    if (controller.steps.value > 7) {
                      controller.steps.value--;
                      infControler.pageController.animateToPage(
                          (controller.steps.value - 7).toInt(),
                          duration:
                              const Duration(milliseconds: kDefaultDuration),
                          curve: Curves.linear);
                    }
                    if (controller.steps.value < 7) {
                      controller.steps.value--;
                      controller.steps.value =
                          (controller.steps.value ~/ 1).toDouble();
                    }
                  },
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: kDefaultDuration),
                child: const SizedBox(width: kDefaultPadding / 2),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: kDefaultDuration),
                margin: EdgeInsets.only(
                    right: controller.steps.value >= 1 &&
                            controller.steps.value != 7
                        ? (query.height / 15) + kDefaultPadding / 2
                        : 0),
                child: FDButton(
                  isLoading: controller.loadingSentOtp.value ||
                      controller.loadingVerfiOtp.value,
                  title: controller.steps.value == 0
                      ? "lets_go".tr()
                      : controller.steps.value >= 1 &&
                              controller.steps.value < 3
                          ? "next".tr()
                          : controller.steps.value == 3
                              ? "brgin".tr()
                              : controller.steps.value == 4
                                  ? "fill_data".tr()
                                  : controller.steps.value == 5
                                      ? "accept".tr()
                                      : controller.steps.value == 6
                                          ? "confirm".tr()
                                          : controller.steps.value == 7
                                              ? "add_location_information".tr()
                                              : controller.steps.value == 8
                                                  ? "add_person_information"
                                                      .tr()
                                                  : controller.steps.value ==
                                                              9 &&
                                                          infControler
                                                              .isAddChildrenShow
                                                              .value
                                                      ? "add_children_btn".tr()
                                                      : "send_btn".tr(),
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    switch (controller.steps.value.toInt()) {
                      case 0:
                        controller.steps.value++;
                        break;
                      case 1:
                        controller.steps.value++;
                        break;
                      case 2:
                        controller.steps.value++;
                        break;
                      case 3:
                        controller.steps.value++;
                        break;
                      case 4:
                        controller.steps.value++;
                        break;

                      case 5:
                        if (controller.nameForm.currentState!.validate()) {
                          controller.requestOtpApi(
                              int.parse(controller.phoneController.text),
                              context);
                        }
                        break;

                      case 6:
                        if (controller.codeForm.currentState!.validate()) {
                          controller.verfiOtpApi(
                            int.parse(controller.phoneController.text),
                            "${controller.code1Controller.text}${controller.code2Controller.text}${controller.code3Controller.text}${controller.code4Controller.text}${controller.code5Controller.text}${controller.code6Controller.text}",
                            context,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => InputInformationPage(),
                              ),
                            ),
                          );
                        }
                        break;

                      case 7:
                        infControler
                            .ganderValidate(infControler.gander1Controller);
                        if (infControler.personalForm.currentState!
                                .validate() &&
                            infControler.ganderValidate(
                                infControler.gander1Controller)) {
                          if (infControler.backCardImage.value.isEmpty ||
                              infControler.frontCardImage.value.isEmpty) {
                            infControler.isAddChildrenShow.value = true;
                            Scrollable.ensureVisible(
                              // controller.keyss.value[i].currentContext!,
                              infControler.fatherCardImages.currentContext!,
                              duration: const Duration(milliseconds: 200),
                            );
                            return;
                          }

                          controller.steps.value++;
                          infControler.isAddChildrenShow.value = false;
                          infControler.pageController.animateToPage(
                              (controller.steps.value - 7).toInt(),
                              duration: const Duration(
                                  milliseconds: kDefaultDuration),
                              curve: Curves.linear);
                        }
                        break;

                      case 8:
                        if (infControler.locationForm.currentState!
                            .validate()) {
                          if (infControler
                                  .backLocationCardImage.value.isEmpty ||
                              infControler
                                  .frontLocationCardImage.value.isEmpty) {
                            infControler.isAddChildrenShow.value = true;
                            Scrollable.ensureVisible(
                                // controller.keyss.value[i].currentContext!,
                                infControler.locationInfoKey.currentContext!,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.linear);
                            return;
                          }
                          controller.steps.value++;
                          infControler.isAddChildrenShow.value = false;
                          infControler.pageController.animateToPage(
                              (controller.steps.value - 7).toInt(),
                              duration: const Duration(
                                  milliseconds: kDefaultDuration),
                              curve: Curves.linear);
                        }

                        break;

                      case 9:
                        controller.steps.value++;
                        break;

                      default:
                    }

                    // if (controller.steps.value == 6 &&
                    //     controller.codeForm.currentState!.validate()) {
                    //   controller.verfiOtpApi(
                    //     int.parse(controller.phoneController.text),
                    //     "${controller.code1Controller.text}${controller.code2Controller.text}${controller.code3Controller.text}${controller.code4Controller.text}${controller.code5Controller.text}${controller.code6Controller.text}",
                    //     context,
                    //     () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (c) => InputInformationPage(),
                    //       ),
                    //     ),
                    //   );
                    // }

                    // if (controller.steps.value == 5 &&
                    //     controller.nameForm.currentState!.validate()) {
                    //   controller.requestOtpApi(
                    //       int.parse(controller.phoneController.text), context);
                    // }

                    // if (controller.steps.value == 7 &&
                    //     infControler.personalForm.currentState!.validate() &&
                    //     infControler
                    //         .ganderValidate(infControler.gander1Controller)) {
                    //   controller.steps.value++;

                    //   infControler.pageController.animateToPage(
                    //       (controller.steps.value - 7).toInt(),
                    //       duration:
                    //           const Duration(milliseconds: kDefaultDuration),
                    //       curve: Curves.linear);
                    // }
                    // if (controller.steps.value == 8) {
                    //   controller.steps.value++;

                    //   infControler.pageController.animateToPage(
                    //       (controller.steps.value - 7).toInt(),
                    //       duration:
                    //           const Duration(milliseconds: kDefaultDuration),
                    //       curve: Curves.linear);
                    // }

                    // if (controller.steps.value >= 7) {
                    //   controller.steps.value++;

                    //   infControler.pageController.animateToPage(
                    //       (controller.steps.value - 7).toInt(),
                    //       duration:
                    //           const Duration(milliseconds: kDefaultDuration),
                    //       curve: Curves.linear);
                    // }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
