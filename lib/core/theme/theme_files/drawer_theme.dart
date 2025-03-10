import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomDrawerThemeData {
  CustomDrawerThemeData._();

  static final lightTheme = DrawerThemeData(
    backgroundColor: myWhite22,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  static final darkTheme = DrawerThemeData(
    backgroundColor: myBlueBackground55,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
