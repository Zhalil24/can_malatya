import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color_schme.dart';

class TextThemeLight {
  final TextStyle appTitle = TextStyle(
    fontSize: 35,
    fontFamily: GoogleFonts.sansita().fontFamily,
    fontWeight: FontWeight.w600,
    color: CustomColorScheme.lightColorScheme.secondary,
  );
  final TextStyle authTitle = TextStyle(
    fontSize: 44,
    fontFamily: GoogleFonts.sansita().fontFamily,
    fontWeight: FontWeight.w700,
    color: CustomColorScheme.lightColorScheme.secondary,
  );
  final TextStyle viewTitle = TextStyle(
    fontSize: 20,
    fontFamily: GoogleFonts.sansita().fontFamily,
    fontWeight: FontWeight.w700,
    color: CustomColorScheme.lightColorScheme.secondary,
  );

  final TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontFamily: GoogleFonts.oswald().fontFamily,
    fontWeight: FontWeight.w700,
    color: CustomColorScheme.lightColorScheme.secondary,
  );
  final TextStyle bodyText2 = TextStyle(
    fontSize: 18,
    fontFamily: GoogleFonts.overpass().fontFamily,
    fontWeight: FontWeight.w800,
    color: CustomColorScheme.lightColorScheme.secondary,
  );
  final TextStyle authButtonText = TextStyle(
    fontSize: 25,
    fontFamily: GoogleFonts.sansita().fontFamily,
    fontWeight: FontWeight.bold,
    color: CustomColorScheme.lightColorScheme.secondary,
  );
  final TextStyle appBarText = TextStyle(
    fontSize: 30,
    fontFamily: GoogleFonts.oswald().fontFamily,
    fontWeight: FontWeight.bold,
    color: CustomColorScheme.lightColorScheme.primary,
  );
  final TextStyle bottomAppBarText = TextStyle(
    fontSize: 25,
    fontFamily: GoogleFonts.abel().fontFamily,
    fontWeight: FontWeight.bold,
    color: CustomColorScheme.lightColorScheme.onSecondary,
  );
  final TextStyle bodyTexts = TextStyle(
    fontSize: 15,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w800,
    color: CustomColorScheme.darkColorScheme.onSecondary,
  );
}
