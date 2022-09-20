import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';

showFDDialog(BuildContext context,
    {required String title, String? msg, required Icon icon}) {
  final theme = Theme.of(context);
  Widget okButton = FDButton(
    title: "اغلاق",
    backgroundColor: theme.scaffoldBackgroundColor,
    color: Colors.black,
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
    ),
    titlePadding:
        const EdgeInsets.all(kDefaultPadding * 1.5).copyWith(bottom: 0),
    contentPadding: const EdgeInsets.all(kDefaultPadding * 1.5)
        .copyWith(top: kDefaultPadding),
    insetPadding: const EdgeInsets.all(kDefaultPadding * 1.5),
    actionsPadding:
        const EdgeInsets.all(kDefaultPadding * 1.5).copyWith(top: 0),
    title: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title.tr(),
        maxLines: 1,
        style: theme.textTheme.titleMedium?.copyWith(
          color: icon.color,
        ),
      ),
      trailing: icon,
    ),
    content: Text(msg!.tr(), style: theme.textTheme.bodySmall),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
