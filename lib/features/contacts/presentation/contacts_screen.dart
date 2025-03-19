import 'package:flutter/material.dart';
import 'package:portfolio/core/res/responsive.dart';

import '../../contacts/presentation/contact_desktop.dart';
import '../../contacts/presentation/contact_mobile.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobileTab(),
      tablet: ContactMobileTab(),
      desktop: ContactDesktop(),
    );
  }
}
