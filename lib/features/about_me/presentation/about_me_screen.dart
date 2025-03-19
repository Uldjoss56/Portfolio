import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/widgets/custom_container_with_line.dart';
import 'package:portfolio/core/widgets/infos_tile.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/about_me/data/data.dart';
import 'package:portfolio/features/main/data/data.dart';
import 'package:sizer/sizer.dart';

part 'about_me_desktop.dart';
part 'about_me_mobile.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: AboutMeMobile(),
      tablet: AboutMeMobile(),
      desktop: AboutMeDesktop(),
    );
  }
}
