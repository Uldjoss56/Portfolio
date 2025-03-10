import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomDialogThemeData {
  CustomDialogThemeData._();

  static final lightTheme = DialogTheme(
    backgroundColor: myWhite22,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
  static final darkTheme = DialogTheme(
    backgroundColor: myBlueBackground55,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
