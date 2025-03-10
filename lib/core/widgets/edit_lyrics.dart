import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/eleveted_button.dart';
import 'package:portfolio/core/widgets/form.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:flutter/material.dart';

class EditLyrics extends StatefulWidget {
  const EditLyrics({super.key});
  @override
  State<StatefulWidget> createState() => _EditLyricsState();
}

class _EditLyricsState extends State<EditLyrics> {
  final _contentController = TextEditingController();

  final _partionTitleController = TextEditingController();

  int _numberOfPart = 1;

  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
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
                            "assets/imgs/icons/trier.png",
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Edition des lyrics de la musique en pdf",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      Icons.keyboard_double_arrow_down_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 200,
                color: myWhite,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(_numberOfPart, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CustomBlurContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Titre",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.remove_rounded),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomTextFormField(
                                        controller: _partionTitleController,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              isDarkMode ? myWhite : myBlackAA,
                                              BlendMode.srcIn,
                                            ),
                                            child: imageAsset(
                                              "assets/imgs/icons/product_name.png",
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                        ),
                                        hintText: "titre de la partie",
                                        keyboardType: TextInputType.name,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Contenu",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomTextFormField(
                                        controller: _contentController,
                                        hintText: "le contenu de cette partie",
                                        maxLines: 5,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Card(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _numberOfPart++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomElevatedButton(
                onPressed: () => context.pop(),
                label: "Sauvegarde du document",
              ),
            ],
          ),
        );
      },
    );
  }
}
