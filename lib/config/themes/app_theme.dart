import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFF5909C8);
  static const Color primaryDark = Color(0xFFB986FF);

  static const Color bgLight = Color(0xffE7E7E7);
  static const Color gbDark = Color(0xFF555555);

  static const Color textLight = Color(0xFF0D0D0D);
  static const Color textDark = Color(0xffFFFFFF);
  static final String fontFamily = GoogleFonts.delius.toString();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: bgLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(primaryLight),
      )
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 26,
        color: textLight,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 22,
        color: textLight,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        color: textLight,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: textLight,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        borderSide: BorderSide(width: 1),
      ),
    ),
  );
}
