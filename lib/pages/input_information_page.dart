import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/controller/on_boarding_controller.dart';
import 'package:tamine/pages/children_page.dart';
import 'package:tamine/services/validation.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';
import 'package:tamine/widgets/fd_dropdown.dart';
import 'package:tamine/widgets/fd_text_input.dart';
import 'package:visibility_detector/visibility_detector.dart';

class InputInformationPage extends GetView<InformationControler> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: PageView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: const [
              PersonalInformation(),
              LocationInformation(),
              ChildrenInformation()
            ],
          ),
        ));
  }
}

class PersonalInformation extends GetView<InformationControler> {
  const PersonalInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
              VisibilityDetector(
                key: controller.personInfoKey,
                onVisibilityChanged: (isVisiblity) {
                  if (isVisiblity.visibleFraction > 0) {
                    controller.selectKey.value == controller.personInfoKey;
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "person_info_title".tr(),
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
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              onPressed: () => controller.selectDate(
                                  context, controller.birthdayController),
                              icon: SvgPicture.asset("assets/svg/calendar.svg"),
                            ),
                          )),
                    ),
                    const SizedBox(width: 16),
                    GanderView(
                      ganderController: controller.gander1Controller,
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
                        child: FDTextInput(
                          controller: controller.motherNameController,
                          isRequired: Validator.required,
                          validator: Validator.textOnly,
                          topPadding: kDefaultPadding,
                          bottomPadding: kDefaultPadding,
                          leftPadding: 0,
                          rightPadding: kDefaultPadding,
                          borderColor: Colors.transparent,
                          label: "mother_name".tr(),
                        ),
                      ),
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
                          array: [
                            "personal_case_1".tr(),
                            "personal_case_2".tr(),
                            "personal_case_3".tr(),
                            "personal_case_4".tr(),
                          ],
                          hint: "personal_case".tr(),
                          onSelect: (d) {
                            print('0299r48237864723746');
                            controller.maritalStatusController.value.text = d;
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
                          array: [
                            "study_case_1".tr(),
                            "study_case_2".tr(),
                            "study_case_3".tr(),
                            "study_case_4".tr(),
                            "study_case_5".tr(),
                            "study_case_6".tr(),
                            "study_case_7".tr()
                          ],
                          hint: "menu_choose".tr(),
                          onSelect: (d) {
                            controller.studyController.value.text = d;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    NationalCardContainerInfo()
                  ],
                ),
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
                array: [
                  "personal_card_type_1".tr(),
                  "personal_card_type_2".tr(),
                ],
                hint: "menu_choose".tr(),
                onSelect: (d) {
                  controller.personalCardTypeController.value.clear();
                  controller.personalCardTypeController.value.text = d;
                  controller.personalCardTypeController.update((val) {
                    val!.text = d;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: controller.personalCardTypeController.value.text.isEmpty
                ? const SizedBox()
                : controller.personalCardTypeController.value.text ==
                        "البطاقة الوطنية"
                    ? const NationalCard()
                    : const CivilAffairsCard(),
          ),
          const SizedBox(width: 16),
          VisibilityDetector(
            key: controller.fatherCardImages,
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
                            title: "front_face".tr(),
                            path: controller.backCardImage,
                            onClick: (a) {
                              controller.backCardImage.value = a.path;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: ImageCardPicker(
                            title: "front_face".tr(),
                            path: controller.frontCardImage,
                            onClick: (a) {
                              controller.frontCardImage.value = a.path;
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
                height: query.height / 5.15,
                title: "personal_image".tr(),
                path: controller.fatherFaceImage,
                onClick: (a) {
                  controller.fatherFaceImage.value = a.path;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NationalCard extends GetView<InformationControler> {
  const NationalCard({
    Key? key,
  }) : super(key: key);

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
                controller: controller.nationalNumberController,
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
                controller: controller.familyNationalNumberController,
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
                  controller: controller.nationalDate1Controller.value,
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
                    onPressed: () => controller.selectDate(
                        context, controller.nationalDate1Controller),
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
                controller: controller.nationalIsuuerController,
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
    Key? key,
  }) : super(key: key);

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
              controller: controller.cardInformationNumberController,
              isRequired: Validator.required,
              validator: Validator.textOnly,
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
                    controller: controller.cardInformationNumberController,
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
                    controller: controller.cardInformationNumberController,
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
              controller: controller.cardInformationNumberController,
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
      required this.path,
      this.height})
      : super(key: key);
  final String title;
  final Function(File f) onClick;
  final Rx<String> path;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        var a = await controller.pickFile(context);
        a != null ? onClick(a) : null;
      },
      child: Obx(
        () => Container(
          height: height ?? null,
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              border: controller.isAddChildrenShow.value && path.isEmpty
                  ? Border.all(color: Colors.red)
                  : null),
          child: path.value != null && path.value.isNotEmpty
              ? Image.file(
                  File(path.value),
                  fit: BoxFit.fill,
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
      ),
    );
  }
}

class LocationInformation extends GetView<InformationControler> {
  const LocationInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
          key: controller.locationForm,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: query.height / 5.2515),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "location_information".tr(),
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: kDefaultSpacing),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "location_number".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDTextInput(
                        controller: controller.locationNumberController,
                        isRequired: Validator.required,
                        validator: Validator.number,
                        textInputType: TextInputType.number,
                        topPadding: kDefaultPadding,
                        bottomPadding: kDefaultPadding,
                        leftPadding: 0,
                        rightPadding: kDefaultPadding,
                        borderColor: Colors.transparent,
                        label: "location_number".tr(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "location_office".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDTextInput(
                        controller: controller.locationOfficeController,
                        isRequired: Validator.required,
                        validator: Validator.textOnly,
                        topPadding: kDefaultPadding,
                        bottomPadding: kDefaultPadding,
                        leftPadding: 0,
                        rightPadding: kDefaultPadding,
                        borderColor: Colors.transparent,
                        label: "location_office".tr(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "location_serial_number".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDTextInput(
                        controller: controller.locationSerialNumberController,
                        isRequired: Validator.required,
                        validator: Validator.number,
                        textInputType: TextInputType.number,
                        topPadding: kDefaultPadding,
                        bottomPadding: kDefaultPadding,
                        leftPadding: 0,
                        rightPadding: kDefaultPadding,
                        borderColor: Colors.transparent,
                        label: "location_serial_number".tr(),
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultSpacing),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "location_province".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDDropDownMenu(
                        selectValue:
                            controller.locationProvinceChooserController,
                        borderColor: Colors.transparent,
                        array: const ["Baghdad", "Waset"],
                        hint: "menu_choose".tr(),
                        onSelect: (d) {
                          controller
                              .locationProvinceChooserController.value.text = d;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultSpacing),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "location_city".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDDropDownMenu(
                          selectValue: controller.locationCityChooserController,
                          array: ["badra", "jasan"],
                          hint: "menu_choose".tr(),
                          borderColor: Colors.transparent,
                          onSelect: (d) {
                            controller.locationCityChooserController
                                .update((val) {
                              val!.text = d;
                            });
                          }),
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
                            "location_street_1".tr(),
                            style: theme.textTheme.titleSmall,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: FDTextInput(
                              controller: controller.locationStreet1Controller,
                              validator: Validator.textOnly,
                              topPadding: kDefaultPadding,
                              bottomPadding: kDefaultPadding,
                              leftPadding: 12,
                              rightPadding: 12,
                              borderColor: Colors.transparent,
                              label: "location_street_1".tr(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "location_street_2".tr(),
                            style: theme.textTheme.titleSmall,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: FDTextInput(
                              controller: controller.locationStreet2Controller,
                              validator: Validator.textOnly,
                              topPadding: kDefaultPadding,
                              bottomPadding: kDefaultPadding,
                              leftPadding: 0,
                              rightPadding: kDefaultPadding,
                              borderColor: Colors.transparent,
                              label: "location_street_2".tr(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "location_street_3".tr(),
                            style: theme.textTheme.titleSmall,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: FDTextInput(
                              controller: controller.locationStreet3Controller,
                              validator: Validator.textOnly,
                              topPadding: kDefaultPadding,
                              bottomPadding: kDefaultPadding,
                              leftPadding: 0,
                              rightPadding: kDefaultPadding,
                              borderColor: Colors.transparent,
                              label: "location_street_3".tr(),
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
                      "location_desc".tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FDTextInput(
                        controller: controller.locationDescController,
                        isRequired: Validator.required,
                        validator: Validator.textOnly,
                        topPadding: kDefaultPadding,
                        bottomPadding: kDefaultPadding,
                        leftPadding: 0,
                        rightPadding: kDefaultPadding,
                        borderColor: Colors.transparent,
                        label: "location_desc".tr(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  VisibilityDetector(
                    key: controller.locationInfoKey,
                    onVisibilityChanged: (a) {},
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "location_title".tr(),
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
                                    title: "front_face".tr(),
                                    path: controller.frontLocationCardImage,
                                    onClick: (a) {
                                      controller.frontLocationCardImage.value =
                                          a.path;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: kDefaultPadding / 2),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: ImageCardPicker(
                                    title: "back_face".tr(),
                                    path: controller.backLocationCardImage,
                                    onClick: (a) {
                                      controller.backLocationCardImage.value =
                                          a.path;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GanderView extends GetView<InformationControler> {
  const GanderView({Key? key, required this.ganderController})
      : super(key: key);
  final Rx<String> ganderController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          "gander".tr(),
          style: theme.textTheme.titleSmall,
        ),
        subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => ganderController.value = "male",
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            border: controller.isAddChildrenShow.value &&
                                    ganderController.value.isEmpty
                                ? Border.all(color: Colors.red)
                                : null,
                            color: theme.scaffoldBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                ganderController.value == "male"
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: ganderController.value == "male"
                                    ? Colors.green
                                    : theme.colorScheme.outline,
                              ),
                              const SizedBox(width: kDefaultSpacing),
                              Text(
                                "male".tr(),
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: kDefaultSpacing),
                    Expanded(
                      child: InkWell(
                        onTap: () => ganderController.value = "female",
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                            border: controller.isAddChildrenShow.value &&
                                    ganderController.value.isEmpty
                                ? Border.all(color: Colors.red)
                                : null,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                ganderController.value == "female"
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: ganderController.value == "female"
                                    ? Colors.green
                                    : theme.colorScheme.outline,
                              ),
                              const SizedBox(width: kDefaultSpacing),
                              Text(
                                "female".tr(),
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: controller.isAddChildrenShow.value &&
                          ganderController.value.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 8,
                              left: kDefaultPadding,
                              right: kDefaultPadding),
                          child: Text(
                            "gander_required".tr(),
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.red),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : const SizedBox(),
                )
              ],
            )),
      ),
    );
  }
}

class BottomSectionView extends GetView<InformationControler> {
  const BottomSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        padding: const EdgeInsets.only(left: 24, right: 24),
        duration: const Duration(milliseconds: kDefaultDuration),
        height: query.height / 5.2515,
        width: query.width,
        decoration: BoxDecoration(
            color: theme.appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(0, -5),
                  blurRadius: 10)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(4),
            //   child: LinearProgressIndicator(
            //     backgroundColor: theme.colorScheme.tertiary,
            //     minHeight: query.height / 70.333,
            //     value: controller.steps.value == 0
            //         ? 0
            //         : (controller.steps.value * 0.33333333),
            //   ),
            // ),
            // const SizedBox(
            //   height: 18,
            // ),
            Container(
              alignment: Alignment.center,
              height: query.height / 15,
              width: query.width,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: kDefaultDuration),
                    height: query.height / 15,
                    width: query.height / 15,
                    child: FDButton(
                      title: "",
                      icon: Icons.arrow_back,
                      backgroundColor: theme.colorScheme.surface,
                      color: Colors.black,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (controller.steps.value == 0) {
                          return;
                        }
                        controller.steps.value--;
                        controller.pageController
                            .jumpToPage(controller.steps.value);
                      },
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding / 2),
                  Container(
                    margin: EdgeInsets.only(
                        right: (query.height / 15) + kDefaultPadding / 2),
                    child: FDButton(
                      title: "next".tr(),
                      onPressed: () {
                        switch (controller.steps.value) {
                          case 0:
                            if (controller.personalForm.currentState!
                                .validate()) {
                              controller.steps.value = 1;
                              controller.pageController
                                  .jumpToPage(controller.steps.value);
                            }
                            break;
                          case 1:
                            if (controller.locationForm.currentState!
                                .validate()) {
                              controller.steps.value = 2;
                              controller.pageController
                                  .jumpToPage(controller.steps.value);
                            }
                            break;
                          case 3:
                            if (controller.personalForm.currentState!
                                .validate()) {}
                            break;
                          default:
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
