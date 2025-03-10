import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogWid extends StatefulWidget {
  const CustomAlertDialogWid({
    super.key,
    required this.content,
    required this.onTapAction,
    required this.title,
    required this.action,
  });
  final String title;
  final String content;
  final String action;
  final Function() onTapAction;
  @override
  State<StatefulWidget> createState() => _CustomAlertDialogWidState();
}

class _CustomAlertDialogWidState extends State<CustomAlertDialogWid> {
  @override
  Widget build(BuildContext context) {
    return CustomBlurContainer(
      child: AlertDialog(
        title: Text(
          widget.title,
        ),
        content: Text(
          widget.content,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (GoRouter.of(context).canPop()) {
                context.pop();
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: myTurquois,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Annuler",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: myBlack,
                  ),
            ),
          ),
          TextButton(
            onPressed: widget.onTapAction,
            child: Text(
              widget.action,
            ),
          ),
        ],
      ),
    );
  }
}
