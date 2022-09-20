import 'package:tamine/utils/utils.dart';
import 'package:flutter/material.dart';

class FDButton extends StatelessWidget {
  const FDButton(
      {Key? key,
      required this.title,
      this.icon,
      this.color,
      this.backgroundColor,
      this.borderColor,
      this.onPressed,
      this.isLoading = false,
      this.padding,
      this.textStyle,
      this.isunderLine = false,
      this.iconSize})
      : super(key: key);

  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final String title;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool isunderLine;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = this.backgroundColor ?? theme.primaryColor;
    final color = this.color ?? Colors.white;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => isLoading ? null : onPressed?.call(),
        child: Container(
          padding: padding ?? const EdgeInsets.all(kDefaultSpacing),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? backgroundColor.withOpacity(.2),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: icon != null && title.isEmpty
              ? Icon(
                  icon,
                  color: color,
                  size: iconSize ?? null,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: color,
                        size: iconSize,
                      ),
                      const SizedBox(width: kDefaultSpacing)
                    ],
                    isLoading
                        ? const SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            title,
                            style: textStyle ??
                                theme.textTheme.titleSmall?.copyWith(
                                    color: color,
                                    fontWeight: FontWeight.w600,
                                    decoration: isunderLine
                                        ? TextDecoration.underline
                                        : null),
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}
