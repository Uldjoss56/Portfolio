import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/animations/entrance_fader.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/cubit/scroll/scroll_cubit.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:sizer/sizer.dart';

class ArrowOnTop extends StatefulWidget {
  const ArrowOnTop({
    super.key,
  });

  @override
  ArrowOnTopState createState() => ArrowOnTopState();
}

class ArrowOnTopState extends State<ArrowOnTop> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollCubit>().state;

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeIndex) {
        return Positioned(
          bottom: 100,
          right: -7,
          child: EntranceFader(
            offset: const Offset(0, 20),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.025,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => scrollController.jumpTo(
                      index: 0,
                    ),
                    onHover: (isHovering) {
                      if (isHovering) {
                        setState(() => isHover = true);
                      } else {
                        setState(() => isHover = false);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: !isHover ? buttonGradi : orangeTurquois,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                        boxShadow: isHover
                            ? [
                                const BoxShadow(
                                  blurRadius: 12.0,
                                  offset: Offset(2.0, 3.0),
                                )
                              ]
                            : null,
                      ),
                      child: Icon(
                        Icons.arrow_drop_up_outlined,
                        color: myWhite,
                        size: 5.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
