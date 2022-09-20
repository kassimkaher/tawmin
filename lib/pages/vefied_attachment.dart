import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/controller/on_boarding_controller.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';

class VerifedAttachmentSheet extends GetView<InformationControler> {
  const VerifedAttachmentSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context).size;

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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => ListView(
            children: [
              Text("attachment_sheet_title".tr()),
              Visibility(
                visible: controller.maritalStatusController.value.id == 0,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.only(bottom: kDefaultSpacing),
                  title: Text(
                    "death_im".tr(),
                    style: theme.textTheme.titleMedium,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ImageCardPicker(
                            type: 1,
                            height: query.height / 5.15,
                            title: "father_death".tr(),
                            loadingModel: controller.fatherDeathImage,
                            onClick: (a) {
                              controller.fatherDeathImage.value.path.value =
                                  a.path;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: kDefaultSpacing,
                        ),
                        Expanded(
                          child: ImageCardPicker(
                            type: 1,
                            height: query.height / 5.15,
                            title: "mother_death_im".tr(),
                            loadingModel: controller.motherDeathImage,
                            onClick: (a) {
                              controller.motherDeathImage.value.path.value =
                                  a.path;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.maritalStatusController.value.id == 1,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.only(bottom: kDefaultSpacing),
                  title: Text(
                    "marriage_contract".tr(),
                    style: theme.textTheme.titleMedium,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ImageCardPicker(
                      type: 1,
                      height: query.height / 5.15,
                      title: "marriage_contract".tr(),
                      loadingModel: controller.maridImage,
                      onClick: (a) {
                        controller.maridImage.value.path.value = a.path;
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.maritalStatusController.value.id == 2,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.only(bottom: kDefaultSpacing),
                  title: Text(
                    "death_im".tr(),
                    style: theme.textTheme.titleMedium,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ImageCardPicker(
                      type: 1,
                      height: query.height / 5.15,
                      title: "husband_death_im".tr(),
                      loadingModel: controller.husbandDeathImage,
                      onClick: (a) {
                        controller.husbandDeathImage.value.path.value = a.path;
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.maritalStatusController.value.id == 3,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.only(bottom: kDefaultSpacing),
                  title: Text(
                    "divorce_document".tr(),
                    style: theme.textTheme.titleMedium,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ImageCardPicker(
                      type: 1,
                      height: query.height / 5.15,
                      title: "divorce_document".tr(),
                      loadingModel: controller.deMaridImage,
                      onClick: (a) {
                        controller.deMaridImage.value.path.value = a.path;
                      },
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(controller.maritalStatusController.value.id == 0
                    ? "number_of_prother".tr()
                    : "number_of_child".tr()),
                subtitle: Obx(
                  () => Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.outline),
                      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FDButton(
                          title: "",
                          icon: Icons.add,
                          backgroundColor: theme.scaffoldBackgroundColor,
                          borderColor: Colors.transparent,
                          color: theme.primaryColor,
                          iconSize: 50,
                          onPressed: () => controller.incrementChildCount(),
                        ),
                        Text(
                          controller.childCount.toString(),
                          style: theme.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        FDButton(
                          title: "",
                          icon: FeatherIcons.minus,
                          backgroundColor: theme.scaffoldBackgroundColor,
                          borderColor: Colors.transparent,
                          color: theme.primaryColor,
                          iconSize: 50,
                          onPressed: () => controller.decrementChildCount(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.maritalStatusController.value.id == 3 &&
                      controller.childCount.value > 0,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.only(bottom: kDefaultSpacing),
                    title: Text(
                      "custody_decision".tr(),
                      style: theme.textTheme.titleMedium,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ImageCardPicker(
                        type: 1,
                        height: query.height / 5.15,
                        title: "custody_decision".tr(),
                        loadingModel: controller.custodyDecision,
                        onClick: (a) {
                          controller.custodyDecision.value.path.value = a.path;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: kDefaultSpacing,
              )
            ],
          ),
        ),
      ),
    );
  }
}
