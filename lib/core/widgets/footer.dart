import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/utils/utilities.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/custom_rich_text.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final deviceType = getDeviceType(screenWidth);

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        final theme = CustomAppTheme.instance;
        final themeMode = context.watch<ThemeCubit>().state;
        bool isDarkMode = theme.checkDarkMode(context, themeMode);
        return CustomBlurContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomRichText(
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  textSpan: TextSpan(
                    children: [
                      TextSpan(
                        text: "© 2025 ",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextSpan(
                        text: "uldjoss56",
                        style: TextStyle(
                          fontFamily: "Lusitana",
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      TextSpan(
                        text: " - All rights reserved",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                    style: TextStyle(),
                  ),
                ),
              ),
              deviceType != DeviceType.smartphone
                  ? imageAsset(
                      "assets/imgs/logos/logo_0${isDarkMode ? "2" : "1"}.png",
                      width: 50,
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
