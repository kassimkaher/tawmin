import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/controller/on_boarding_controller.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/pages/children_page.dart';
import 'package:tamine/services/validation.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/face_picker.dart';
import 'package:tamine/widgets/fd_button.dart';
import 'package:tamine/widgets/fd_dropdown.dart';
import 'package:tamine/widgets/fd_text_input.dart';
import 'package:tamine/widgets/ks_choois_tow.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PersonalInformation extends GetView<InformationControler> {
  const PersonalInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final controllerOnboarding = Get.find<OnBoardingController>();
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          boxShadow: controller.steps.value < 7
              ? null
              : const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -5),
                      blurRadius: 10)
                ],
        ),
        child: Form(
          key: controller.personalForm,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: query.height / 5.2515),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VisibilityDetector(
                    key: controller.firstPageKey,
                    onVisibilityChanged: (s) {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "person_info_title".tr(),
                          style: theme.textTheme.titleMedium,
                        ),
                        const Spacer(),
                        // FDButton(
                        //     backgroundColor: Colors.transparent,
                        //     padding: EdgeInsets.zero,
                        //     borderColor: Colors.transparent,
                        //     textStyle: theme.textTheme.bodyMedium?.copyWith(
                        //       decoration: TextDecoration.underline,
                        //       color: Colors.green,
                        //     ),
                        //     onPressed: () => controllerOnboarding
                        //         .isCardReaderShow.value = true,
                        //     title: "استخدم NFC")
                        SizedBox()
                      ],
                    ),
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
                              controller: controller.fnController,
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
                              controller: controller.snController,
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
                              controller: controller.tnController,
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
                              controller: controller.fonController,
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
                        controller: controller.lnController,
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
                      "birthday".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: FDTextInput(
                          controller: controller.birthdayController.value,
                          isRequired: Validator.required,
                          topPadding: kDefaultPadding,
                          bottomPadding: kDefaultPadding,
                          leftPadding: 0,
                          rightPadding: kDefaultPadding,
                          borderColor: Colors.transparent,
                          label: "birthday_s".tr(),
                          readOnly: true,
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            onPressed: () => controller.selectDate(
                                context, controller.birthdayController),
                            icon: SvgPicture.asset("assets/svg/calendar.svg"),
                          ),
                          onTap: () {
                            controller.selectDate(
                                context, controller.birthdayController);
                          },
                        )),
                  ),
                  const SizedBox(width: 16),
                  ChooiseTwoWidget(
                    option1: ganderOptions[0],
                    option2: ganderOptions[1],
                    ganderController: controller.selectGander1,
                    title: "gander".tr(),
                    errorMessage: "gander_required".tr(),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: FDTextInput(
                                    controller:
                                        controller.motherFNameController,
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
                                const SizedBox(width: kDefaultSpacing / 2),
                                Expanded(
                                  child: FDTextInput(
                                    controller:
                                        controller.motherSNameController,
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
                                const SizedBox(width: kDefaultSpacing / 2),
                                Expanded(
                                  child: FDTextInput(
                                    controller:
                                        controller.motherTNameController,
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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "personal_case".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDDropDownMenu(
                        selectValue: controller.maritalStatusController,
                        borderColor: Colors.transparent,
                        array: maritalStatusOptions,
                        hint: "menu_choose".tr(),
                        onSelect: (OptionModel d) {
                          controller.maritalStatusController.value = d;
                          controller.childrenListModel.value.childildren.value =
                              [];
                        },
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
                        selectValue: controller.studyController,
                        borderColor: Colors.transparent,
                        array: academicAchievementOptions,
                        hint: "menu_choose".tr(),
                        onSelect: (d) {
                          controller.studyController.value = d;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "work_type".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDDropDownMenu(
                        selectValue: controller.paterfamiliasWorkTypeController,
                        borderColor: Colors.transparent,
                        array: workTypeOptions,
                        hint: "menu_choose".tr(),
                        onSelect: (d) {
                          controller.paterfamiliasWorkTypeController.value = d;
                        },
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: kDefaultDuration),
                    child: controller
                                    .paterfamiliasWorkTypeController.value.id ==
                                1 ||
                            controller
                                    .paterfamiliasWorkTypeController.value.id ==
                                2
                        ? Column(
                            children: [
                              const SizedBox(width: 16),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "work_place".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDDropDownMenu(
                                    selectValue: controller.workPlaceController,
                                    borderColor: Colors.transparent,
                                    array: workPlaceList,
                                    hint: "menu_choose".tr(),
                                    onSelect: (d) {
                                      controller.workPlaceController.value = d;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "work_title".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller: controller.workTitleController,
                                    isRequired: Validator.required,
                                    validator: Validator.textOnly,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "work_title".tr(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: kDefaultDuration),
                    child: controller
                                    .paterfamiliasWorkTypeController.value.id ==
                                1 ||
                            controller
                                    .paterfamiliasWorkTypeController.value.id ==
                                2
                        ? Column(
                            children: [
                              const SizedBox(width: 16),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "salary".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "د.ع",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    onChanged: (t) {
                                      print(t);
                                      controller.paterfamiliasSalaryController
                                          .value.text = moneyFormat(t);
                                      controller.paterfamiliasSalaryController
                                              .value.selection =
                                          TextSelection.fromPosition(TextPosition(
                                              offset: controller
                                                  .paterfamiliasSalaryController
                                                  .value
                                                  .text
                                                  .length));
                                    },
                                    controller: controller
                                        .paterfamiliasSalaryController.value,
                                    textInputType: TextInputType.number,
                                    isRequired: Validator.required,
                                    validator: Validator.number,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "menu_choose".tr(),
                                    errorStyle: const TextStyle(
                                        color: kErrorColor, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                  const SizedBox(width: 16),
                  const NationalCardContainerInfo(),
                  VisibilityDetector(
                    key: controller.personInfoKey,
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
                                    loadingModel: controller.fatherCardImageF,
                                    onClick: (a) {
                                      controller.fatherCardImageF.value.path
                                          .value = a.path;
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
                                    loadingModel: controller.fatherCardImageB,
                                    onClick: (a) {
                                      controller.fatherCardImageB.value.path
                                          .value = a.path;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "father_image".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ImageCardPicker(
                        type: 3,
                        height: query.height / 5.15,
                        title: "personal_image".tr(),
                        loadingModel: controller.fatherFaceImage,
                        onClick: (a) {
                          controller.fatherFaceImage.value.path.value = a.path;
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NationalCardContainerInfo extends GetView<InformationControler> {
  const NationalCardContainerInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context).size;
    return Obx(
      () => Column(
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
                selectValue: controller.personalCardTypeController,
                borderColor: Colors.transparent,
                array: cardTypeOptions,
                hint: "menu_choose".tr(),
                onSelect: (d) {
                  controller.personalCardTypeController.value = d;
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: controller.personalCardTypeController.value.id! > 9
                ? const SizedBox()
                : controller.personalCardTypeController.value.id == 0
                    ? NationalCard(
                        number: controller.nationalNumberController,
                        familyNumber: controller.familyNationalNumberController,
                        releasDate: controller.nationalDate1Controller,
                        releaseName: controller.releaseNameController,
                      )
                    : CivilAffairsCard(
                        number: controller.cardNumberController,
                        newspaperNumber: controller.newSpaperNumberController,
                        recordNumber: controller.recordCardController,
                        officeName: controller.cardOffceNameController,
                      ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class NationalCard extends GetView<InformationControler> {
  const NationalCard({
    required this.familyNumber,
    required this.number,
    required this.releasDate,
    required this.releaseName,
    Key? key,
  }) : super(key: key);
  final TextEditingController number;
  final TextEditingController familyNumber;
  final Rx<TextEditingController> releasDate;
  final TextEditingController releaseName;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "card_national_number_title".tr(),
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FDTextInput(
                controller: number,
                isRequired: Validator.required,
                validator: Validator.number,
                textInputType: TextInputType.number,
                topPadding: kDefaultPadding,
                bottomPadding: kDefaultPadding,
                leftPadding: 0,
                rightPadding: kDefaultPadding,
                borderColor: Colors.transparent,
                label: "card_national_number_title".tr(),
              ),
            ),
          ),
          const SizedBox(width: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "card_national_family".tr(),
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FDTextInput(
                controller: familyNumber,
                isRequired: Validator.required,
                validator: Validator.familyNumber,
                topPadding: kDefaultPadding,
                bottomPadding: kDefaultPadding,
                leftPadding: 0,
                rightPadding: kDefaultPadding,
                borderColor: Colors.transparent,
                label: "card_national_family".tr(),
              ),
            ),
          ),
          const SizedBox(width: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "card_national_date1".tr(),
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: FDTextInput(
                  controller: releasDate.value,
                  isRequired: Validator.required,
                  topPadding: kDefaultPadding,
                  bottomPadding: kDefaultPadding,
                  leftPadding: 0,
                  rightPadding: kDefaultPadding,
                  borderColor: Colors.transparent,
                  label: "card_national_date1".tr(),
                  readOnly: true,
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    onPressed: () => controller.selectDate(context, releasDate),
                    icon: SvgPicture.asset("assets/svg/calendar.svg"),
                  ),
                )),
          ),
          const SizedBox(width: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "card_national_issuer".tr(),
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FDTextInput(
                controller: releaseName,
                isRequired: Validator.required,
                validator: Validator.textOnly,
                topPadding: kDefaultPadding,
                bottomPadding: kDefaultPadding,
                leftPadding: 0,
                rightPadding: kDefaultPadding,
                borderColor: Colors.transparent,
                label: "card_national_issuer".tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CivilAffairsCard extends GetView<InformationControler> {
  const CivilAffairsCard({
    required this.newspaperNumber,
    required this.number,
    required this.officeName,
    required this.recordNumber,
    Key? key,
  }) : super(key: key);
  final TextEditingController number;
  final TextEditingController newspaperNumber;
  final TextEditingController recordNumber;
  final TextEditingController officeName;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "card_info_title".tr(),
            style: theme.textTheme.titleSmall,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: FDTextInput(
              controller: number,
              isRequired: Validator.required,
              validator: Validator.number,
              textInputType: TextInputType.number,
              topPadding: kDefaultPadding,
              bottomPadding: kDefaultPadding,
              leftPadding: 0,
              rightPadding: kDefaultPadding,
              borderColor: Colors.transparent,
              label: "card_info_title".tr(),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "card_information_number_title".tr(),
                  style: theme.textTheme.titleSmall,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: FDTextInput(
                    controller: newspaperNumber,
                    isRequired: Validator.required,
                    validator: Validator.number,
                    textInputType: TextInputType.number,
                    topPadding: kDefaultPadding,
                    bottomPadding: kDefaultPadding,
                    leftPadding: 0,
                    rightPadding: kDefaultPadding,
                    borderColor: Colors.transparent,
                    label: "card_information_number_desc".tr(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "card_information_record".tr(),
                  style: theme.textTheme.titleSmall,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: FDTextInput(
                    controller: recordNumber,
                    isRequired: Validator.required,
                    validator: Validator.number,
                    textInputType: TextInputType.number,
                    topPadding: kDefaultPadding,
                    bottomPadding: kDefaultPadding,
                    leftPadding: 0,
                    rightPadding: kDefaultPadding,
                    borderColor: Colors.transparent,
                    label: "card_information_record_des".tr(),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 16),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "card_information_office_title".tr(),
            style: theme.textTheme.titleSmall,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: FDTextInput(
              controller: officeName,
              isRequired: Validator.required,
              validator: Validator.textOnly,
              topPadding: kDefaultPadding,
              bottomPadding: kDefaultPadding,
              leftPadding: 0,
              rightPadding: kDefaultPadding,
              borderColor: Colors.transparent,
              label: "card_information_office_desc".tr(),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageCardPicker extends GetView<InformationControler> {
  const ImageCardPicker(
      {Key? key,
      required this.title,
      required this.onClick,
      required this.loadingModel,
      required this.type,
      this.height})
      : super(key: key);
  final String title;
  final Function(File f) onClick;
  final Rx<LoadingModel> loadingModel;
  final double? height;
  final int type;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final onboarding = Get.find<OnBoardingController>();
    return Obx(
      () => InkWell(
        onTap: () async {
          File? a;
          if (type == 3) {
            var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (C) => const FDFacePicker(),
                ));
            a = File(result);
          } else {
            a = await controller.pickFile(context, type);
          }

          if (a != null) {
            onClick(a);
            loadingModel.value.path.value = a.path;
            controller.uploadImage(
                loadingModel: loadingModel,
                token: onboarding.otpToken.value,
                context: context,
                filePath: a.path);
          }
        },
        child: Container(
          height: height,
          //padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              border: loadingModel.value.loading.value == Upload.error ||
                      (controller.isShowError.value &&
                          loadingModel.value.path.value.isEmpty)
                  ? Border.all(color: Colors.red)
                  : null),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: loadingModel.value.path.value.isNotEmpty
                    ? Image.file(
                        File(
                          loadingModel.value.path.value,
                        ),
                        fit: BoxFit.cover,
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              "assets/svg/chooser.svg",
                              height: query.height / 12.187,
                              width: query.height / 12.187,
                            ),
                          ),
                          Text(title)
                        ],
                      ),
              ),
              Visibility(
                visible: loadingModel.value.loading.value == Upload.error,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius)),
                    child: InkWell(
                        onTap: () => controller.uploadImage(
                            loadingModel: loadingModel,
                            token: onboarding.otpToken.value,
                            context: context,
                            filePath: loadingModel.value.path.value),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.refresh_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              height: kDefaultSpacing,
                            ),
                            Text(
                              "failed".tr(),
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
              ),
              Visibility(
                visible: loadingModel.value.loading.value == Upload.loading,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
