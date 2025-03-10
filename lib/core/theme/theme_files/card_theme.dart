import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomCardThemeData {
  CustomCardThemeData._();

  static const lightTheme = CardTheme(
    surfaceTintColor: myGrey,
    margin: EdgeInsets.all(5),
  );
  static const darkTheme = CardTheme(
    elevation: 5.0,
    color: myBlueBackground22,
    margin: EdgeInsets.all(5),
    surfaceTintColor: myWhite,
  );
}
