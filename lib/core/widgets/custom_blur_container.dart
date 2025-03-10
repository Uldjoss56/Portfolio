import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class CustomBlurContainer extends StatelessWidget {
  const CustomBlurContainer({
    super.key,
    this.child,
    this.paddingValue,
    this.borderRadius,
  });
  final double? paddingValue;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          padding: EdgeInsets.all(paddingValue ?? 20),
          decoration: BoxDecoration(
            color: !isDarkMode ? myBlack22 : myGrey22,
          ),
          child: child,
        ),
      ),
    );
  }
}
