import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
|--------------------------------------------------------------------------
| Default text theme
|--------------------------------------------------------------------------
*/

final TextTheme defaultTextTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    fontSize: 22.0,
  ),
  headlineMedium: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  ),
  displaySmall: GoogleFonts.geologica(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
  ),
  displayMedium: GoogleFonts.geologica(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
  ),
  displayLarge: GoogleFonts.geologica(
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: TextStyle(),
  bodyLarge: TextStyle(
    fontSize: 18.0,
  ),
  bodyMedium: TextStyle(
    fontSize: 15.5,
  ),
  bodySmall: TextStyle(
    fontSize: 13.0,
  ),
);
