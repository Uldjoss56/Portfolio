import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/widgets/custom_check_box.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/cubit/scroll/scroll_cubit.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/data/data.dart';

class SideNavMenu extends StatefulWidget {
  const SideNavMenu({
    super.key,
  });

  @override
  State<SideNavMenu> createState() => _SideNavMenuState();
}

class _SideNavMenuState extends State<SideNavMenu> {
  bool onExpending = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) {
      final themeCubit = context.read<ThemeCubit>();

      final theme = CustomAppTheme.instance;
      final themeMode = context.watch<ThemeCubit>().state;
      final isDarkMode = theme.checkDarkMode(context, themeMode);
      final isSysMode = themeMode == ThemeMode.system;

      final scrollController = context.watch<ScrollCubit>().state;

      final selectedIndex = context.watch<SelectedIndexCubit>().state;

      return SizedBox(
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              width: 250,
              color: isDarkMode
                  ? myBlueBackground55
                  : myWhite.withValues(alpha: 0.5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: myWhiteAA,
                            weight: 30,
                            size: 30,
                          ),
                          onPressed: () => context.pop(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        imageAsset(
                          'assets/imgs/logos/logo_0${isDarkMode ? "2" : "1"}.png',
                          fit: BoxFit.contain,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...appBarSectionData.asMap().entries.map(
                            (e) {
                              final isSelected = selectedIndex == e.key;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  hoverColor: myOrange01,
                                  onPressed: () {
                                    context
                                        .read<SelectedIndexCubit>()
                                        .selectIndex(
                                          e.key,
                                        );
                                    scrollController.jumpTo(
                                      index: e.key,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      e.value["icon"],
                                      color: isSelected
                                          ? myOrange01
                                          : isDarkMode
                                              ? myWhite
                                              : myBlackAA,
                                    ),
                                    title: Text(
                                      e.value["name"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            color:
                                                isSelected ? myOrange01 : null,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          ExpansionPanelList(
                            elevation: 0,
                            expandIconColor: isDarkMode ? myWhite : myBlackAA,
                            dividerColor: isDarkMode ? myWhite22 : myBlack22,
                            expansionCallback: (panelIndex, isExpanded) {
                              setState(() {
                                onExpending = isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                splashColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    leading: Icon(
                                      Icons.brightness_4_rounded,
                                      color: isDarkMode ? myWhite : myBlackAA,
                                    ),
                                    title: Text(
                                      "Theme mode",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: isDarkMode
                                                ? myWhite
                                                : myBlackAA,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                    ),
                                  );
                                },
                                body: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomCheckBox(
                                            value: isSysMode,
                                            onChanged: (value) {
                                              if (value) {
                                                themeCubit.setTheme(
                                                  ThemeMode.system,
                                                );
                                              } else {
                                                if (isDarkMode) {
                                                  themeCubit.setTheme(
                                                    ThemeMode.dark,
                                                  );
                                                } else {
                                                  themeCubit.setTheme(
                                                    ThemeMode.light,
                                                  );
                                                }
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "System theme (${isSysMode ? "ON" : "OFF"})",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                    color: isSysMode
                                                        ? isDarkMode
                                                            ? myWhite
                                                            : myBlackAA
                                                        : isDarkMode
                                                            ? myWhiteAA
                                                            : myBlack55,
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: RotatedBox(
                                              quarterTurns: 90,
                                              child: Icon(
                                                Icons.brightness_2_rounded,
                                                size: !isDarkMode ? 15 : 30,
                                                color: isSysMode
                                                    ? myGrey22
                                                    : myWhiteAA,
                                              ),
                                            ),
                                          ),
                                          Switch(
                                            value: !isDarkMode,
                                            activeColor: Colors.transparent,
                                            onChanged: isSysMode
                                                ? null
                                                : (value) {
                                                    if (value) {
                                                      themeCubit.setTheme(
                                                        ThemeMode.light,
                                                      );
                                                    } else {
                                                      themeCubit.setTheme(
                                                        ThemeMode.dark,
                                                      );
                                                    }
                                                  },
                                          ),
                                          Expanded(
                                            child: Icon(
                                              Icons.brightness_7_rounded,
                                              size: isDarkMode ? 15 : 30,
                                              color: isSysMode
                                                  ? myGrey22
                                                  : myWhiteAA,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                isExpanded: onExpending,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
