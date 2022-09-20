import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tamine/utils/utils.dart';

Future<T?> showModal<T>(
    {required BuildContext context,
    required Widget Function(BuildContext, ScrollController) builder,
    double? topMargin,
    bool? enableDrag}) {
  final query = MediaQuery.of(context);
  final theme = Theme.of(context);

  return showCupertinoModalBottomSheet<T>(
      bounce: false,
      closeProgressThreshold: 0.4,
      context: context,
      animationCurve: Curves.fastOutSlowIn,
      enableDrag: enableDrag ?? true,
      duration: const Duration(milliseconds: kDefaultDuration),
      builder: (context) {
        return Container(
          height: query.size.height,
          margin: EdgeInsets.only(top: topMargin ?? 0),
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            padding: EdgeInsets.only(
              bottom: window.viewPadding.bottom / window.devicePixelRatio,
            ),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kDefaultSpacing),
                topRight: Radius.circular(kDefaultSpacing),
              ),
            ),
            child: builder(
              context,
              ScrollController(),
            ),
          ),
        );
      },
      backgroundColor: Colors.transparent,
      elevation: 0);
}
