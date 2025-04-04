part of 'home_screen.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    return SizedBox(
      height: 60.h,
      child: Stack(
        children: [
          Positioned(
            right: 10.w,
            bottom: 20.w,
            child: const EntranceFader(
              offset: Offset(0, 0),
              delay: Duration(seconds: 1),
              duration: Duration(milliseconds: 800),
              child: ZoomAnimations(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(
                  maxLines: 3,
                  textSpan: TextSpan(
                    children: [
                      TextSpan(
                        text: "🖐️ ",
                        style: TextStyle(
                          fontFamily: "Noto Color Emoji",
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: "Hello guys, welcome here !",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      TextSpan(
                        text: " 🖐️",
                        style: TextStyle(
                          fontFamily: "Noto Color Emoji",
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.w),
                Text(
                    "I'm  ",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: isDarkMode ? myWhite : myBlackAA,
                        ),
                  ),
                  CustomRichText(
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    textSpan: TextSpan(
                      children: [
                        TextSpan(
                          text: "Comlan Ulrich",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: myTurquois,
                              ),
                        ),
                        TextSpan(
                          text: "\nDJOSSOU",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                color: myTurquois,
                              ),
                        ),
                      ],
                    ),
                  ),
                   DefaultTextStyle(style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: myOrange01,
                        ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Mobile Developer'),
                      TypewriterAnimatedText('XR developer'),
                      TypewriterAnimatedText('UI/UX Designer'),
                    ],
                    repeatForever: true,
                  ),
                ),
                SizedBox(
                  height: 1.5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50.w),
                  child: Text(
                    shortAboutMe,
                  ),
                ),
                SizedBox(
                  height: 2.w,
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
        ],
      ),
    );
  }
}
