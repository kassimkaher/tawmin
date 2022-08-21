import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamine/utils/utils.dart';

enum SnackbarStyle { error, alert, success }

showSnackbar(BuildContext context,
    {required String subtitle, required SnackbarStyle style}) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(kDefaultBorderRadius),
    // ),

    padding: const EdgeInsets.all(kDefaultPadding),
    backgroundColor: Colors.white,
    elevation: 5,

    duration: const Duration(milliseconds: 3000),
    content: true
        ? ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: (style == SnackbarStyle.error
                        ? Colors.red
                        : style == SnackbarStyle.alert
                            ? Colors.amber
                            : style == SnackbarStyle.success
                                ? Colors.green
                                : Colors.red)
                    .withOpacity(0.2),
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              ),
              child: Icon(
                style == SnackbarStyle.error
                    ? Icons.info_outline
                    : style == SnackbarStyle.alert
                        ? Icons.warning_amber_rounded
                        : style == SnackbarStyle.success
                            ? Icons.check_circle_outline
                            : Icons.info_outline,
                color: style == SnackbarStyle.error
                    ? Colors.red
                    : style == SnackbarStyle.alert
                        ? Colors.amber
                        : style == SnackbarStyle.success
                            ? Colors.green
                            : Colors.red,
                size: 26,
              ),
            ),
            title: Text(
              "${subtitle.tr()}",
              style: theme.textTheme.bodySmall,
            ),
            trailing: InkWell(
              onTap: () => ScaffoldMessenger.of(context).clearSnackBars(),
              child: SizedBox(
                width: 20,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/cancel.svg"),
                  ],
                ),
              ),
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: (style == SnackbarStyle.error
                          ? Colors.red
                          : style == SnackbarStyle.alert
                              ? Colors.amber
                              : style == SnackbarStyle.success
                                  ? Colors.green
                                  : Colors.red)
                      .withOpacity(0.2),
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                child: Icon(
                  style == SnackbarStyle.error
                      ? Icons.info_outline
                      : style == SnackbarStyle.alert
                          ? Icons.warning_amber_rounded
                          : style == SnackbarStyle.success
                              ? Icons.check_circle_outline
                              : Icons.info_outline,
                  color: style == SnackbarStyle.error
                      ? Colors.red
                      : style == SnackbarStyle.alert
                          ? Colors.amber
                          : style == SnackbarStyle.success
                              ? Colors.green
                              : Colors.red,
                  size: 26,
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: Text(
                  "${subtitle.tr()}",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              InkWell(
                onTap: () => ScaffoldMessenger.of(context).clearSnackBars(),
                child: Container(
                  width: 20,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/cancel.svg"),
                    ],
                  ),
                ),
              ),
            ],
          ),
  ));
}
