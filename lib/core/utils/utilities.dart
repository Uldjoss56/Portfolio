import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/footer.dart';
import 'package:portfolio/features/about_me/presentation/about_me_screen.dart';
import 'package:portfolio/features/contacts/presentation/contacts_screen.dart';
import 'package:portfolio/features/home/presentation/home_screen.dart';
import 'package:portfolio/features/portfolio/presentation/portfolio_screen.dart';
import 'package:portfolio/features/services_offered/presentation/services_screen.dart';

class BodyUtils {
  static const List<Widget> views = [
    HomeScreen(),
    AboutMeScreen(),
    PortfolioScreen(),
    ServicesScreen(),
    ContactsScreen(),
    Footer(),
  ];
}
