import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/services/validation.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_dropdown.dart';
import 'package:tamine/widgets/fd_text_input.dart';
import 'package:tamine/widgets/ks_choois_tow.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
                  VisibilityDetector(
                    key: controller.locationInfoKey,
                    onVisibilityChanged: (q) {},
                    child: Text(
                      "location_information".tr(),
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: kDefaultSpacing),
                  ChooiseTwoWidget(
                    option1: desitionOptions[0],
                    option2: desitionOptions[1],
                    ganderController: controller.isThereLocationCard,
                    title: "is_there_location".tr(),
                    errorMessage: "question_is_required".tr(),
                  ),
                  const SizedBox(height: kDefaultSpacing),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: kDefaultDuration),
                    child: controller.isThereLocationCard.value == 1
                        ? Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "location_number1".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller:
                                        controller.locationNumberController,
                                    isRequired: Validator.required,
                                    validator: Validator.number,
                                    textInputType: TextInputType.number,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "location_number1".tr(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "location_number2".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller:
                                        controller.locationNumberController,
                                    isRequired: Validator.required,
                                    validator: Validator.number,
                                    textInputType: TextInputType.number,
                                    topPadding: kDefaultPadding,
                                    bottomPadding: kDefaultPadding,
                                    leftPadding: 0,
                                    rightPadding: kDefaultPadding,
                                    borderColor: Colors.transparent,
                                    label: "location_number2".tr(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: kDefaultSpacing),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "location_office".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller:
                                        controller.locationOfficeController,
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
                              const SizedBox(width: kDefaultSpacing),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "location_serial_number".tr(),
                                  style: theme.textTheme.titleSmall,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FDTextInput(
                                    controller: controller
                                        .locationSerialNumberController,
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
                                          controller: controller
                                              .locationStreet1Controller,
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
                                          controller: controller
                                              .locationStreet2Controller,
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
                                          controller: controller
                                              .locationStreet3Controller,
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
                              const SizedBox(height: kDefaultSpacing),
                            ],
                          ),
                  ),
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
                        array: [OptionModel(id: 0, title: "Baghdad", index: 0)],
                        hint: "menu_choose".tr(),
                        onSelect: (d) {
                          controller.locationProvinceChooserController.value =
                              d;
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
                          array: [OptionModel(id: 0, title: "badra", index: 0)],
                          hint: "menu_choose".tr(),
                          borderColor: Colors.transparent,
                          onSelect: (d) {
                            controller.locationCityChooserController.value = d;
                          }),
                    ),
                  ),
                  const SizedBox(width: kDefaultSpacing),
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
                  const SizedBox(width: kDefaultSpacing),
                  VisibilityDetector(
                    key: controller.locationInfoImageKey,
                    onVisibilityChanged: (a) {},
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: kDefaultDuration),
                      child: controller.isThereLocationCard.value == 1
                          ? ListTile(
                              contentPadding: const EdgeInsets.only(
                                  bottom: kDefaultSpacing),
                              title: Text(
                                "location_confirme".tr(),
                                style: theme.textTheme.titleMedium,
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: ImageCardPicker(
                                  type: 1,
                                  height: query.height / 5.15,
                                  title: "location_confirme".tr(),
                                  loadingModel: controller.locationConfirme,
                                  onClick: (a) {
                                    controller.locationConfirme.value.path
                                        .value = a.path;
                                  },
                                ),
                              ),
                            )
                          : ListTile(
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
                                            type: 1,
                                            title: "front_face".tr(),
                                            loadingModel: controller
                                                .frontLocationCardImage,
                                            onClick: (a) {
                                              controller.frontLocationCardImage
                                                  .value.path.value = a.path;
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                          width: kDefaultPadding / 2),
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: ImageCardPicker(
                                            type: 1,
                                            title: "back_face".tr(),
                                            loadingModel: controller
                                                .backLocationCardImage,
                                            onClick: (a) {
                                              controller.backLocationCardImage
                                                  .value.path.value = a.path;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
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
