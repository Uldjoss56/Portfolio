import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/utils/constant.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/contacts/data/data.dart';
import 'package:sizer/sizer.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;
    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    return Column(
      children: [
        SizedBox(
          height: 10.w,
        ),
        Text(
          "Let's try my service now!",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: isDarkMode ? myWhite : myBlackAA,
              ),
        ),
        SizedBox(
          height: 3.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Text(
            "Let's work together and make everything super cute and super useful.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                ),
          ),
        ),
        SizedBox(
          height: 5.w,
        ),
        InkWell(
          onTap: () => openURL(contactData[2]["url"] as String),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              gradient: buttonGradi,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Get Started',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: myWhite,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: 10.w,
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
        SizedBox(
          height: 5.w,
        ),
        Container(
          color: myWhite.withValues(
            alpha: 0.2,
          ),
          height: 1,
        ),
        SizedBox(
          height: 5.w,
        ),
      ],
    );
  }
}
