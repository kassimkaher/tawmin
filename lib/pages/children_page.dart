import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/model/child_model.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/services/validation.dart';
import 'package:tamine/utils/snackbar.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';
import 'package:tamine/widgets/fd_dropdown.dart';
import 'package:tamine/widgets/fd_text_input.dart';
import 'package:tamine/widgets/ks_choois_tow.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../sheet/alert_dialog.dart';

class ChildrenInformation extends GetView<InformationControler> {
  const ChildrenInformation(
      {Key? key,
      required this.updateMode,
      required this.index,
      required this.title})
      : super(key: key);
  final bool updateMode;
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      height: null,
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, offset: Offset(0, -5), blurRadius: 10)
        ],
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Form(
                key: controller.childrenForm,
                child: ListView(
                  controller: controller.scrollController.value,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: query.height / 5.2515),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: kDefaultSpacing),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "first_name".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller: controller.fnChildController,
                                    isRequired: Validator.required,
                                    validator: Validator.textOnly,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "first_name".tr(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "second_name".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller: controller.snChildController,
                                    isRequired: Validator.required,
                                    validator: Validator.textOnly,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "second_name".tr(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kDefaultSpacing),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "third_name".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller: controller.tnChildController,
                                    isRequired: Validator.required,
                                    validator: Validator.textOnly,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "third_name".tr(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "fourth_name".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller: controller.fonChildController,
                                    isRequired: Validator.required,
                                    validator: Validator.textOnly,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "fourth_name".tr(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "last_name".tr(),
                            style: theme.textTheme.titleSmall,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: FDTextInput(
                              controller: controller.lnChildController,
                              isRequired: Validator.required,
                              validator: Validator.textOnly,
                              topPadding: kDefaultPadding,
                              bottomPadding: kDefaultPadding,
                              leftPadding: 0,
                              rightPadding: kDefaultPadding,
                              borderColor: Colors.transparent,
                              label: "last_name".tr(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "mother_name".tr(),
                            style: theme.textTheme.titleSmall,
                          ),
                          subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: FDTextInput(
                                          controller: controller
                                              .motherNameFChildController,
                                          isRequired: Validator.required,
                                          validator: Validator.textOnly,
                                          topPadding: kDefaultPadding,
                                          bottomPadding: kDefaultPadding,
                                          leftPadding: kDefaultSpacing,
                                          rightPadding: kDefaultSpacing,
                                          borderColor: Colors.transparent,
                                          label: "الاول",
                                          errorStyle: const TextStyle(
                                              color: kErrorColor, fontSize: 12),
                                        ),
                                      ),
                                      const SizedBox(
                                          width: kDefaultSpacing / 2),
                                      Expanded(
                                        child: FDTextInput(
                                          controller: controller
                                              .motherNameSChildController,
                                          isRequired: Validator.required,
                                          validator: Validator.textOnly,
                                          topPadding: kDefaultPadding,
                                          bottomPadding: kDefaultPadding,
                                          leftPadding: 0,
                                          rightPadding: kDefaultPadding,
                                          borderColor: Colors.transparent,
                                          label: "الثاني".tr(),
                                          errorStyle: const TextStyle(
                                              color: kErrorColor, fontSize: 12),
                                        ),
                                      ),
                                      const SizedBox(
                                          width: kDefaultSpacing / 2),
                                      Expanded(
                                        child: FDTextInput(
                                          controller: controller
                                              .motherNameTChildController,
                                          isRequired: Validator.required,
                                          validator: Validator.textOnly,
                                          topPadding: kDefaultPadding,
                                          bottomPadding: kDefaultPadding,
                                          leftPadding: 0,
                                          rightPadding: kDefaultPadding,
                                          borderColor: Colors.transparent,
                                          label: "الثالث".tr(),
                                          errorStyle: const TextStyle(
                                              color: kErrorColor, fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(width: 16),
                        Obx(
                          () => ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              "birthday".tr(),
                              style: theme.textTheme.titleSmall,
                            ),
                            subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: FDTextInput(
                                  controller:
                                      controller.birthdayChildController.value,
                                  isRequired: Validator.required,
                                  topPadding: kDefaultPadding,
                                  bottomPadding: kDefaultPadding,
                                  leftPadding: 0,
                                  rightPadding: kDefaultPadding,
                                  borderColor: Colors.transparent,
                                  label: "birthday_s".tr(),
                                  readOnly: true,
                                  suffixIcon: IconButton(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    onPressed: () => controller.selectDate(
                                        context,
                                        controller.birthdayChildController),
                                    icon: SvgPicture.asset(
                                        "assets/svg/calendar.svg"),
                                  ),
                                  onTap: () {
                                    controller.selectDate(context,
                                        controller.birthdayChildController);
                                  },
                                )),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Visibility(
                          visible:
                              !(controller.maritalStatusController.value.id ==
                                      1 &&
                                  controller.childrenListModel.value
                                          .childildren!.length ==
                                      0),
                          child: ChooiseTwoWidget(
                            option1: ganderOptions[0],
                            option2: ganderOptions[1],
                            ganderController: controller.selectGanderChild,
                            title: "gander".tr(),
                            errorMessage: "gander_required".tr(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "connection_type".tr(),
                            style: theme.textTheme.titleSmall,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Obx(
                              () => FDDropDownMenu(
                                selectValue: (controller.maritalStatusController
                                                    .value.id ==
                                                1 &&
                                            controller.childrenListModel.value
                                                    .childildren!.length ==
                                                0) ||
                                        (controller.maritalStatusController
                                                    .value.id ==
                                                1 &&
                                            controller.childrenListModel.value
                                                    .childildren.length ==
                                                1 &&
                                            controller.updateChild.value)
                                    ? controller.connectionMotherTypeController
                                    : controller.connectionTypeController,
                                borderColor: Colors.transparent,
                                readOnly: (controller.maritalStatusController
                                                .value.id ==
                                            1 &&
                                        controller.childrenListModel.value
                                                .childildren!.length ==
                                            0) ||
                                    (controller.maritalStatusController.value
                                                .id ==
                                            1 &&
                                        controller.childrenListModel.value
                                                .childildren!.length ==
                                            1 &&
                                        controller.updateChild.value),
                                array: connectionTypeOptionList[controller
                                    .maritalStatusController.value.id!],
                                hint: "connection_type".tr(),
                                onSelect: (d) {
                                  controller.connectionTypeController.value = d;
                                },
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible:
                                !(controller.maritalStatusController.value.id ==
                                        1 &&
                                    index == 0),
                            child: Column(
                              children: [
                                const SizedBox(width: 16),
                                controller.maritalStatusChildController.value
                                            .id ==
                                        1
                                    ? SizedBox()
                                    : ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          "personal_case".tr(),
                                          style: theme.textTheme.titleSmall,
                                        ),
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: FDDropDownMenu(
                                            selectValue: controller
                                                .maritalStatusChildController,
                                            borderColor: Colors.transparent,
                                            array: maritalStatusOptions,
                                            hint: "personal_case".tr(),
                                            onSelect: (OptionModel d) {
                                              print(
                                                  "982347892hfhfu====${d.id}==${d.title}");
                                              if (d.id == 1) {
                                                controller
                                                    .maritalStatusChildController
                                                    .value = d;

                                                Future.delayed(
                                                  const Duration(
                                                      milliseconds: 50),
                                                ).then((a) => controller
                                                        .maritalStatusChildController
                                                        .value =
                                                    OptionModel(
                                                        id: 10,
                                                        title: "kkkk",
                                                        index: 10));
                                                showFDDialog(context,
                                                    title: "faild_operation",
                                                    msg:
                                                        "لا يمكن اضافة الفرد المتزوج الى العائلة \n الرجاء اضافة الافراد الغير متزوجين",
                                                    icon: const Icon(
                                                      Icons
                                                          .warning_amber_rounded,
                                                      color: kErrorColor,
                                                      size: 45,
                                                    ));
                                              } else {
                                                print(
                                                    "982347892hfhfu44====${d.id}==${d.title}");
                                                controller
                                                    .maritalStatusChildController
                                                    .value = d;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "study_case".tr(),
                            style: theme.textTheme.titleSmall,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: FDDropDownMenu(
                              selectValue: controller.childStudyController,
                              borderColor: Colors.transparent,
                              array: academicAchievementOptions,
                              hint: "menu_choose".tr(),
                              onSelect: (d) {
                                controller.childStudyController.value = d;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const NationalCardContainerInfoChild()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: kDefaultSpacing),
              width: query.width,
              child: Row(
                children: [
                  SizedBox(
                    height: query.height / 15,
                    width: query.height / 15,
                    child: FDButton(
                      title: "",
                      icon: Icons.arrow_downward,
                      backgroundColor: theme.colorScheme.surface,
                      color: Colors.black,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding / 2),
                  Expanded(
                    child: FDButton(
                      title: updateMode
                          ? "update_children_btn".tr()
                          : "add_children_btn".tr(),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        validateChildrenInformation(
                            controller, () => null, context);
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

  validateChildrenInformation(InformationControler infControler,
      Function() onValidate, BuildContext context) {
    infControler.ganderValidate(infControler.selectGanderChild);

    if (infControler.childrenForm.currentState!.validate() &&
        infControler.ganderValidate(infControler.selectGanderChild)) {
      if (infControler.childCardImageF.value.path.value.isEmpty ||
          infControler.childCardImageB.value.path.value.isEmpty) {
        infControler.isShowError.value = true;
        Scrollable.ensureVisible(infControler.childrenInfoKey.currentContext!,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
        return;
      }

      // if (infControler.childrenDataMOdel.value.childildren!.length ==
      //     infControler.childCount.value) {
      //   infControler.isShowChildForm.value = false;
      //   infControler.isShowError.value = false;
      //   showSnackbar(context,
      //       subtitle: "لا يمكنك اضافة افراد", style: SnackbarStyle.alert);

      //   return;
      // }

      if (infControler.maritalStatusController.value.id == 1 &&
          infControler.childrenListModel.value.childildren!.length == 0) {
        infControler.connectionTypeController.value =
            infControler.connectionMotherTypeController.value;
      }
      var data = ChildInfoModel(
        childData: ChildData(
          id: infControler.childrenListModel.value.childildren!.length,
          name1: infControler.fnChildController.text,
          name2: infControler.snChildController.text,
          name3: infControler.tnChildController.text,
          name4: infControler.fonChildController.text,
          nameLast: infControler.lnChildController.text,
          nameMother:
              "${infControler.motherNameFChildController.text}@${infControler.motherNameSChildController.text}@${infControler.motherNameTChildController.text}",
          birthday: infControler.birthdayChildController.value.text,
          gander: infControler.selectGanderChild.value,
          connectionType: infControler.connectionTypeController.value.id,
          studyType: infControler.childStudyController.value.id,
          cardType: infControler.childCardTypeController.value.id,
          pathF: infControler.childCardImageF.value.path.value,
          pathB: infControler.childCardImageB.value.path.value,
          personalCase: infControler.maritalStatusChildController.value.id,
          cardInfo: CardInfo(
              cardType: infControler.childCardTypeController.value.id,
              nationalNumber: infControler.nationalNumberChildController.text,
              familyNumber:
                  infControler.familyNationalNumberChildController.text,
              releaseDate: infControler.nationalDate1ChildController.value.text,
              releaseName: infControler.releaseNameController.text,
              statusIdentificationNumber:
                  infControler.cardNumberChildController.text,
              newspaperNumber: infControler.newSpaperNumberChildController.text,
              recordNumber: infControler.recordCardChildController.text,
              officeName: infControler.cardOffceNameChildController.text),
        ),
      );

      if (infControler.updateChild.value) {
        infControler.childrenListModel.value.childildren![index] = data;

        infControler.update();
      } else {
        infControler.childrenListModel.value.childildren!.add(data);
        infControler.childrenListModel.update((val) {});
        infControler.update();
      }

      //   clear form

      onValidate();
      infControler.childrenForm.currentState!.reset();
      infControler.isShowChildForm.value = false;
      infControler.isShowError.value = false;
      Navigator.pop(context);
    }
  }
}

class NationalCardContainerInfoChild extends GetView<InformationControler> {
  const NationalCardContainerInfoChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "personal_card_type".tr(),
            style: theme.textTheme.titleSmall,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: FDDropDownMenu(
              selectValue: controller.childCardTypeController,
              borderColor: Colors.transparent,
              array: cardTypeOptions,
              hint: "menu_choose".tr(),
              onSelect: (d) {
                controller.childCardTypeController.value = d;
              },
            ),
          ),
        ),
        const SizedBox(width: 16),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: controller.childCardTypeController.value.id! > 9
                ? const SizedBox()
                : controller.childCardTypeController.value.id == 0
                    ? NationalCard(
                        number: controller.nationalNumberChildController,
                        familyNumber:
                            controller.familyNationalNumberChildController,
                        releasDate: controller.nationalDate1ChildController,
                        releaseName: controller.releaseNameController,
                      )
                    : CivilAffairsCard(
                        number: controller.cardNumberChildController,
                        newspaperNumber:
                            controller.newSpaperNumberChildController,
                        recordNumber: controller.recordCardChildController,
                        officeName: controller.cardOffceNameChildController,
                      ),
          ),
        ),
        const SizedBox(width: 16),
        VisibilityDetector(
          key: controller.childrenInfoKey,
          onVisibilityChanged: (a) {},
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "personal_card_image".tr(),
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ImageCardPicker(
                        type: 1,
                        title: "front_face".tr(),
                        loadingModel: controller.childCardImageF,
                        onClick: (a) {
                          controller.childCardImageF.value.path.value = a.path;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding / 2),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ImageCardPicker(
                        type: 1,
                        title: "back_face".tr(),
                        loadingModel: controller.childCardImageB,
                        onClick: (a) {
                          controller.childCardImageB.value.path.value = a.path;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
