import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/features/services/data/data.dart';
import 'package:sizer/sizer.dart';

part 'services_desktop.dart';
part 'services_mobile.dart';
part 'widgets/_services_card.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: ServicesDesktop(),
      tablet: ServicesMobile(),
      mobile: ServicesMobile(),
    );
  }
}
