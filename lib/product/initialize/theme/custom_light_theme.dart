import 'package:flutter/material.dart';

import 'custom_color_schme.dart';
import 'text_theme_light.dart';

final class CustomLightTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomColorScheme.lightColorScheme.primary),
        )),
        scaffoldBackgroundColor: const Color(0xffF0F4F3),
        textTheme: textTheme(),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          border: UnderlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
        ),
      );

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
          titleSmall: TextThemeLight().viewTitle,
          titleMedium: TextThemeLight().authTitle,
          titleLarge: TextThemeLight().appTitle,
          displaySmall: TextThemeLight().bodyText2,
          displayMedium: TextThemeLight().bodyText1,
          displayLarge: TextThemeLight().bottomAppBarText,
          labelMedium: TextThemeLight().authButtonText,
          labelLarge: TextThemeLight().appBarText,
          headlineSmall: TextThemeLight().bodyTexts,
        );
  }
}
