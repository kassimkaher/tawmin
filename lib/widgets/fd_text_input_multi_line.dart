import 'package:tamine/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FDTextInputMultiLine extends HookWidget {
  const FDTextInputMultiLine(
      {Key? key, this.trailing, this.label, this.icon, this.maxLine})
      : super(key: key);

  final Widget? trailing;
  final String? label;
  final Widget? icon;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final focused = useState(false);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultSpacing,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: focused.value
              ? theme.colorScheme.secondary
              : theme.colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon!,
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Focus(
              onFocusChange: (value) {
                focused.value = value;
              },
              child: TextField(
                maxLines: maxLine ?? 3,
                decoration: InputDecoration(
                  hintText: label,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
                style: theme.textTheme.titleSmall,
              ),
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: kDefaultSpacing),
            trailing!,
          ]
        ],
      ),
    );
  }
}
