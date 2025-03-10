import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/custom_app_bar.dart';
import 'package:portfolio/core/widgets/drawer.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CustomAppBar(
          currentUrl: "/contacts",
        ),
      ),
      drawer: Hero(
        tag: "app_bar",
        child: SideNavMenu(),
      ),
    );
  }
}
