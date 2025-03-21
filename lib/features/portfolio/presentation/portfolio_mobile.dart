import 'package:carousel_slider/carousel_slider.dart';
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

class PortfolioMobile extends StatefulWidget {
  const PortfolioMobile({super.key});

  @override
  State<PortfolioMobile> createState() => _PortfolioMobileState();
}

class _PortfolioMobileState extends State<PortfolioMobile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;
    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    return Column(
      children: [
        Text(
          "\nProjects",
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
            "Since the beginning of my journey as a designer and developer, I have created digital products for business and consumer use. This is a little bit.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                ),
          ),
        ),
        SizedBox(
          height: 5.w,
        ),
        CarouselSlider.builder(
          itemCount: projectData.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ProjectCard(
              project: projectData[i],
            ),
          ),
          options: CarouselOptions(
            height: height * 0.4,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
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
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
