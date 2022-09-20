import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/controller/on_boarding_controller.dart';
import 'package:tamine/model/child_model.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/pages/children_page.dart';
import 'package:tamine/sheet/modal.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';

class FamilyMeberCard extends GetView<InformationControler> {
  const FamilyMeberCard(
      {Key? key,
      required this.name,
      required this.connection,
      required this.index})
      : super(key: key);

  final String name;
  final OptionModel connection;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controllerOnboarding = Get.find<OnBoardingController>();
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultSpacing),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    connection.title!.tr(),
                    style: theme.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  index == 0
                      ? SizedBox()
                      : IconButton(
                          padding: EdgeInsets.zero,
                          icon: true
                              ? SvgPicture.asset(
                                  "assets/svg/close.svg",
                                  color: Color(0xFFCACDD1),
                                )
                              : Text(
                                  "x",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFFCACDD1),
                                  ),
                                ),

                          // icon: Icons.cancel,
                          onPressed: () {
                            controller.childrenListModel.value.childildren.value
                                .removeAt(index - 1);
                            final d = controller.childrenListModel.value;
                            controller.childrenListModel.update((val) {
                              val = d;
                            });
                          }),
                ],
              ),
              const SizedBox(
                height: kDefaultSpacing,
              ),
              Container(
                margin: EdgeInsets.only(left: 50, bottom: 20),
                child: Text(
                  name,
                  style: theme.textTheme.titleMedium,
                ),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Row(
                children: [
                  FDButton(
                      title: "تعديل",
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      color: theme.primaryColor,
                      borderColor: Colors.transparent,
                      textStyle: theme.textTheme.titleSmall?.copyWith(
                        color: theme.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                      onPressed: () {
                        if (index == 0) {
                          controllerOnboarding.selectSteps.value =
                              steps.indexWhere((element) => element == 7);
                          Scrollable.ensureVisible(
                            controller.firstPageKey.currentContext!,
                            duration: const Duration(milliseconds: 150),
                          );

                          return;
                        }

                        fillChildFormToUpdate(
                            controller.childrenListModel.value.childildren
                                .value[index - 1],
                            context,
                            index - 1,
                            controller);
                      }),
                  SvgPicture.asset("assets/svg/edit.svg")
                ],
              ))
        ],
      ),
    );
  }

  fillChildFormToUpdate(ChildInfoModel data, BuildContext context, int index,
      InformationControler controler) {
    controller.updateChild.value = true;
    controller.fnChildController.text = data.childData!.name1!;
    controller.snChildController.text = data.childData!.name2!;
    controller.tnChildController.text = data.childData!.name3!;
    controller.fonChildController.text = data.childData!.name4!;
    controller.lnChildController.text = data.childData!.nameLast!;
    controller.motherNameFChildController.text =
        getMotherName(data.childData!.nameMother!, 0) ?? "";
    controller.motherNameSChildController.text =
        getMotherName(data.childData!.nameMother!, 1) ?? "";
    controller.motherNameTChildController.text =
        getMotherName(data.childData!.nameMother!, 2) ?? "";

    controller.birthdayChildController.value.text = data.childData!.birthday!;
    controller.selectGanderChild.value = data.childData!.gander!;
    if (index == 0 && controller.maritalStatusController.value.id == 1) {
      controller.connectionTypeController.value =
          connectionTypeOptionList[1][0];

      controller.maritalStatusChildController.value =
          connectionTypeOptionList[1][1];
    } else {
      controller.connectionTypeController.value =
          connectionTypeOptionList[controller.maritalStatusController.value.id!]
              .where((element) => element.id == data.childData!.connectionType)
              .first;
      try {
        controller.maritalStatusChildController.value = maritalStatusOptions
            .where((element) => element.id == data.childData!.personalCase)
            .first;
      } catch (e) {}
    }

    controller.childStudyController.value = academicAchievementOptions
        .where((element) => element.id == data.childData!.studyType)
        .first;
    controller.childCardTypeController.value = cardTypeOptions
        .where((element) => element.id == data.childData!.cardType)
        .first;

    controller.nationalNumberChildController.text =
        data.childData!.cardInfo!.nationalNumber!;
    controller.familyNationalNumberChildController.text =
        data.childData!.cardInfo!.familyNumber!;
    controller.nationalDate1ChildController.value.text =
        data.childData!.cardInfo!.releaseDate!;
    controller.releaseNameController.text =
        data.childData!.cardInfo!.releaseName!;
    controller.cardNumberChildController.text =
        data.childData!.cardInfo!.statusIdentificationNumber!;
    controller.newSpaperNumberChildController.text =
        data.childData!.cardInfo!.newspaperNumber!;
    controller.recordCardChildController.text =
        data.childData!.cardInfo!.recordNumber!;
    controller.cardOffceNameChildController.text =
        data.childData!.cardInfo!.officeName!;
    try {
      controller.childCardImageF.value = LoadingModel("$childImKeyF$index");
      controller.childCardImageB.value = LoadingModel("$childImKeyB$index");
      controller.childCardImageF.value.path.value = data.childData!.pathF!;
      controller.childCardImageF.value.loading.value = Upload.uploaded;
      controller.childCardImageB.value.path.value = data.childData!.pathB!;
      controller.childCardImageB.value.loading.value = Upload.uploaded;
    } catch (e) {}

    showModal(
        context: context,
        builder: (c, a) => ChildrenInformation(
              title:
                  controller.maritalStatusController.value.id == 1 && index == 0
                      ? "معلومات الزوجة ".tr()
                      : "children_information".tr(),
              index: (index),
              updateMode: true,
            ));
  }
}
