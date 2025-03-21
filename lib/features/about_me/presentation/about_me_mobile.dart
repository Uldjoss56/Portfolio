part of 'about_me_screen.dart';

class AboutMeMobile extends StatefulWidget {
  const AboutMeMobile({super.key});

  @override
  State<AboutMeMobile> createState() => _AboutMeMobileState();
}

class _AboutMeMobileState extends State<AboutMeMobile> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        bottom: 10.h,
        right: 10.w,
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
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Experience",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(),
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
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Academy",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(),
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
            ],
          ),
        ],
      ),
    );
  }
}
