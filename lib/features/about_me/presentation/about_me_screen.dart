import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/utilities.dart';
import 'package:portfolio/core/widgets/custom_app_bar.dart';
import 'package:portfolio/core/widgets/drawer.dart';
import 'package:portfolio/core/widgets/footer.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/core/widgets/infos_tile.dart';
import 'package:portfolio/features/home/data/data.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final deviceType = getDeviceType(screenWidth);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CustomAppBar(
          currentUrl: "/about_me",
        ),
      ),
      drawer: Hero(
        tag: "app_bar",
        child: SideNavMenu(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About me",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      deviceType == DeviceType.smartphone
                          ? Expanded(
                              child: Text(
                                aboutMe,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(),
                              ),
                            )
                          : Container(
                              constraints: BoxConstraints(
                                maxWidth: (1 / 3) * screenWidth,
                              ),
                              child: Text(
                                aboutMe,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(),
                              ),
                            ),
                      SizedBox(
                        width: 20,
                      ),
                      if (deviceType != DeviceType.smartphone)
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: (2 / 3) * screenWidth - 60,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipOval(
                                      child: imageAsset(
                                        "assets/imgs/vectors/mobile_app.jpg",
                                        width: 0.2 * screenWidth,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipOval(
                                      child: imageAsset(
                                        "assets/imgs/vectors/xr_app.jpg",
                                        width: 0.1 * screenWidth,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              deviceType != DeviceType.smartphone
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "My Experience",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InfosTile(
                                  date: "May, 2024 - Sep, 2024",
                                  title: "Intern on Mobile Dev & 3D Artist",
                                  otherInfos: "Andounia Africa Lab",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InfosTile(
                                  date: "Sep, 2023 - Dec, 2023",
                                  title: "Mobile Dev",
                                  otherInfos: "Fun High Tech",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InfosTile(
                                  date: "Sep, 2023 - Dec, 2023",
                                  title: "Intern on UI Designer & Mobile Dev",
                                  otherInfos: "LESCAL",
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "My Academy",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InfosTile(
                                  date: "Oct, 2021 - Dec, 2024",
                                  title: "Bachelor of Internet and Multimedia",
                                  otherInfos:
                                      "IFRI at University of Abomey-Calavi,"
                                      " Benin Republic",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InfosTile(
                                  date: "Jul, 2021",
                                  title: "High School Diploma (Baccalauréat C)",
                                  otherInfos: "CEG 1 Savalou, Benin Republic",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Experience",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InfosTile(
                              date: "May, 2024 - Sep, 2024",
                              title: "Intern on Mobile Dev & 3D Artist",
                              otherInfos: "Andounia Africa Lab",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InfosTile(
                              date: "Sep, 2023 - Dec, 2023",
                              title: "Mobile Dev",
                              otherInfos: "Fun High Tech",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InfosTile(
                              date: "Sep, 2023 - Dec, 2023",
                              title: "Intern on UI Designer & Mobile Dev",
                              otherInfos: "LESCAL",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Academy",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InfosTile(
                              date: "Oct, 2021 - Dec, 2024",
                              title: "Bachelor of Internet and Multimedia",
                              otherInfos: "IFRI at University of Abomey-Calavi,"
                                  " Benin Republic",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InfosTile(
                              date: "Jul, 2021",
                              title: "High School Diploma (Baccalauréat C)",
                              otherInfos: "CEG 1 Savalou, Benin Republic",
                            ),
                          ],
                        ),
                      ],
                    ),
              SizedBox(
                height: 40,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
