import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/res/responsive.dart';
import 'package:portfolio/core/utils/constant.dart';
import 'package:sizer/sizer.dart';

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const ProjectCard({
    super.key,
    required this.project,
  });
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    final project = widget.project;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => openURL(
        project["links"],
      ),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        width: Responsive.isDesktop(context) ? 30.w : 70.w,
        height: 36.h,
        decoration: BoxDecoration(
          gradient: isHover ? orangeTurquois : grayBack,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: isHover ? const EdgeInsets.all(20) : EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    project["icons"],
                    height: height * 0.05,
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                   project["titles"],
                   
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    project["description"],
                    textAlign: TextAlign.center,
                   ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.1 : 1.0,
              child: Container(
                width: Responsive.isDesktop(context) ? 30.w : 70.w,
                height: 36.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                     project["banners"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
