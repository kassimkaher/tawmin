import 'package:flutter/material.dart';

class FDAppBar extends StatelessWidget {
  const FDAppBar({Key? key, required this.title, this.trailing})
      : super(key: key);
  final String title;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
        horizontalTitleGap: 8,
        leading: Material(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          color: theme.colorScheme.outline,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 32,
              width: 32,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: theme.colorScheme.tertiary,
                size: 18,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style:
              theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: trailing);
  }
}
