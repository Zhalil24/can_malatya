import 'package:flutter/material.dart';

import 'custom_color_schme.dart';
import 'text_theme_dark.dart';

final class CustomDarkTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        scaffoldBackgroundColor: const Color(0xFF375064),
        textTheme: textTheme(),
      );

  TextTheme textTheme() {
    return ThemeData.dark().textTheme.copyWith(
          titleSmall: TextThemeDark().viewTitle,
          titleMedium: TextThemeDark().authTitle,
          titleLarge: TextThemeDark().appTitle,
          displaySmall: TextThemeDark().bodyText2,
          displayMedium: TextThemeDark().bodyText1,
          displayLarge: TextThemeDark().bottomAppBarText,
          labelMedium: TextThemeDark().authButtonText,
          labelLarge: TextThemeDark().appBarText,
          headlineSmall: TextThemeDark().bodyTexts,
        );
  }
}
