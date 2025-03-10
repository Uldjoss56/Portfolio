import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:flutter/material.dart';

class CustomItemTile extends StatefulWidget {
  const CustomItemTile({
    super.key,
    required this.title,
    this.subtitle,
    this.iconPath,
    this.onTap,
    this.isLoading,
    this.suffixe,
  });
  final String title;
  final String? subtitle;
  final String? iconPath;
  final Widget? suffixe;
  final bool? isLoading;

  final Function()? onTap;
  @override
  State<StatefulWidget> createState() => _CustomItemTileState();
}

class _CustomItemTileState extends State<CustomItemTile> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: !isDarkMode ? myBlack22 : myGrey22,
          ),
          child: widget.isLoading ?? false
              ? ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    !isDarkMode ? myBlackAA : myWhite,
                    BlendMode.srcIn,
                  ),
                  child: lottieAsset(
                    "assets/animations/loading.json",
                    width: 30,
                    height: 30,
                  ),
                )
              : InkWell(
                  onTap: widget.onTap,
                  child: Row(
                    children: [
                      if (widget.iconPath != null)
                        imageAsset(
                          widget.iconPath!,
                          width: 40,
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            if (widget.subtitle != null)
                              Text(
                                widget.subtitle!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (widget.suffixe != null) widget.suffixe!,
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
