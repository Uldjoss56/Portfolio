part of 'services_screen.dart';

class ServicesDesktop extends StatefulWidget {
  const ServicesDesktop({super.key});

  @override
  State<ServicesDesktop> createState() => _ServicesDesktopState();
}

class _ServicesDesktopState extends State<ServicesDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width / 8).copyWith(
        bottom: height * 0.2,
      ),
      child: Column(
        children: [
          Text(
            "What can I do ?",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: isDarkMode ? myWhite : myBlackAA,
                ),
          ),
          SizedBox(
            height: 1.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              myServices,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(),
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Wrap(
            spacing: width * 0.03,
            runSpacing: height * 0.05,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: servicesData.map((element) {
              return _ServiceCard(
                serviceData: element,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
