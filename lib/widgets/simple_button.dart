import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SimpleButton extends HookWidget {
  const SimpleButton({Key? key, required this.child, this.onPressed})
      : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDown = useState(false);

    return GestureDetector(
      onTap: () => onPressed?.call(),
      onTapDown: (_) => isDown.value = true,
      onTapUp: (_) => isDown.value = false,
      onTapCancel: () => isDown.value = false,
      child: Opacity(opacity: isDown.value ? .5 : 1, child: child),
    );
  }
}
