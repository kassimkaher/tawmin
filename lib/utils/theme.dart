import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'color.dart';

getTheme(BuildContext context) {
  final theme = ThemeData(
    primarySwatch: createMaterialColor(kPrimary),
    fontFamily:
        context.locale.languageCode.contains('ar') ? "Somar" : "Poppins",
  );

  final isDarkMode =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  return isDarkMode && false
      ? theme.copyWith(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
              secondary: kSecondaryColor,
              primary: kPrimary,
              outline: kOutlineColor,
              surface: Color(0x11F6F8FB),
              surfaceTint: kLoadingColorDark,
              tertiary: Colors.white),
          dividerColor: kOutlineColor,
          iconTheme: const IconThemeData(color: kIconActiveDark),
          disabledColor: const Color(0xFF41444A),
          scaffoldBackgroundColor: const Color(0xFF171920),
          cardColor: const Color(0xFF292C34),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF171920),
          ),
          textTheme: theme.textTheme.copyWith(
            titleLarge: theme.textTheme.titleLarge
                ?.copyWith(fontSize: 48, color: kPrimary),
            titleMedium:
                theme.textTheme.titleMedium?.copyWith(color: Colors.white),
            titleSmall:
                theme.textTheme.titleSmall?.copyWith(color: Colors.white),
            bodyLarge: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
            bodyMedium:
                theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            bodySmall: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF97A0AA),
            ),
            displaySmall: theme.textTheme.bodyText2
                ?.copyWith(color: const Color(0xFF97A0AA), fontSize: 14),
          ),
          splashColor: Colors.transparent,
          highlightColor: const Color(0x11440099),
        )
      // theme style if light mode

      : theme.copyWith(
          scaffoldBackgroundColor: kGray1,
          brightness: Brightness.light,
          //disabledColor: kBorderColor,
          colorScheme: const ColorScheme.dark(
            secondary: kSecondaryColor,
            primary: kPrimary,
            outline: Color(0xFFD7DADF),
            surface: Color(0xFFEDEDF1),
            tertiary: Color(0xFFEDEDF1),
            surfaceTint: kLoadingColorLight,
          ),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          cardColor: kGrayCardColor,
          iconTheme: const IconThemeData(color: Colors.black),
          textTheme: theme.textTheme.copyWith(
            titleLarge: theme.textTheme.titleLarge
                ?.copyWith(fontSize: 40, color: kPrimary, fontFamily: 'Somar'),
            titleMedium: theme.textTheme.titleMedium?.copyWith(
                fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Somar'),
            titleSmall: theme.textTheme.titleSmall?.copyWith(
                fontSize: 16, color: Color(0xFF87909F), fontFamily: 'Somar'),
            bodyLarge: theme.textTheme.bodyLarge?.copyWith(fontFamily: 'Somar'),
            bodyMedium:
                theme.textTheme.bodyMedium?.copyWith(fontFamily: 'Somar'),
            bodySmall: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'Somar',
              color: const Color(0xFFA0A0A0),
            ),
            displaySmall: theme.textTheme.bodyText2?.copyWith(
                color: const Color(0xFF97A0AA),
                fontSize: 14,
                fontFamily: 'Somar'),
          ),
          splashColor: Colors.transparent,
          highlightColor: const Color(0x11440099),
        );
}
