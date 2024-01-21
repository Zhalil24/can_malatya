import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  CustomColorScheme._();

  /// Light color scheme set
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFF8135),
    onPrimary: Color(0xFFFF863A),
    primaryContainer: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFFAA1212),
    secondary: Color.fromARGB(255, 0, 0, 0),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE8DEF8),
    onSecondaryContainer: Color(0xFF1D192B),
    tertiary: Color(0xFF7D5260),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD8E4),
    onTertiaryContainer: Color(0xFF31111D),
    error: Color(0xFF31111D),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF410E0B),
    outline: Color(0xFF79747E),
    background: Color(0xFFFFFBFE),
    onBackground: Color(0xFF1C1B1F),
    surface: Color.fromARGB(255, 179, 179, 179),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFD0BCFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF6750A4),
    outlineVariant: Color(0xFFCAC4D0),
    scrim: Color(0xFF000000),
  );

  /// Light dark scheme set
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD0BCFF), // Birincil
    onPrimary: Color(0xFF381E72), // Birincil Üzerine
    primaryContainer: Color(0xFF4F378B), // Birincil Konteyner
    onPrimaryContainer: Color(0xFFEADDFF), // Birincil Üzerine Konteyner
    secondary: Color(0xFFFFFFFF), // İkincil
    onSecondary: Color(0xFF332D41), // İkincil Üzerine
    secondaryContainer: Color(0xFF4A4458), // İkincil Konteyner
    onSecondaryContainer: Color(0xFFE8DEF8), // İkincil Üzerine Konteyner
    tertiary: Color(0xFFEFB8C8), // Üçüncül
    onTertiary: Color(0xFF492532), // Üçüncül Üzerine
    tertiaryContainer: Color(0xFF633B48), // Üçüncül Konteyner
    onTertiaryContainer: Color(0xFFFFD8E4), // Üçüncül Üzerine Konteyner
    error: Color(0xFFF2B8B5), // Hata
    onError: Color(0xFF601410), // Hata Üzerine
    errorContainer: Color(0xFF8C1D18), // Hata Konteyner
    onErrorContainer: Color(0xFFF9DEDC), // Hata Üzerine Konteyner
    outline: Color(0xFF938F99), // Anahat
    background: Color(0xFF375064), // Arka Plan
    onBackground: Color(0xFFE6E1E5), // Arka Plan Üzerine
    surface: Color(0xFF1C1B1F), // Yüzey
    onSurface: Color(0xFFE6E1E5), // Yüzey Üzerine
    surfaceVariant: Color(0xFF49454F), // Yüzey Çeşidi
    onSurfaceVariant: Color(0xFFCAC4D0), // Yüzey Çeşidi Üzerine
    inverseSurface: Color(0xFFE6E1E5), // Ters Yüzey
    onInverseSurface: Color(0xFF313033), // Ters Yüzey Üzerine
    inversePrimary: Color(0xFF6750A4), // Ters Birincil
    shadow: Color(0xFF000000), // Gölge
    surfaceTint: Color(0xFFD0BCFF), // Yüzey Tonu
    outlineVariant: Color(0xFF49454F), // Anahat Çeşidi
    scrim: Color(0xFF000000), // Perde
  );
}
