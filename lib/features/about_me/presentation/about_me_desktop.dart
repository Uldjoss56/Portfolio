part of 'about_me_screen.dart';

class AboutMeDesktop extends StatefulWidget {
  const AboutMeDesktop({super.key});

  @override
  State<AboutMeDesktop> createState() => _AboutMeDesktopState();
}

class _AboutMeDesktopState extends State<AboutMeDesktop> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 8,
      ).copyWith(
        bottom: screenHeight * 0.2,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About me",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: isDarkMode ? myWhite : myBlackAA,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                aboutMe,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
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
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: List.generate(
                          workExperienceData.length,
                          (index) {
                            final data = workExperienceData[index];
                            return CustomContainerWithLine(
                              widgetToAdd: Column(
                                children: [
                                  InfosTile(
                                    date: data["period"],
                                    title: data["title"],
                                    otherInfos: data["enterprise"],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: List.generate(
                          schoolExperienceData.length,
                          (index) {
                            final data = schoolExperienceData[index];
                            return CustomContainerWithLine(
                              widgetToAdd: Column(
                                children: [
                                  InfosTile(
                                    date: data["period"],
                                    title: data["title"],
                                    otherInfos: data["enterprise"],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
