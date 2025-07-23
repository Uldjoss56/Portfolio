part of 'services_screen.dart';

class ServicesMobile extends StatefulWidget {
  const ServicesMobile({super.key});

  @override
  State<ServicesMobile> createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesMobile> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return Column(
      children: [
        Text(
          "\nWhat can I do ?",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: isDarkMode ? myWhite : myBlackAA,
              ),
        ),
        SizedBox(
          height: 20,
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
          height: 20,
        ),
        CarouselSlider.builder(
          itemCount: servicesData.length,
          itemBuilder: (context, itemIndex, i) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0.5.w,
            ),
            child: _ServiceCard(
              serviceData: servicesData[i],
            ),
          ),
          options: CarouselOptions(
            viewportFraction: 0.6,
            height: 300,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        )
      ],
    );
  }
}
