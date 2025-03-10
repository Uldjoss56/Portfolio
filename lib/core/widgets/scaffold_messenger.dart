import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/eleveted_button.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:flutter/material.dart';

class ShowInformation extends StatelessWidget {
  const ShowInformation({
    super.key,
    required this.imgPath,
    required this.information,
    this.detail,
    this.onTap,
  });
  final String imgPath;
  final String information;
  final String? detail;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CustomBlurContainer(
      child: Dialog(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        insetAnimationDuration: const Duration(
          seconds: 2,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 0.6 * height,
          child: Column(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 0.1 * height,
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          myWhite,
                          BlendMode.srcIn,
                        ),
                        child: imageAsset(
                          imgPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                information,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                detail ?? "",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                onPressed: onTap ??
                    () {
                      if (GoRouter.of(context).canPop()) {
                        context.pop();
                      }
                    },
                label: "Compris",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowInformation01 extends StatelessWidget {
  const ShowInformation01({
    super.key,
    required this.imgPath,
    required this.information,
    this.detail,
  });
  final String imgPath;
  final String information;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: myWhite,
      surfaceTintColor: myWhite,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      insetAnimationDuration: const Duration(
        seconds: 2,
      ),
      child: SizedBox(
        height: 0.6 * height,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: imageAsset(
                      "assets/img/background001.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    myWhite,
                                    BlendMode.srcIn,
                                  ),
                                  child: lottieAsset(
                                    imgPath,
                                    fit: BoxFit.cover,
                                    width: 0.5 * width,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  information,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: myBlackAA,
                                      ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  detail ?? "",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: myBlackAA,
                                      ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomElevatedButton(
                              isLoading: false,
                              onPressed: () {
                                if (GoRouter.of(context).canPop()) {
                                  context.pop();
                                }
                              },
                              label: "Compris",
                            ),
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
      ),
    );
  }
}

class ShowInformation02 extends StatelessWidget {
  const ShowInformation02({
    super.key,
    required this.imgPath,
    required this.information,
    this.detail,
    this.onTap,
  });
  final String imgPath;
  final String information;
  final String? detail;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CustomBlurContainer(
      child: Dialog(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        insetAnimationDuration: const Duration(
          seconds: 2,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 0.6 * height,
          child: Column(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 0.1 * height,
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          myWhite,
                          BlendMode.srcIn,
                        ),
                        child: lottieAsset(
                          imgPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                information,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                detail ?? "",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                onPressed: onTap ??
                    () {
                      if (GoRouter.of(context).canPop()) {
                        context.pop();
                      }
                    },
                label: "Compris",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

scaffoldMessengerAlert(BuildContext context, String text) {
  final theme = CustomAppTheme.instance;
  final themeMode = context.watch<ThemeCubit>().state;

  bool isDarkMode = theme.checkDarkMode(context, themeMode);

  final height = MediaQuery.of(context).size.height;
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              isDarkMode ? myWhite : myBlack,
              BlendMode.srcIn,
            ),
            child: lottieAsset(
              "assets/animations/alert.json",
              fit: BoxFit.contain,
              height: 0.05 * height,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

scaffoldMessengerInfo(BuildContext context, String text) {
  final height = MediaQuery.of(context).size.height;
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          lottieAsset(
            "assets/animations/validation.json",
            fit: BoxFit.contain,
            height: 0.05 * height,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
