import 'package:portfolio/core/theme/theme_files/app_bar_theme.dart';
import 'package:portfolio/core/theme/theme_files/bottom_nav_bar_theme.dart';
import 'package:portfolio/core/theme/theme_files/bottom_sheet_theme.dart';
import 'package:portfolio/core/theme/theme_files/card_theme.dart';
import 'package:portfolio/core/theme/theme_files/dialod_theme.dart';
import 'package:portfolio/core/theme/theme_files/drawer_theme.dart';
import 'package:portfolio/core/theme/theme_files/floating_action_buttom_theme.dart';
import 'package:portfolio/core/theme/theme_files/text_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme_files/eleveted_button_themr.dart';
import 'package:portfolio/core/theme/theme_files/icon_theme.dart';
import 'package:portfolio/core/theme/theme_files/snackbar_theme.dart';
import 'package:portfolio/core/theme/theme_files/text_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static final instance = CustomAppTheme._();

  final lightTheme = ThemeData(
    colorScheme:  ColorScheme.light(primary: myTurquois),
    scaffoldBackgroundColor: myWhiteBackground,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: CustomTextTheme.textThemeLight,
    elevatedButtonTheme:
        CustomElevatedButtonThemeData.elevatedButtonThemeDataLight,
    iconTheme: CustomIconThemeData.lightTheme,
    snackBarTheme: CustomSnackBarTheme.lightTheme,
    cardTheme: CustomCardThemeData.lightTheme,
    appBarTheme: CustomAppBarThemeData.lightTheme,
    floatingActionButtonTheme: CustomFloatingActionButtonTheme.lightTheme,
    dialogTheme: CustomDialogThemeData.lightTheme,
    textButtonTheme: CustomTextButtonTheme.lightTheme,
    bottomNavigationBarTheme: CustomBottomNavBarThemeData.lightTheme,
    bottomSheetTheme: CustomBottomSheetThemeData.lightTheme,
    drawerTheme: CustomDrawerThemeData.lightTheme,
  );

  final darkTheme = ThemeData(
    colorScheme:  ColorScheme.dark(
      primary: myTurquois,
    ),
    scaffoldBackgroundColor: myBlueBackground,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: CustomTextTheme.textThemeDark,
    elevatedButtonTheme:
        CustomElevatedButtonThemeData.elevatedButtonThemeDataDark,
    iconTheme: CustomIconThemeData.darkTheme,
    snackBarTheme: CustomSnackBarTheme.darkTheme,
    cardTheme: CustomCardThemeData.darkTheme,
    appBarTheme: CustomAppBarThemeData.darkTheme,
    floatingActionButtonTheme: CustomFloatingActionButtonTheme.darkTheme,
    dialogTheme: CustomDialogThemeData.darkTheme,
    textButtonTheme: CustomTextButtonTheme.darkTheme,
    bottomNavigationBarTheme: CustomBottomNavBarThemeData.darkTheme,
    drawerTheme: CustomDrawerThemeData.darkTheme,
    bottomSheetTheme: CustomBottomSheetThemeData.darkTheme,
  );

  bool checkDarkMode(BuildContext context, ThemeMode themeMode) {
    bool isDarkMode = false;
    if (themeMode.index == 0) {
      final brightness = MediaQuery.of(context).platformBrightness;
      if (brightness == Brightness.dark) {
        isDarkMode = true;
      } else {
        isDarkMode = false;
      }
    } else if (themeMode.index == 1) {
      isDarkMode = false;
    } else {
      isDarkMode = true;
    }
    return isDarkMode;
    /*
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? true
        : false;
    */
  }
}
