import 'package:flutter/material.dart';

const kBorderColor = Color(0xFFE2E6EB);
const kLoadingColorLight = Color(0xFFecf1f5);
const kLoadingColorDark = Color(0xFF464A53);
const kDisableColor = Color(0xFFF3F5F7);
const kPrimaryColor = Color.fromARGB(255, 10, 196, 238);
const kGrayCardColor = Color(0xFFF3F5F7);
const kIconColor = Color(0xFFBBC4C9);
const kDisableTextColor = Color(0xFF97A0AA);
const kIconActiveDark = Color(0xFFE6DBF3);
const kOutlineColor = Color(0xFF41444A);
const kPrimary = Color(0xFF1FA35E);
const kSecondaryColor = Color(0xFFFFC000);
const kGray1 = Color(0xFFF2F3F4);
const kErrorColor = Color(0xFFEA4747);
MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
