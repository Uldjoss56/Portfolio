import 'package:portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarThemeData {
  CustomBottomNavBarThemeData._();

  static const lightTheme = BottomNavigationBarThemeData(
    backgroundColor: myBlack,
    elevation: 0,
  );
  static const darkTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
