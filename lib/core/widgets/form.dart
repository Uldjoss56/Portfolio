import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.hintTextStyle,
    this.decoration,
    this.maxLines,
    this.onChange,
    this.validator,
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final int? maxLines;
  final Function(String value)? onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return Container(
      decoration: BoxDecoration(
        color: !isDarkMode ? myBlack22 : myGrey22,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: textStyle,
        maxLines: maxLines,
        onChanged: onChange,
        validator: validator,
        decoration: decoration ??
            InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintStyle:
                  hintTextStyle ?? Theme.of(context).textTheme.labelMedium,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              errorBorder: InputBorder.none,
            ),
      ),
    );
  }
}

class CustomPasswordTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Function(String value)? onChange;
  final String? Function(String?)? validator;

  const CustomPasswordTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.textStyle,
    this.hintTextStyle,
    this.decoration,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChange,
    this.validator,
  });

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(context) {
    final theme = CustomAppTheme.instance;
    final themeMode = context.watch<ThemeCubit>().state;

    bool isDarkMode = theme.checkDarkMode(context, themeMode);

    return Container(
      decoration: BoxDecoration(
        color: !isDarkMode ? myBlack22 : myGrey22,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _obscureText,
        style: widget.textStyle,
        onChanged: widget.onChange,
        decoration: widget.decoration ??
            InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              hintStyle: widget.hintTextStyle ??
                  Theme.of(context).textTheme.labelMedium,
              prefixIcon: widget.prefixIcon,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: _toggleVisibility,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              errorBorder: InputBorder.none,
            ),
      ),
    );
  }
}
