import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {

  // 🌞 LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,

    textTheme: GoogleFonts.workSansTextTheme(
      const TextTheme(

        // 🔥 SPLASH / HERO HEADING
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          height: 1,
          letterSpacing: 0,
          color: AppColors.black, // #1C1F34
        ),

        // SECTION / PAGE HEADINGS
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.heading,
        ),

        // BODY TEXT
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.bodyText,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.workSans(
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );

  // 🌙 DARK THEME (SPLASH / AUTH)
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,

    textTheme: GoogleFonts.workSansTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.white,
        ),
      ),
    ),
  );
}
