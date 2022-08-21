import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/services/validation.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_dropdown.dart';
import 'package:tamine/widgets/fd_text_input.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChildrenInformation extends GetView<InformationControler> {
  const ChildrenInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 24),
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
          child: Form(
            key: controller.childrenForm,
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
                        "children_information".tr(),
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
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                onPressed: () => controller.selectDate(
                                    context, controller.birthdayController),
                                icon:
                                    SvgPicture.asset("assets/svg/calendar.svg"),
                              ),
                            )),
                      ),
                      const SizedBox(width: 16),
                      GanderView(
                        ganderController: controller.childGanderController,
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
                            controller: controller.motherNameChildController,
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
                            selectValue:
                                controller.childMaritalStatusController,
                            array: [
                              "wife".tr(),
                              "son".tr(),
                              "doter".tr(),
                              "brother".tr(),
                              "sister".tr()
                            ],
                            hint: "connection_type".tr(),
                            onSelect: (d) {
                              print('0299r48237864723746');
                              controller
                                  .childMaritalStatusController.value.text = d;
                            },
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
                            selectValue:
                                controller.childMaritalStatusController,
                            array: [
                              "personal_case_1".tr(),
                              "personal_case_2".tr(),
                              "personal_case_3".tr(),
                              "personal_case_4".tr(),
                            ],
                            hint: "personal_case".tr(),
                            onSelect: (d) {
                              print('0299r48237864723746');
                              controller
                                  .childMaritalStatusController.value.text = d;
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
                            selectValue: controller.childStudyController,
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
                              controller.childStudyController.value.text = d;
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
      ],
    );
  }
}
