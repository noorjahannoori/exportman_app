// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'colors.dart';

// class AppTheme {

//   // 🌞 LIGHT THEME
//   static ThemeData lightTheme = ThemeData(
//     scaffoldBackgroundColor: AppColors.background,
//     primaryColor: AppColors.primary,

//     textTheme: GoogleFonts.workSansTextTheme(
//       const TextTheme(

//         // 🔥 SPLASH / HERO HEADING
//         displayLarge: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.w500,
//           height: 1,
//           letterSpacing: 0,
//           color: AppColors.black, // #1C1F34
//         ),

//         // SECTION / PAGE HEADINGS
//         headlineMedium: TextStyle(
//           fontSize: 22,
//           fontWeight: FontWeight.w500,
//           height: 1,
//           color: AppColors.heading,
//         ),

//         // BODY TEXT
//         bodyMedium: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           height: 1,
//           color: AppColors.bodyText,
//         ),
//       ),
//     ),

//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primary,
//         foregroundColor: AppColors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         textStyle: GoogleFonts.workSans(
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ),
//   );

//   // 🌙 DARK THEME (SPLASH / AUTH)
//   static ThemeData darkTheme = ThemeData(
//     scaffoldBackgroundColor: AppColors.darkBackground,

//     textTheme: GoogleFonts.workSansTextTheme(
//       const TextTheme(
//         displayLarge: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.w500,
//           height: 1,
//           color: AppColors.white,
//         ),
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  // 🌞 LIGHT THEME (MAIN APP)
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,

    textTheme: GoogleFonts.workSansTextTheme(
      const TextTheme(
        /// 🔹 Splash / Big Titles
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.black, // #1C1F34
        ),

        /// 🔹 Hello Sara / Hello User
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.black,
        ),

        /// 🔹 Welcome Back Text
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.25,
          color: AppColors.bodyText,
        ),

        /// 🔹 TextField Labels
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColors.bodyText,
        ),

        /// 🔹 Button Text
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: AppColors.white,
        ),
      ),
    ),

    // 🔹 TEXT FIELD THEME (FIGMA MATCH)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.all(20),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary),
      ),

      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.bodyText,
      ),
    ),

    // 🔹 BUTTON THEME
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.workSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  // 🌙 DARK THEME (OPTIONAL / FUTURE)
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
