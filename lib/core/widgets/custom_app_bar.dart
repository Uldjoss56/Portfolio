import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/core/widgets/navbar_actions_button.dart';
import 'package:portfolio/cubit/scroll/scroll_cubit.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/data/data.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeIndex) {
        return Responsive(
          desktop: _navbarDesktop(context),
          mobile: _navBarTablet(context),
          tablet: _navBarTablet(context),
        );
      },
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Hero(
            tag: "app_bar",
            child: AppBar(
              title: (Responsive.isDesktop(context))
                  ? Row(
                      children: [
                        imageAsset(
                          "assets/imgs/logos/logo_00.png",
                          fit: BoxFit.cover,
                          width: 30,
                        ),
                        const Spacer(),
                        _buildDesktopMenu(context),
                      ],
                    )
                  : Row(
                      children: [
                        const Spacer(),
                        imageAsset(
                          "assets/imgs/logos/logo_00.png",
                          fit: BoxFit.cover,
                          width: 30,
                        ),
                      ],
                    ),
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
*/

  _navbarDesktop(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width / 8,
        vertical: 10,
      ),
      child: Row(
        children: [
          imageAsset(
            "assets/imgs/logos/logo_00.png",
            fit: BoxFit.cover,
            width: 30,
          ),
          const Spacer(),
          ...appBarSectionData.asMap().entries.map(
                (e) => NavBarActionButton(
                  label: e.value["name"],
                  index: e.key,
                ),
              ),
          SizedBox(
            width: 20,
          ),
          _buildThemeToggleButton(
            context,
          ),
        ],
      ),
    );
  }

  _navBarTablet(BuildContext context) {
    final drawerCubit = context.read<DrawerCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isTablet(context) ? 10.w : 10,
        vertical: 10,
      ),
      child: Row(
        children: [
          IconButton(
            highlightColor: myWhiteAA,
            onPressed: () {
              drawerCubit.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          const Spacer(),
          imageAsset(
            "assets/imgs/logos/logo_00.png",
            fit: BoxFit.cover,
            width: 30,
          ),
        ],
      ),
    );
  }

  /// Construit le bouton de changement de thème
  Widget _buildThemeToggleButton(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;
    final isDarkMode = theme.checkDarkMode(context, themeMode);
    final isSysMode = themeMode == ThemeMode.system;

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
            isSysMode
                ? Icons.brightness_4_rounded
                : Icons.brightness_4_outlined,
          ),
        ),
        IconButton(
          onPressed: isSysMode
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
            color: isSysMode
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
