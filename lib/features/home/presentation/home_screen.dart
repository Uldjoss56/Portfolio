import 'package:flutter/material.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/features/home/presentation/home_desktop.dart';
import 'package:portfolio/features/home/presentation/home_mobile.dart';
import 'package:portfolio/features/home/presentation/home_tab.dart';

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
