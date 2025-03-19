import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/footer.dart';
import 'package:portfolio/features/about_me/presentation/about_me_screen.dart';
import 'package:portfolio/features/contacts/presentation/contacts_screen.dart';
import 'package:portfolio/features/home/presentation/home_screen.dart';
import 'package:portfolio/features/portfolio/presentation/portfolio_screen.dart';
import 'package:portfolio/features/services_offered/presentation/services_screen.dart';

/*
enum DeviceType {
  smartphone,
  tablette,
  desktop,
}

DeviceType getDeviceType(double screenWidth) {
  final DeviceType deviceType;

  if (screenWidth < 600) {
    deviceType = DeviceType.smartphone;
  } else if (screenWidth < 1024) {
    deviceType = DeviceType.tablette;
  } else {
    deviceType = DeviceType.desktop;
  }
  return deviceType;
}
*/

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
