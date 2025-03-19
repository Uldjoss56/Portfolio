import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.w,
        ),
        CustomSectionHeading(text: contactHeadding),
        SizedBox(
          height: 3.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: contactSubHeadding),
        ),
        SizedBox(
          height: 5.w,
        ),
        InkWell(
          onTap: () => openURL(whatsapp),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
                gradient: buttonGradi, borderRadius: BorderRadius.circular(10)),
            child: const Text(
              'Get Started',
            ),
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 50,
            children: contactUtils
                .asMap()
                .entries
                .map((e) => IconButton(
                      icon: Image.network(
                        e.value.icon,
                        // color: theme.textColor,
                      ),
                      onPressed: () => openURL(e.value.url),
                      highlightColor: Colors.white54,
                      iconSize: 21,
                    ))
                .toList()),
        SizedBox(
          height: 5.w,
        ),
        Container(
          color: myWhite.withValues(
            alpha: 0.2,
          ),
          height: 1,
        ),
      ],
    );
  }
}
