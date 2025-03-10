import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomTextButtonTheme {
  CustomTextButtonTheme._();

  static final lightTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: myBlack,
    ),
  );
  static final darkTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: myWhite,
    ),
  );
}
