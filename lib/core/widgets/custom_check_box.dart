import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.cannotChange,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final bool? cannotChange;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  void didUpdateWidget(covariant CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Mise à jour de l'état interne si la valeur passée change
    if (widget.value != oldWidget.value) {
      setState(() {
        // Synchroniser _isChecked avec widget.value
        _isChecked = widget.value;
      });
    }
  }

  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value; // Initialiser avec la valeur passée
  }

  @override
  Widget build(BuildContext context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return InkWell(
      onTap: widget.cannotChange ?? true
          ? () {
              setState(() {
                _isChecked = !_isChecked;
                widget.onChanged(
                  _isChecked,
                ); // Appeler le callback avec la nouvelle valeur
              });
            }
          : null,
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                _isChecked ? myTurquois : (isDarkMode ? myGreyAA : myBlack55),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: _isChecked
            ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: myTurquois,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
