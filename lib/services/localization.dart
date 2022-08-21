import 'package:flutter/cupertino.dart';

bool isArbic(BuildContext context) {
  return Localizations.localeOf(context) == const Locale('ar', 'IQ');
}
