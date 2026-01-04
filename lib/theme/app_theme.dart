import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,

    textTheme: GoogleFonts.workSansTextTheme(
      const TextTheme(
        /// Splash / Big Titles
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.black,
        ),

        /// Section Headings (Services)
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.black,
        ),

        /// View All
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.primary,
        ),

        /// Service Title
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1,
          color: AppColors.black,
        ),

        /// Description Text
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.25,
          color: AppColors.black,
        ),

        /// Provider Name
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.black,
        ),

        /// Category Tag
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          height: 1,
          color: AppColors.main,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          fontSize: 18,
          color: AppColors.white,
          height: 1,
        ),

        /// Button Text
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    ),
  );
}
