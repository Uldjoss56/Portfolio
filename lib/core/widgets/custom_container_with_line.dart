import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class CustomContainerWithLine extends StatelessWidget {
  const CustomContainerWithLine({
    super.key,
    required this.widgetToAdd,
  });

  final Widget widgetToAdd;

  @override
  Widget build(context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;
    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: myTurquois,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Container(
                  width: 3,
                  decoration: BoxDecoration(
                    color: !isDarkMode ? myBlack22 : myWhiteAA,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: widgetToAdd,
          ),
        ],
      ),
    );
  }
}
