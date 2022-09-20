import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/utils/utils.dart';

class ChooiseTwoWidget extends GetView<InformationControler> {
  const ChooiseTwoWidget(
      {Key? key,
      required this.ganderController,
      required this.option1,
      required this.option2,
      this.title,
      this.errorMessage})
      : super(key: key);
  final OptionModel option1;
  final OptionModel option2;
  final Rx<int> ganderController;
  final String? title;
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title ?? "",
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
                        onTap: () => ganderController.value = option1.id!,
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            border: controller.isShowError.value &&
                                    ganderController.value > 1
                                ? Border.all(color: Colors.red)
                                : null,
                            color: theme.scaffoldBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                ganderController.value == option1.id!
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: ganderController.value == option1.id!
                                    ? Colors.green
                                    : theme.colorScheme.outline,
                              ),
                              const SizedBox(width: kDefaultSpacing),
                              Text(
                                option1.title!.tr(),
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
                        onTap: () => ganderController.value = option2.id!,
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                            border: controller.isShowError.value &&
                                    ganderController.value > 1
                                ? Border.all(color: Colors.red)
                                : null,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                ganderController.value == option2.id!
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: ganderController.value == option2.id!
                                    ? Colors.green
                                    : theme.colorScheme.outline,
                              ),
                              const SizedBox(width: kDefaultSpacing),
                              Text(
                                option2.title!.tr(),
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
                  child:
                      controller.isShowError.value && ganderController.value > 1
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  top: 8,
                                  left: kDefaultPadding,
                                  right: kDefaultPadding),
                              child: Text(
                                errorMessage ?? "",
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
