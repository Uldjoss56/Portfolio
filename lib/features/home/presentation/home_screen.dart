import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/animations/entrance_fader.dart';
import 'package:portfolio/core/animations/zoom_animation.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/widgets/custom_rich_text.dart';
import 'package:portfolio/core/widgets/eleveted_button.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/main/data/data.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_html/html.dart' as html;

part 'home_desktop.dart';
part 'home_tab.dart';
part 'home_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      desktop: HomeDesktop(),
    );
  }
}
