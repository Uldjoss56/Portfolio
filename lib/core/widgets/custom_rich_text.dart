import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.textSpan,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });
  final TextSpan textSpan;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: textSpan.children,
      ),
      textAlign: textAlign??TextAlign.start,
    );
  }
}
