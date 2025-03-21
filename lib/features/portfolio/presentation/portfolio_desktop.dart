import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/utils/constant.dart';
import 'package:portfolio/core/widgets/project_card.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/contacts/data/data.dart';
import 'package:portfolio/features/portfolio/data/data.dart';
import 'package:sizer/sizer.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({super.key});

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;
    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      child: Column(
        children: [
          Text(
            "\nProjects",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: isDarkMode ? myWhite : myBlackAA,
                ),
          ),
          SizedBox(
            height: 1.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Text(
              "Since the beginning of my journey as a designer and developer, I have created digital products for business and consumer use. This is a little bit.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 3.w,
            children: List.generate(projectData.length, (index) {
              final data = projectData[index];
              return ProjectCard(
                project: data,
              );
            }),
          ),
          SizedBox(
            height: 3.w,
          ),
          OutlinedButton(
            onPressed: () => openURL(contactData[0]["url"] as String),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'See More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
