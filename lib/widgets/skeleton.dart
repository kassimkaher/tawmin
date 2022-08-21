import 'package:tamine/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SkeletonLoading extends HookWidget {
  const SkeletonLoading(
      {Key? key,
      this.borderRadius,
      this.h,
      this.w,
      this.backgroundColor,
      this.margin,
      this.child})
      : super(key: key);
  final double? h;
  final double? w;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final stateLoading = useState(false);
    final first = useState(true);
    final theme = Theme.of(context);
    if (first.value) {
      first.value = false;

      Future.delayed(const Duration(milliseconds: 300))
          .then((value) => stateLoading.value = true);
    }

    return AnimatedOpacity(
      onEnd: () => stateLoading.value = !stateLoading.value,
      duration: const Duration(milliseconds: 1000),
      opacity: stateLoading.value ? 0.2 : 1,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        width: w ?? 100,
        height: h ?? 40,
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? BorderRadius.circular(kDefaultBorderRadius),
          color: backgroundColor ?? theme.colorScheme.surfaceTint,
        ),
        child: child,
      ),
    );
  }
}
