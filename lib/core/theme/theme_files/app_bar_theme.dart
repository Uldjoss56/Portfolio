import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomAppBarThemeData {
  CustomAppBarThemeData._();

  static const lightTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: myBlack,
    centerTitle: false,
    surfaceTintColor: myBlack,
  );
  static const darkTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: false,
    surfaceTintColor: Colors.transparent,
    foregroundColor: myWhite,
  );
}
