import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/utils/utilities.dart';
import 'package:portfolio/core/widgets/arrow_on_top.dart';
import 'package:portfolio/core/widgets/custom_app_bar.dart';
import 'package:portfolio/core/widgets/drawer.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/cubit/scroll/scroll_cubit.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part '_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        final theme = CustomAppTheme.instance;
        final themeMode = context.watch<ThemeCubit>().state;
        bool isDarkMode = theme.checkDarkMode(context, themeMode);

        final drawerCubit = context.read<DrawerCubit>();
        return Scaffold(
          key: drawerCubit.state,
          //extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: CustomAppBar(),
          ),
          drawer: !Responsive.isDesktop(context)
              ? Hero(
                  tag: "app_bar",
                  child: SideNavMenu(
                  ),
                )
              : null,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: imageAsset(
                  'assets/imgs/photos/background_0${isDarkMode ? "1" : "2"}.jpg',
                  opacity: AlwaysStoppedAnimation<double>(
                    isDarkMode ? 0.2 : 0.05,
                  ),
                  width: screenWidth,
                  height: screenHeight,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              _Body(),
              ArrowOnTop(),
            ],
          ),
        );
      },
    );
  }
}
