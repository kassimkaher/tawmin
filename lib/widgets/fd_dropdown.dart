import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
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
      required this.selectValue})
      : super(key: key);
  final List<String> array;
  final Function(dynamic selectData) onSelect;
  final String hint;
  final Color? background;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;

  final bool enable;
  final Rx<TextEditingController>? selectValue;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      value: selectValue != null && selectValue!.value.text.isNotEmpty
          ? selectValue!.value.text
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
      alignment: Alignment.center,
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
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (a) => onSelect(a),
      validator: (h) {
        const validate = Validator.required;
        if (!validate.isRequired(h != null ? h.toString() : null)) {
          print("fd_dropdown===2");
          return validate.hint();
        }
        print("fd_dropdown===3");

        return null;
      },
    );
  }
}
