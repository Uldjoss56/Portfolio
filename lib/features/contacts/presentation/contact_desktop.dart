import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/utils/constant.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/contacts/data/data.dart';
import 'package:sizer/sizer.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        children: [
          Text(
            "\nGet in Touch",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: isDarkMode ? myWhite : myBlackAA,
                ),
          ),
          SizedBox(
            height: 1.w,
          ),
          const Text(
            "If you want to avail my services you can contact me at the links below.",
          ),
          SizedBox(
            height: 2.w,
          ),
          CustomBlurContainer(
            paddingValue: 40,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's try my service now!",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 12,
                                ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Text(
                            "Let's work together and make everything super cute and super useful.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => openURL(contactData[2]["url"] as String),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: buttonGradi,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Get Started',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: myWhite,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white.withValues(
                    alpha: 0.2,
                  ),
                  height: 1,
                ),
                SizedBox(
                  height: 2.w,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 50,
                  spacing: 20,
                  children: List.generate(contactData.length, (index) {
                    final data = contactData[index];
                    return InkWell(
                      child: imageAsset(
                        data["img"] as String,
                        width: 30,
                      ),
                      onTap: () {
                        openURL(data["url"] as String);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
