import 'package:tamine/utils/utils.dart';
import 'package:flutter/material.dart';

class FDElevatedButton extends StatelessWidget {
  const FDElevatedButton({
    Key? key,
    required this.title,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.leftMargin,
    this.rightMargin,
  }) : super(key: key);

  final Color? color;
  final Color? backgroundColor;
  final String title;
  final double? leftMargin;
  final double? rightMargin;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = this.backgroundColor ?? theme.primaryColor;
    final color = this.color ?? Colors.white;

    return Container(
      margin: EdgeInsets.only(left: leftMargin ?? 0, right: rightMargin ?? 0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => onPressed?.call(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultSpacing,
              vertical: kDefaultSpacing / 2,
            ),
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
