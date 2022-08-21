import 'package:flutter/material.dart';

enum NavPages {
  account,
  search,
  home,
  sections,
  orders,
}

class TabPageIdentifier extends StatelessWidget {
  const TabPageIdentifier({Key? key, required this.page, required this.child})
      : super(key: key);

  final NavPages page;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
