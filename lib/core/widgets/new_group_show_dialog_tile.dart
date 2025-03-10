import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/eleveted_button.dart';
import 'package:portfolio/core/widgets/form.dart';
import 'package:portfolio/core/widgets/img_wid.dart';

class NewGroupShowDialogTile extends StatefulWidget {
  const NewGroupShowDialogTile({
    super.key,
  });

  @override
  State<NewGroupShowDialogTile> createState() => _NewGroupShowDialogTileState();
}

class _NewGroupShowDialogTileState extends State<NewGroupShowDialogTile> {
  final _groupIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);
    return SizedBox(
      height: 400,
      child: CustomBlurContainer(
        child: AlertDialog(
          title: const Text(
            "Rejoinez un nouveau groupe",
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _groupIdController,
                  labelText: "Identifiant du groupe",
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
                  hintText: "ex: 12-AUI-45k",
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  label: "Rejoindre",
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () => context.pop(),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Quitter",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
