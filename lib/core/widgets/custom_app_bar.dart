import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/utils/utilities.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/data/data.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.currentUrl,
  });

  final String currentUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final deviceType = getDeviceType(screenWidth);

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeIndex) {
        return Hero(
          tag: "app_bar",
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (deviceType == DeviceType.desktop)
                  imageAsset(
                    "assets/imgs/logos/logo_00.png",
                    fit: BoxFit.cover,
                    width: 30,
                  ),
                if (deviceType == DeviceType.desktop)
                  _buildDesktopMenu(context)
                else
                  const Spacer(),
                if (deviceType != DeviceType.desktop)
                  imageAsset(
                    "assets/imgs/logos/logo_00.png",
                    fit: BoxFit.cover,
                    width: 30,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Construit le menu desktop
  Widget _buildDesktopMenu(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            appBarSectionData.length,
            (index) {
              final appBarSection = appBarSectionData[index];
              return TextButton(
                onPressed: currentUrl != appBarSection["url"]
                    ? () => context.go(appBarSection["url"])
                    : null,
                child: Text(appBarSection["name"]),
              );
            },
          ),
        ),
        const SizedBox(width: 40),
        _buildThemeToggleButton(
          context,
        ),
      ],
    );
  }

  /// Construit le bouton de changement de thème
  Widget _buildThemeToggleButton(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;
    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (themeMode != ThemeMode.system) {
              themeCubit.setTheme(ThemeMode.system);
            } else {
              themeCubit.setTheme(ThemeMode.dark);
            }
          },
          icon: Icon(
            themeMode == ThemeMode.system
                ? Icons.brightness_4_rounded
                : Icons.brightness_4_outlined,
          ),
        ),
        IconButton(
          onPressed: themeMode == ThemeMode.system
              ? null
              : () {
                  if (isDarkMode) {
                    themeCubit.setTheme(ThemeMode.light);
                  } else {
                    themeCubit.setTheme(ThemeMode.dark);
                  }
                },
          icon: Icon(
            isDarkMode
                ? Icons.brightness_2_rounded
                : Icons.brightness_7_rounded,
            color: themeMode == ThemeMode.system
                ? isDarkMode
                    ? myBlack
                    : myWhite
                : null,
          ),
        ),
      ],
    );
  }
}
