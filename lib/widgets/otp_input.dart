import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tamine/utils/const.dart';

class OTPWdiget extends HookWidget {
  const OTPWdiget(
      {Key? key,
      this.controller,
      this.borderColor,
      this.backgroundColor,
      this.onFocus,
      this.leftPadding,
      this.rightPadding,
      this.bottomPadding,
      this.topPadding,
      this.maxLength,
      this.autofocus = false})
      : super(key: key);

  final TextEditingController? controller;

  final Color? borderColor;

  final Color? backgroundColor;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final int? maxLength;
  final bool autofocus;
  final void Function(bool isFocus)? onFocus;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = useState<String?>(null);
    return TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      onChanged: (f) {
        if (f.length == 1) {
          FocusScope.of(context).nextFocus();
        } else {
          FocusScope.of(context).previousFocus();
        }
      },
      autofocus: autofocus,
      decoration: InputDecoration(
        fillColor: theme.scaffoldBackgroundColor,
        filled: true,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF97A0AA),
        ),
        errorStyle: const TextStyle(fontSize: 0, height: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      validator: (h) {
        if (h == null || h.isEmpty) {
          return '';
        }
        return null;
      },
    );
  }
}
