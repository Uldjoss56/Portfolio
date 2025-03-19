import 'package:flutter/material.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/features/portfolio/presentation/portfolio_desktop.dart';
import 'package:portfolio/features/portfolio/presentation/portfolio_mobile.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: PortfolioDesktop(),
      tablet: PortfolioMobile(),
      mobile: PortfolioMobile(),
    );
  }
}
