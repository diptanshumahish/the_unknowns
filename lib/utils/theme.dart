import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const themeColor = Color(0xFFe5d4ef);
  static const secThemeColor = Color(0xFFfbe0e0);
  static const tertThemeColor = Color(0xFFd7f9f8);
  static const lightBack = Color(0xFFffffea);
  static const lightBack2 = Color(0xFffff0d4);
  static const darkBack = Color(0xFF252424);
  static const darkText = Color(0xFF252424);
  static const lightText = Color(0xFFECE5E5);
}

//themes
abstract class Apptheme {
  static var brgthDark = Brightness.dark;
//light theme
  static ThemeData light() => ThemeData(
      textTheme: GoogleFonts.amaticScTextTheme().apply(),
      scaffoldBackgroundColor: AppColors.lightBack);
  static ThemeData dark() => ThemeData(
        scaffoldBackgroundColor: AppColors.darkBack,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.amaticScTextTheme()
            .apply(displayColor: AppColors.lightText),
      );
}
