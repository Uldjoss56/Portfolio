import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({
    super.key,
    required this.takeCurrentIndex,
    required this.bottomList,
    required this.currentIndex,
  });
  final List<Map<String, dynamic>> bottomList;
  final int currentIndex;
  final void Function(int currentIndex) takeCurrentIndex;
  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;
    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    final bottomList = widget.bottomList;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.transparent,
          color: isDarkMode ? myGrey22 : myWhite,
          index: widget.currentIndex,
          onTap: (value) {
            widget.takeCurrentIndex(value);
          },
          items: List.generate(bottomList.length, (index) {
            final bottom = bottomList[index];
            if (widget.currentIndex == index) {
              return ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  myTurquois,
                  BlendMode.srcIn,
                ),
                child: bottom['icon'],
              );
            }

            return ColorFiltered(
              colorFilter: ColorFilter.mode(
                !isDarkMode ? myBlack : myWhite,
                BlendMode.srcIn,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  bottom['icon'],
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    bottom["label"],
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
