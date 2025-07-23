import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static final TextTheme textThemeLight = TextTheme(
    headlineLarge: GoogleFonts.poppins().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: myBlack,
    ),
    headlineMedium: GoogleFonts.poppins().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: myBlack,
    ),
    headlineSmall: GoogleFonts.poppins().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: myBlack,
    ),
    titleLarge: GoogleFonts.poppins().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: myBlack,
    ),
    titleMedium: GoogleFonts.poppins().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: myBlack,
    ),
    titleSmall: GoogleFonts.poppins().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: myBlack,
    ),
    bodyLarge: GoogleFonts.poppins().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: myBlack,
    ),
    bodyMedium: GoogleFonts.poppins().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: myBlack,
    ),
    bodySmall: GoogleFonts.poppins().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: myBlackAA,
    ),
    labelLarge: GoogleFonts.poppins().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: myBlack,
    ),
    labelMedium: GoogleFonts.poppins().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: myBlackAA,
    ),
    labelSmall: GoogleFonts.poppins().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: myBlack55,
    ),
  );

  static final TextTheme textThemeDark = TextTheme(
    headlineLarge: GoogleFonts.poppins().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: myWhite,
    ),
    headlineMedium: GoogleFonts.poppins().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: myWhite,
    ),
    headlineSmall: GoogleFonts.poppins().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: myWhite,
    ),
    titleLarge: GoogleFonts.poppins().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: myWhite,
    ),
    titleMedium: GoogleFonts.poppins().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: myWhite,
    ),
    titleSmall: GoogleFonts.poppins().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: myWhite,
    ),
    bodyLarge: GoogleFonts.poppins().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: myWhite,
    ),
    bodyMedium: GoogleFonts.poppins().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: myWhite,
    ),
    bodySmall: GoogleFonts.poppins().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: myWhiteAA,
    ),
    labelLarge: GoogleFonts.poppins().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: myWhite,
    ),
    labelMedium: GoogleFonts.poppins().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: myWhiteAA,
    ),
    labelSmall: GoogleFonts.poppins().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: myWhite55,
    ),
  );
}
