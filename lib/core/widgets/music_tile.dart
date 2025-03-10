import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/img_wid.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    super.key,
    required this.isDarkMode,
    required this.index,
  });

  final bool isDarkMode;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The logic will be set by type of sort chosen
        if (index == 0 || index == 4 || index == 6)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "A",
              ),
            ),
          ),
        Row(
          children: [
            imageAsset(
              "assets/imgs/icons/cd.png",
              width: 50,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () => context.push("/music_screen"),
                radius: 20,
                borderRadius: BorderRadius.circular(20),
                child: CustomBlurContainer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Le saint esprit",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "04:30",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: isDarkMode ? myWhite55 : myBlack55,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "Solflege (pdf)",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "ajouté par Jean56",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CategoryTitleInLibrary extends StatelessWidget {
  const CategoryTitleInLibrary({
    super.key,
    required this.isDarkMode,
    required this.categoryTitle,
  });

  final bool isDarkMode;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.keyboard_arrow_down_rounded,
        ),
        Text(
          categoryTitle,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 2,
            color: isDarkMode ? myWhite : myBlack,
          ),
        )
      ],
    );
  }
}
