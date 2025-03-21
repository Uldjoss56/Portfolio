import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/animations/entrance_fader.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/cubit/scroll/scroll_cubit.dart';

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
    final selectedIndex = context.watch<SelectedIndexCubit>().state;
    final isSelected = selectedIndex == widget.index;
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        decoration: BoxDecoration(
          gradient: isHover ? orangeTurquois : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (value) {
            setState(() => isHover = value);
          },
          onTap: () {
            context.read<SelectedIndexCubit>().selectIndex(
                  widget.index,
                );
            scrollController.jumpTo(
              index: widget.index,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxWidth: 70,
              minWidth: 70,
            ),
            child: Text(
              widget.label,
              maxLines: 1,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: isSelected
                        ? 15
                        : isHover
                            ? 14
                            : 12,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
