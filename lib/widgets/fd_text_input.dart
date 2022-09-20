import 'package:tamine/services/localization.dart';
import 'package:tamine/services/validation.dart';
import 'package:tamine/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class FDTextInput extends HookWidget {
  const FDTextInput(
      {Key? key,
      this.trailing,
      this.label,
      this.icon,
      this.enable = true,
      this.controller,
      this.textInputType,
      this.maxLine,
      this.borderColor,
      this.backgroundColor,
      this.onFocus,
      this.leftPadding,
      this.rightPadding,
      this.bottomPadding,
      this.topPadding,
      this.maxLength,
      this.isRequired,
      this.validator,
      this.disableColor,
      this.suffixIcon,
      this.readOnly,
      this.isHidden,
      this.isPopUpErrorMessage = false,
      this.onChanged,
      this.errorStyle,
      this.onTap})
      : super(key: key);
  final bool isPopUpErrorMessage;
  final bool? readOnly;
  final bool enable;
  final Widget? trailing;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool? isHidden;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Color? borderColor;
  final Color? disableColor;
  final Color? backgroundColor;
  final int? maxLine;

  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final int? maxLength;
  final Validator? isRequired;
  final Validator? validator;
  final String? label;
  final TextStyle? errorStyle;
  final Function(String value)? onChanged;
  final Function()? onTap;
  final void Function(bool isFocus)? onFocus;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context);
    final isFocus = useState(false);

    final isValidate = useState(0);
    final isShowMessage = useState(false);
    return Focus(
      // onFocusChange: (f) {
      //   isFocus.value = f;
      //   if (!f) {
      //     FocusScope.of(context).unfocus();
      //   }
      //   if (onFocus != null) {
      //     onFocus!(f);
      //   }
      // },
      child: Stack(
        children: [
          TextFormField(
            maxLines: maxLine ?? 1,
            maxLength: maxLength,
            maxLengthEnforcement:
                MaxLengthEnforcement.truncateAfterCompositionEnds,
            keyboardType: textInputType ?? TextInputType.text,
            controller: controller,
            readOnly: readOnly ?? false,
            enabled: enable,
            onTap: onTap ?? null,
            onChanged: (value) => onChanged != null ? onChanged!(value) : null,
            decoration: InputDecoration(
              fillColor: isHidden != null && isHidden == true
                  ? Colors.transparent
                  : enable
                      ? backgroundColor ?? theme.scaffoldBackgroundColor
                      : disableColor ?? Colors.transparent,
              filled: true,
              hintText: label,
              suffixIcon: suffixIcon,
              errorStyle: isPopUpErrorMessage
                  ? const TextStyle(fontSize: 0, height: 0)
                  : errorStyle ??
                      theme.textTheme.bodySmall?.copyWith(color: Colors.red),
              prefixIcon: icon != null
                  ? Padding(
                      padding: EdgeInsets.only(
                          right: rightPadding ?? kDefaultPadding,
                          left: leftPadding ?? kDefaultPadding,
                          bottom: bottomPadding ?? 0,
                          top: topPadding ?? 0),
                      child: icon,
                    )
                  : null,
              contentPadding: isHidden != null && isHidden == true
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ).copyWith(
                      bottom: bottomPadding ?? 0,
                      top: topPadding ?? 0,
                      left: leftPadding ?? 0,
                      right: rightPadding ?? 0),
              hintStyle: theme.textTheme.bodyMedium
                  ?.copyWith(color: const Color(0xFF97A0AA), fontSize: 14),
              border: isHidden != null && isHidden == true
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        kDefaultBorderRadius,
                      ),
                      borderSide: BorderSide(
                          color: isValidate.value == 0
                              ? Colors.transparent
                              : theme.colorScheme.secondary),
                    ),
              focusedBorder: isHidden != null && isHidden == true
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        kDefaultBorderRadius,
                      ),
                      borderSide: BorderSide(
                          color: isValidate.value == 0
                              ? theme.primaryColor
                              : Colors.red),
                    ),
              errorBorder: isHidden != null && isHidden == true
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        kDefaultBorderRadius,
                      ),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
              focusedErrorBorder: isHidden != null && isHidden == true
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        kDefaultBorderRadius,
                      ),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
              disabledBorder: isHidden != null && isHidden == true
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        kDefaultBorderRadius,
                      ),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
              enabledBorder: isHidden != null && isHidden == true
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        kDefaultBorderRadius,
                      ),
                      borderSide: BorderSide(
                        color: isValidate.value == 0
                            ? Colors.transparent
                            : theme.colorScheme.secondary,
                      ),
                    ),
            ),
            style: theme.textTheme.bodyLarge,
            validator: (h) {
              if (isRequired != null && !isRequired!.isRequired(h!)) {
                isValidate.value = 1;
                showMessage(isShowMessage);
                // tooltipkey.value.currentState?.ensureTooltipVisible();
                return isPopUpErrorMessage ? '' : isRequired?.hint();
              }

              if (validator != null) {
                if (validator == Validator.phone && !validator!.isPhone(h)) {
                  isValidate.value = 2;
                  showMessage(isShowMessage);

                  return isPopUpErrorMessage ? '' : validator?.hint();
                }

                if (validator == Validator.email &&
                    !validator!.isValidEmail(h!)) {
                  isValidate.value = 2;
                  showMessage(isShowMessage);

                  return isPopUpErrorMessage ? '' : validator?.hint();
                }
                if (validator == Validator.textOnly &&
                    !validator!.isTextOnly(h!)) {
                  isValidate.value = 2;
                  showMessage(isShowMessage);

                  return isPopUpErrorMessage ? '' : validator?.hint();
                }
                if (validator == Validator.number && !validator!.isNumebr(h!)) {
                  isValidate.value = 2;
                  showMessage(isShowMessage);

                  return isPopUpErrorMessage ? '' : validator?.hint();
                }
                if (validator == Validator.familyNumber &&
                    !validator!.isFamilyNumber(h!)) {
                  isValidate.value = 2;
                  showMessage(isShowMessage);
                  //  print(validator!.isNumebr(h));
                  return isPopUpErrorMessage ? '' : validator?.hint();
                }
              }
              isValidate.value = 0;

              return null;
            },
          ),
          Visibility(
            visible: isPopUpErrorMessage,
            child: Transform.translate(
              offset: const Offset(-8, -56),
              child: Row(
                children: [
                  const Spacer(),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isShowMessage.value ? 1 : 0,
                    child: Container(
                      padding: const EdgeInsets.all(10)
                          .copyWith(bottom: kDefaultPadding),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/${isArbic(context) ? "buble_ar.png" : "buble_en.png"}",
                            ),
                            fit: BoxFit.fill),
                      ),
                      child: Text(
                        isRequired != null &&
                                !isRequired!.isRequired(controller?.text)
                            ? isRequired!.hint()
                            : validator != null
                                ? validator!.hint()
                                : "",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showMessage(ValueNotifier<bool> isShow) {
    isShow.value = true;

    Future.delayed(const Duration(seconds: 4))
        .then((value) => isShow.value = false);
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;
  final bool isArabic;
  ToolTipCustomShape({this.usePadding = true, this.isArabic = false});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 0 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 0));

    return isArabic
        ? (Path()
          ..addRRect(
            RRect.fromRectAndRadius(
              rect,
              const Radius.circular(kDefaultBorderRadius),
            ),
          )
          ..moveTo(rect.bottomLeft.dx + 25, rect.bottomCenter.dy)
          ..relativeLineTo(0, 15)
          ..relativeLineTo(10, -15)
          ..close())
        : (Path()
          ..addRRect(
            RRect.fromRectAndRadius(
              rect,
              Radius.circular(rect.height / 3),
            ),
          )
          ..moveTo(rect.bottomRight.dx - 35, rect.bottomCenter.dy)
          ..relativeLineTo(10, 15)
          ..relativeLineTo(0, -15)
          ..close());
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
