import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/animations/entrance_fader.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/cubit/scroll/scroll_cubit.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class NavBarActionButton extends StatefulWidget {
  const NavBarActionButton({
    super.key,
    required this.label,
    required this.index,
  });

  final String label;
  final int index;

  @override
  State<NavBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavBarActionButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollCubit>().state;

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return EntranceFader(
          offset: const Offset(0, -10),
          delay: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds: 250),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              gradient: isHover ? orangeTurquois : null,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: InkWell(
              onHover: (value) {
                setState(() => isHover = value);
              },
              onTap: () {
                scrollController.jumpTo(
                  index: widget.index,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  widget.label,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
