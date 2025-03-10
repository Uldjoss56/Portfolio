import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';

class InfosTile extends StatelessWidget {
  const InfosTile({
    super.key,
    this.date,
    this.title,
    this.otherInfos,
  });

  final String? date;
  final String? title;
  final String? otherInfos;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomBlurContainer(
            paddingValue: 20,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date ?? "",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: myTurquois,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title ?? "",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  otherInfos ?? "",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
