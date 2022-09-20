import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/services/validation.dart';
import 'package:tamine/utils/utils.dart';

class FDDropDownMenu extends StatelessWidget {
  const FDDropDownMenu(
      {Key? key,
      required this.array,
      required this.onSelect,
      required this.hint,
      this.background,
      this.borderColor,
      this.bottomPadding,
      this.enable = true,
      this.leftPadding,
      this.rightPadding,
      this.topPadding,
      required this.selectValue,
      this.readOnly = false})
      : super(key: key);
  final List<OptionModel> array;
  final Function(OptionModel selectData) onSelect;
  final String hint;
  final Color? background;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;

  final bool enable;
  final Rx<OptionModel>? selectValue;
  final Color? borderColor;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField<OptionModel>(
      value: selectValue != null && selectValue!.value.index! < 10
          ? array[selectValue!.value.index!]
          : null,
      icon: const RotatedBox(
        quarterTurns: 3,
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
      hint: Text(
        hint,
        style: theme.textTheme.titleSmall,
      ),
      style: theme.textTheme.bodyLarge,
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      alignment: Alignment.topRight,
      isExpanded: true,
      decoration: InputDecoration(
        fillColor: enable
            ? background ?? theme.scaffoldBackgroundColor
            : Colors.transparent,
        filled: true,
        errorStyle: theme.textTheme.bodySmall?.copyWith(color: Colors.red),
        contentPadding: const EdgeInsets.only(
            top: 18, bottom: 18, left: kDefaultPadding, right: kDefaultPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide:
              BorderSide(color: borderColor ?? theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: const BorderSide(color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide:
              BorderSide(color: borderColor ?? theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: BorderSide(
            color: borderColor ?? theme.colorScheme.outline,
          ),
        ),
      ),
      items: array.map(
        (OptionModel value) {
          return DropdownMenuItem<OptionModel>(
            value: value,
            child: Text(value.title!.tr()),
          );
        },
      ).toList(),
      onChanged: readOnly ? null : (a) => onSelect(a!),
      validator: (h) {
        const validate = Validator.required;
        if (!validate.isRequired(h != null ? h.title.toString() : null)) {
          return validate.hint();
        }

        return null;
      },
    );
  }
}
