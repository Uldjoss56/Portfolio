import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/animations/zoom_animation.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/widgets/custom_rich_text.dart';
import 'package:portfolio/core/widgets/eleveted_button.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/main/data/data.dart';
import 'package:sizer/sizer.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    return SizedBox(
      height: 80.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 55.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    maxLines: 3,
                    textSpan: TextSpan(
                      children: [
                        TextSpan(
                          text: "🖐️ ",
                          style: TextStyle(
                            fontFamily: "Noto Color Emoji",
                            fontSize: 24,
                          ),
                        ),
                        TextSpan(
                          text: "Hello guys, welcome here !",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: " 🖐️",
                          style: TextStyle(
                            fontFamily: "Noto Color Emoji",
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "I'm  ",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: isDarkMode ? myWhite : myBlackAA,
                        ),
                  ),
                  CustomRichText(
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    textSpan: TextSpan(
                      children: [
                        TextSpan(
                          text: "Comlan Ulrich",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: myTurquois,
                              ),
                        ),
                        TextSpan(
                          text: "\nDJOSSOU",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                color: myTurquois,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.5.w,
                  ),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: myOrange01,
                        ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Mobile Developer'),
                        TypewriterAnimatedText('XR developer'),
                        TypewriterAnimatedText('UI/UX Designer'),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(
                      shortAboutMe,
                    ),
                  ),
                  SizedBox(
                    height: 3.w,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 150,
                    ),
                    child: CustomElevatedButton(
                      label: "Download CV",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const ZoomAnimations(),
          ],
        ),
      ),
    );
  }
}
