import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:mrz_parser/mrz_parser.dart';
import 'package:tamine/controller/camera_controller.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/controller/on_boarding_controller.dart';
import 'package:tamine/model/location_model.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/pages/children_page.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/pages/location_page.dart';
import 'package:tamine/pages/onboarding_pager.dart';
import 'package:tamine/pages/vefied_attachment.dart';
import 'package:tamine/sheet/modal.dart';
import 'package:tamine/utils/snackbar.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/family_meber_card.dart';
import 'package:tamine/widgets/fd_button.dart';

import '../model/child_model.dart';
import '../sheet/alert_dialog.dart';
import 'finish_page.dart';
import 'national_card_page.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final theme = Theme.of(context);
    final controller = Get.put(OnBoardingController());
    final controllerInformation = Get.put(InformationControler());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar:
      //     AppBar(title: Text(steps[controller.selectSteps.value].toString())),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Obx(
            () => Stack(
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
                    child: steps[controller.selectSteps.value] > 7
                        ? ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 24)
                                .copyWith(bottom: 120),
                            children: [
                              FamilyMeberCard(
                                connection: OptionModel(
                                    id: 10, title: "father_of_family"),
                                name:
                                    "${controllerInformation.fnController.text} ${controllerInformation.snController.text} ${controllerInformation.tnController.text} ${controllerInformation.fonController.text} ",
                                index: 0,
                              ),
                              const SizedBox(
                                height: kDefaultSpacing,
                              ),
                              Divider(
                                indent: 5,
                                endIndent: 5,
                                thickness: 3,
                                color:
                                    theme.colorScheme.outline.withOpacity(0.6),
                              ),
                              const SizedBox(
                                height: kDefaultSpacing,
                              ),
                              controllerInformation.childrenListModel.value
                                          .childildren.length <
                                      1
                                  ? const SizedBox()
                                  : Column(
                                      children: controllerInformation
                                          .childrenListModel.value.childildren
                                          .asMap()
                                          .map(
                                            (i, e) => MapEntry(
                                              i,
                                              FamilyMeberCard(
                                                connection: connectionTypeOptionAll
                                                            .indexWhere((element) =>
                                                                element.id ==
                                                                e.childData!
                                                                    .connectionType) >
                                                        -1
                                                    ? connectionTypeOptionAll
                                                        .where((element) =>
                                                            element.id ==
                                                            e.childData!
                                                                .connectionType)
                                                        .first
                                                    : OptionModel(
                                                        title: "زوجة",
                                                        id: -1,
                                                        index: -1),
                                                name:
                                                    "${e.childData!.name1} ${e.childData!.name2} ${e.childData!.nameLast}",
                                                index: i + 1,
                                              ),
                                            ),
                                          )
                                          .values
                                          .toList(),
                                    ),
                              FDButton(
                                title: "add_child_btn".tr(),
                                borderColor: Colors.transparent,
                                backgroundColor: (controllerInformation
                                                .childCount.value +
                                            (controllerInformation
                                                        .maritalStatusController
                                                        .value
                                                        .id ==
                                                    1
                                                ? 1
                                                : 0)) >
                                        0
                                    ? Colors.white
                                    : theme.colorScheme.outline,
                                color: theme.primaryColor,
                                icon: Icons.add,
                                onPressed: (controllerInformation
                                                .childCount.value +
                                            (controllerInformation
                                                        .maritalStatusController
                                                        .value
                                                        .id ==
                                                    1
                                                ? 1
                                                : 0)) >
                                        0
                                    ? () {
                                        if ((controllerInformation
                                                    .childCount.value +
                                                (controllerInformation
                                                            .maritalStatusController
                                                            .value
                                                            .id ==
                                                        1
                                                    ? 1
                                                    : 0)) ==
                                            controllerInformation
                                                .childrenListModel
                                                .value
                                                .childildren
                                                .value
                                                .length) {
                                          showSnackbar(context,
                                              subtitle: "لا يمكنك اضافة افراد",
                                              style: SnackbarStyle.alert);
                                          return;
                                        }
                                        clearChildForm(controllerInformation);
                                        if (controllerInformation
                                                    .maritalStatusController
                                                    .value
                                                    .id ==
                                                1 &&
                                            controllerInformation
                                                    .childrenListModel
                                                    .value
                                                    .childildren
                                                    .value
                                                    .length ==
                                                0) {
                                          controllerInformation
                                              .selectGanderChild.value = 1;
                                        } else {
                                          controllerInformation
                                              .selectGanderChild.value = 2;
                                        }
                                        // controllerInformation
                                        //     .isShowChildForm.value = true;
                                        controllerInformation
                                            .updateChild.value = false;
                                        showModal(
                                            context: context,
                                            builder: (c, s) =>
                                                ChildrenInformation(
                                                  title: controllerInformation
                                                                  .maritalStatusController
                                                                  .value
                                                                  .id ==
                                                              1 &&
                                                          controllerInformation
                                                                  .childrenListModel
                                                                  .value
                                                                  .childildren
                                                                  .value
                                                                  .length ==
                                                              0
                                                      ? "معلومات الزوجة "
                                                      : "children_information"
                                                          .tr(),
                                                  updateMode: false,
                                                  index: controllerInformation
                                                      .childrenListModel
                                                      .value
                                                      .childildren
                                                      .value
                                                      .length,
                                                ));
                                      }
                                    : () {},
                              )
                            ],
                          )
                        : const SizedBox()),
                AnimatedSlide(
                  offset: steps[controller.selectSteps.value] < 7
                      ? const Offset(-1, 0)
                      : steps[controller.selectSteps.value] > 7
                          ? const Offset(1, 0)
                          : const Offset(0, 0),
                  duration: const Duration(milliseconds: kDefaultDuration),
                  child: const PersonalInformation(),
                ),
                AnimatedSlide(
                  offset: steps[controller.selectSteps.value] < 9
                      ? const Offset(-1, 0)
                      : steps[controller.selectSteps.value] > 9
                          ? const Offset(1, 0)
                          : const Offset(0, 0),
                  duration: const Duration(milliseconds: kDefaultDuration),
                  child: const VerifedAttachmentSheet(),
                ),
                AnimatedSlide(
                  offset: steps[controller.selectSteps.value] < 8
                      ? const Offset(-1, 0)
                      : steps[controller.selectSteps.value] > 8
                          ? const Offset(1, 0)
                          : const Offset(0, 0),
                  duration: const Duration(milliseconds: kDefaultDuration),
                  child: const LocationInformation(),
                ),
                const ButtonNavigator(),
                // AnimatedSlide(
                //   offset: controller.isCardReaderShow.value
                //       ? const Offset(0, 0)
                //       : const Offset(0, 1),
                //   duration: const Duration(milliseconds: 200),
                //   child: const CardReaderPopUp(),
                // ),
                AnimatedSlide(
                  offset: controllerInformation.completeSubmit.value
                      ? const Offset(0, 0)
                      : const Offset(0, 1),
                  duration: const Duration(milliseconds: 200),
                  child: const FinishPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardReaderPopUp extends StatelessWidget {
  const CardReaderPopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final theme = Theme.of(context);
    final controller = Get.put(CamerContorller());
    final controllerOnboarding = Get.find<OnBoardingController>();

    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, -5), blurRadius: 10)
          ],
        ),
        child: Column(
          children: [
            ListTile(
              title: Text("استخدام تقنية NFC "),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "- التقط صور لاسفل الجهة الخلفية للبطاقة الوطنية",
                    style: controller.nfcStep.value == 0
                        ? theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.black)
                        : null,
                  ),
                  const SizedBox(
                    height: kDefaultSpacing,
                  ),
                  Text(
                    "- ضع البطاقة الوطنية خلف الهاتف اسفل الكاميرا",
                    style: controller.nfcStep.value == 1
                        ? theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.black)
                        : null,
                  )
                ],
              ),
            ),
            Text(controller.text.value),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: controller.nfcStep.value == 0
                    ? Lottie.asset(
                        'assets/animation/id_picture.json',
                      )
                    : Lottie.asset(
                        'assets/animation/id_read.json',
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              child: Row(
                children: [
                  Expanded(
                    flex: controller.nfcStep.value == 1 ? 3 : 2,
                    child: FDButton(
                      title: controller.nfcStep.value == 1 ? "السابق" : "",
                      icon: controller.nfcStep.value == 0
                          ? Icons.arrow_downward
                          : null,
                      backgroundColor: theme.scaffoldBackgroundColor,
                      color: Colors.black,
                      onPressed: () async {
                        if (controller.nfcStep.value == 0) {
                          controllerOnboarding.isCardReaderShow.value = false;
                          return;
                        }
                        controller.nfcStep.value--;
                      },
                    ),
                  ),
                  const SizedBox(width: kDefaultSpacing),
                  Expanded(
                    flex: controller.nfcStep.value == 1 ? 7 : 10,
                    child: FDButton(
                      title: controller.nfcStep.value == 0
                          ? "التقط"
                          : "امسح البطاقة",
                      onPressed: () async {
                        if (controller.nfcStep.value == 0) {
                          var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (C) => const NationalCardPage(),
                              ));
                          if (result != null && result is MRZResult) {
                            controller.nfcStep.value = 1;
                          }
                        } else {
                          controller.readNfc(
                              controller.mrzResult.value!, context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

clearChildForm(InformationControler infControler) {
  infControler.childCardTypeController.value =
      OptionModel(id: 10, title: "", index: 10);

  infControler.childStudyController.value =
      OptionModel(id: 10, title: "", index: 10);

  infControler.fnChildController.clear();
  infControler.snChildController.clear();
  infControler.tnChildController.clear();
  infControler.fonChildController.clear();
  infControler.lnChildController.clear();
  infControler.maritalStatusChildController.value =
      OptionModel(id: 10, title: "", index: 10);
  infControler.motherNameFChildController.clear();
  infControler.motherNameSChildController.clear();
  infControler.motherNameTChildController.clear();
  infControler.birthdayChildController.value.clear();
  infControler.selectGanderChild.value = 3;
  infControler.connectionTypeController.value =
      OptionModel(id: 10, title: "", index: 10);
  infControler.childStudyController.value =
      OptionModel(id: 10, title: "", index: 10);
  infControler.childCardTypeController.value =
      OptionModel(id: 10, title: "", index: 10);

  infControler.nationalNumberChildController.clear();

  infControler.familyNationalNumberChildController.clear();

  infControler.nationalDate1ChildController.value.clear();
  infControler.releaseNameController.clear();

  infControler.cardNumberChildController.clear();

  infControler.newSpaperNumberChildController.clear();
  infControler.recordCardChildController.clear();
  infControler.cardOffceNameChildController.clear();
  infControler.childCardImageF.value = LoadingModel(childImKeyF);
  infControler.childCardImageB.value = LoadingModel(childImKeyB);
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
              color: steps[controller.selectSteps.value] < 7
                  ? Colors.transparent
                  : theme.appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              boxShadow: steps[controller.selectSteps.value] < 7
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
                    right: steps[controller.selectSteps.value] < 1 ||
                            steps[controller.selectSteps.value] == 7
                        ? (query.height / 15) + kDefaultPadding / 2
                        : 0),
                child: FDButton(
                  title: "",
                  icon: steps[controller.selectSteps.value] == 10 &&
                          infControler.isShowChildForm.value
                      ? Icons.arrow_downward
                      : Icons.arrow_back,
                  backgroundColor: theme.colorScheme.surface,
                  color: Colors.black,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    if (steps[controller.selectSteps.value] == 10 &&
                        infControler.isShowChildForm.value) {
                      infControler.isShowChildForm.value = false;
                      infControler.updateChild.value = false;
                      return;
                    }
                    if (steps[controller.selectSteps.value] == 7) {
                      return;
                    }

                    // print(
                    //     "cach test=====11111===${steps.toString()}==${controller.selectSteps.value}");
                    controller.selectSteps.value--;
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
                    right: steps[controller.selectSteps.value] >= 1 &&
                            steps[controller.selectSteps.value] != 7
                        ? (query.height / 15) + kDefaultPadding / 2
                        : 0),
                child: FDButton(
                  isLoading: controller.loadingSentOtp.value ||
                      controller.loadingVerfiOtp.value,
                  title: steps[controller.selectSteps.value] == 0
                      ? "lets_go".tr()
                      : steps[controller.selectSteps.value] >= 1 &&
                              steps[controller.selectSteps.value] < 3
                          ? "next".tr()
                          : steps[controller.selectSteps.value] == 3
                              ? "brgin".tr()
                              : steps[controller.selectSteps.value] == 4
                                  ? "fill_data".tr()
                                  : steps[controller.selectSteps.value] == 5
                                      ? "accept".tr()
                                      : steps[controller.selectSteps.value] == 6
                                          ? "confirm".tr()
                                          : steps[controller
                                                      .selectSteps.value] ==
                                                  7
                                              ? "next".tr()
                                              : steps[controller
                                                          .selectSteps.value] ==
                                                      8
                                                  ? "next".tr()
                                                  : steps[controller.selectSteps
                                                              .value] ==
                                                          9
                                                      ? "next".tr()
                                                      : steps[controller
                                                                      .selectSteps
                                                                      .value] ==
                                                                  10 &&
                                                              infControler
                                                                  .isShowChildForm
                                                                  .value
                                                          ? infControler
                                                                  .updateChild
                                                                  .value
                                                              ? "update_children_btn"
                                                              : "add_children_btn"
                                                                  .tr()
                                                          : "send_btn".tr(),
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    switch (steps[controller.selectSteps.value].toInt()) {
                      case 0:
                        controller.selectSteps.value++;
                        break;
                      case 1:
                        controller.selectSteps.value++;
                        break;
                      case 2:
                        controller.selectSteps.value++;
                        break;
                      case 3:
                        controller.selectSteps.value++;
                        break;
                      case 4:
                        controller.selectSteps.value++;
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
                              context, () {
                            controller.selectSteps.value++;
                          });
                        }
                        break;

                      case 7:
                        validateFatherOfFamily(infControler, () {
                          controller.selectSteps.value++;
                          infControler.getLocationData(context);
                        });
                        break;

                      case 9:
                        validateExtraInfo(infControler, () {
                          controller.selectSteps.value++;
                          infControler.getChildrenData(context);
                        });
                        break;
                      case 8:
                        validateLocationInformation(
                            infControler, () => controller.selectSteps.value++);

                        break;

                      case 10:
                        if (infControler.childCount.value <=
                            infControler.childrenListModel.value.childildren
                                .value.length) {
                          infControler.saveChildrenListData();
                          infControler.completeSubmit.value = true;
                          showFDDialog(
                            context,
                            title: "تم حفظ المعلومات",
                            msg: "",
                            icon: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 45,
                            ),
                          );
                        }
                        break;

                      default:
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateExtraInfo(InformationControler infControler, Function() onValidate) {
    switch (infControler.maritalStatusController.value.id) {
      case 0:
        if (infControler.motherDeathImage.value.loading.value ==
                Upload.uploaded &&
            infControler.fatherDeathImage.value.loading.value ==
                Upload.uploaded) {
          infControler.isShowError.value = false;
          var extraData = ExtraDataModel(
            fatherDath: infControler.fatherDeathImage.value.path.value,
            motherDath: infControler.motherDeathImage.value.path.value,
            childNumber: infControler.childCount.value,
            marid: "",
            disMarid: "",
            hasbandDath: "",
            childGet: "",
          );

          infControler.tawminData!.childData!.extraDataModel = extraData;
          infControler.saveFatherData(infControler.tawminData!);
          onValidate();
          return;
        }
        infControler.isShowError.value = true;
        break;

      case 1:
        if (infControler.maridImage.value.loading.value == Upload.uploaded) {
          infControler.isShowError.value = false;
          var extraData = ExtraDataModel(
            marid: infControler.maridImage.value.path.value,
            childNumber: infControler.childCount.value,
            disMarid: "",
            hasbandDath: "",
            fatherDath: "",
            motherDath: "",
            childGet: "",
          );

          infControler.tawminData!.childData!.extraDataModel = extraData;
          infControler.saveFatherData(infControler.tawminData!);
          onValidate();
          return;
        }
        infControler.isShowError.value = true;
        break;

      case 2:
        if (infControler.husbandDeathImage.value.loading.value ==
            Upload.uploaded) {
          infControler.isShowError.value = false;
          var extraData = ExtraDataModel(
            hasbandDath: infControler.husbandDeathImage.value.path.value,
            childNumber: infControler.childCount.value,
            marid: "",
            disMarid: "",
            fatherDath: "",
            motherDath: "",
            childGet: "",
          );
          infControler.tawminData!.childData!.extraDataModel = extraData;
          infControler.saveFatherData(infControler.tawminData!);
          onValidate();
          return;
        }
        infControler.isShowError.value = true;
        break;

      case 3:
        if (infControler.deMaridImage.value.loading.value != Upload.uploaded ||
            (infControler.childCount.value > 0 &&
                infControler.custodyDecision.value.loading.value !=
                    Upload.uploaded)) {
          var extraData = ExtraDataModel(
            disMarid: infControler.deMaridImage.value.path.value,
            childGet: infControler.custodyDecision.value.path.value,
            childNumber: infControler.childCount.value,
            marid: "",
            hasbandDath: "",
            fatherDath: "",
            motherDath: "",
          );
          infControler.tawminData!.childData!.extraDataModel = extraData;
          infControler.saveFatherData(infControler.tawminData!);
          infControler.isShowError.value = true;
          return;
        }

        onValidate();
        infControler.isShowError.value = false;

        break;
      default:
    }
  }

  validateFatherOfFamily(
      InformationControler infControler, Function() onValidate) {
    infControler.ganderValidate(infControler.selectGander1);

    if (infControler.personalForm.currentState!.validate() &&
        infControler.ganderValidate(infControler.selectGander1)) {
      if (infControler.fatherCardImageF.value.loading.value !=
              Upload.uploaded ||
          infControler.fatherCardImageB.value.loading.value !=
              Upload.uploaded ||
          infControler.fatherFaceImage.value.loading.value != Upload.uploaded) {
        infControler.isShowError.value = true;
        Scrollable.ensureVisible(
          infControler.personInfoKey.currentContext!,
          duration: const Duration(milliseconds: 200),
        );
        return;
      }
      if (infControler.maritalStatusController.value.id == 1 &&
          infControler.childrenListModel.value.childildren.value.length == 0) {
        infControler.connectionTypeController.value =
            infControler.connectionMotherTypeController.value;
      }

      var data = ChildInfoModel(
        childData: ChildData(
          id: 1,
          name1: infControler.fnController.text,
          name2: infControler.snController.text,
          name3: infControler.tnController.text,
          name4: infControler.fonController.text,
          nameLast: infControler.lnController.text,
          nameMother:
              "${infControler.motherFNameController.text}@${infControler.motherSNameController.text}@${infControler.motherTNameController.text}",
          birthday: infControler.birthdayController.value.text,
          gander: infControler.selectGander1.value,
          connectionType: -1,
          studyType: infControler.studyController.value.id,
          personalCase: infControler.maritalStatusController.value.id,
          workType: infControler.paterfamiliasWorkTypeController.value.id,
          workPlace: infControler.workPlaceController.value.id,
          workTitle: infControler.workTitleController.text,
          salary: infControler.paterfamiliasSalaryController.value.text,
          fatherImage: infControler.fatherFaceImage.value.path.value,
          cardType: infControler.personalCardTypeController.value.id,
          pathF: infControler.fatherCardImageF.value.path.value,
          pathB: infControler.fatherCardImageB.value.path.value,
          cardInfo: CardInfo(
              cardType: infControler.personalCardTypeController.value.id,
              nationalNumber: infControler.nationalNumberController.text,
              familyNumber: infControler.familyNationalNumberController.text,
              releaseDate: infControler.nationalDate1Controller.value.text,
              releaseName: infControler.releaseNameController.text,
              statusIdentificationNumber:
                  infControler.cardNumberController.text,
              newspaperNumber: infControler.newSpaperNumberController.text,
              recordNumber: infControler.recordCardController.text,
              officeName: infControler.cardOffceNameController.text),
        ),
      );
      print("ttetgv3333  ${data.childData!.cardInfo!.officeName}");
      infControler.saveFatherData(data);

      onValidate();
      infControler.isShowError.value = false;
    }
  }

  validateLocationInformation(
      InformationControler infControler, Function() onValidate) {
    infControler.ganderValidate(infControler.isThereLocationCard);
    if (infControler.locationForm.currentState!.validate() &&
        infControler.ganderValidate(infControler.isThereLocationCard)) {
      if ((infControler.isThereLocationCard.value == 0 &&
              (infControler.backLocationCardImage.value.loading.value !=
                      Upload.uploaded ||
                  infControler.frontLocationCardImage.value.loading.value !=
                      Upload.uploaded)) ||
          (infControler.isThereLocationCard.value == 1 &&
              infControler.locationConfirme.value.loading.value !=
                  Upload.uploaded)) {
        infControler.isShowError.value = true;
        Scrollable.ensureVisible(
            // controller.keyss.value[i].currentContext!,
            infControler.locationInfoKey.currentContext!,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear);
        return;
      }
      var data = LocationModel(
          isLocationCard: infControler.isThereLocationCard.value,
          number: infControler.locationNumberController.value.text,
          serialNumber: infControler.locationSerialNumberController.text,
          province: infControler.locationProvinceChooserController.value.id,
          city: infControler.locationCityChooserController.value.id,
          description: infControler.locationDescController.text,
          l1: infControler.locationStreet1Controller.text,
          l2: infControler.locationStreet2Controller.text,
          l3: infControler.locationStreet3Controller.text,
          image: infControler.locationConfirme.value.path.value,
          locationOffice: infControler.locationOfficeController.text,
          cardfimage: infControler.frontLocationCardImage.value.path.value,
          cardbimage: infControler.backLocationCardImage.value.path.value);
      print(
          "cach test ====im1==${infControler.frontLocationCardImage.value.path.value}==${data.cardfimage}");
      print(
          "cach test ====im2==${infControler.backLocationCardImage.value.path.value}");
      infControler.saveLocationrData(data);
      onValidate();
      infControler.isShowError.value = false;
    }
  }
}
