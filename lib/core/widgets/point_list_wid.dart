import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class PointListingWidg extends StatelessWidget {
  const PointListingWidg({
    super.key,
    required this.items,
  });

  final List<dynamic> items;

  @override
  Widget build(context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return Column(
      children: List.generate(items.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: !isDarkMode ? myBlack : myWhite,
                  shape: BoxShape.circle,
                ),
              ),
              const Text(
                "• ",
                style: TextStyle(fontSize: 24),
              ),
              Expanded(child: Text(items[index])),
            ],
          ),
        );
      }),
    );
  }
}
