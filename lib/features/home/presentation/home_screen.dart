import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/utils/utilities.dart';
import 'package:portfolio/core/widgets/custom_app_bar.dart';
import 'package:portfolio/core/widgets/custom_rich_text.dart';
import 'package:portfolio/core/widgets/drawer.dart';
import 'package:portfolio/core/widgets/eleveted_button.dart';
import 'package:portfolio/core/widgets/footer.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:portfolio/features/home/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final deviceType = getDeviceType(screenWidth);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CustomAppBar(
          currentUrl: "/",
        ),
      ),
      drawer: deviceType != DeviceType.desktop
          ? Hero(
              tag: "app_bar",
              child: SideNavMenu(),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: deviceType == DeviceType.smartphone
                          ? screenWidth - 40
                          : (1 / 3) * screenWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello !"),
                        SizedBox(
                          height: 10,
                        ),
                        CustomRichText(
                          maxLines: 3,
                          textSpan: TextSpan(children: [
                            TextSpan(
                              text: "I'm ",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            TextSpan(
                              text: "Comlan Ulrich DJOSSOU",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: myTurquois,
                                  ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mobile / XR developer",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 0.2 * screenHeight,
                          ),
                          child: Text(
                            aboutMe,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () => context.go(
                              "/about_me",
                            ),
                            child: Text(
                              "... voir plus",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 150,
                          ),
                          child: CustomElevatedButton(
                            label: "Download CV",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (deviceType != DeviceType.smartphone)
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: (2 / 3) * screenWidth - 40,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: (1 / 12) * screenWidth,
                        ),
                        child: ClipOval(
                          child: imageAsset(
                            "assets/imgs/photos/uldjoss_01.jpg",
                            width: 0.3 * screenWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
