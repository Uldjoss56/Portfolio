import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/eleveted_button.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  @override
  State<StatefulWidget> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isRecomd = true;
  RangeValues _rangePriceValues = const RangeValues(0, 1000);
  RangeValues _rangeStarValues = const RangeValues(3, 4);

  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.8,
      maxChildSize: 1,
      expand: true,
      builder: (context, scrollController) {
        return CustomBlurContainer(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            !isDarkMode ? myBlack : myWhite,
                            BlendMode.srcIn,
                          ),
                          child: imageAsset(
                            "assets/img/icons/trier.png",
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Filtre",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (GoRouter.of(context).canPop()) {
                        context.pop();
                      }
                    },
                    icon: const Icon(
                      Icons.keyboard_double_arrow_down_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Trier par",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isRecomd = !_isRecomd;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: _isRecomd ? myGrey55 : null,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: myGrey,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Recommandation",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              imageAsset(
                                "assets/img/icons/award.png",
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isRecomd = !_isRecomd;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                              color: !_isRecomd ? myGrey55 : null,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: myGrey55,
                              )),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Plus populaire",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              imageAsset(
                                "assets/img/icons/fire.png",
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Prix (KOE)",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      RangeSlider(
                        labels: RangeLabels(
                          '${_rangePriceValues.start.toInt()}',
                          '${_rangePriceValues.end.toInt()}',
                        ),
                        activeColor: isDarkMode ? myWhite : myBlack,
                        inactiveColor: isDarkMode ? myBlueBackground : myWhite,
                        divisions: 10000,
                        min: 0,
                        max: 10000,
                        values: _rangePriceValues,
                        onChanged: (value) {
                          setState(() {
                            _rangePriceValues = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Etoiles",
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      RangeSlider(
                        labels: RangeLabels(
                          '${_rangeStarValues.start.toInt()}',
                          '${_rangeStarValues.end.toInt()}',
                        ),
                        activeColor: isDarkMode ? myWhite : myBlack,
                        inactiveColor: isDarkMode ? myBlueBackground : myWhite,
                        divisions: 5,
                        min: 1,
                        max: 5,
                        values: _rangeStarValues,
                        onChanged: (value) {
                          setState(() {
                            _rangeStarValues = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        onPressed: () {},
                        label: "Appliquer le ",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
