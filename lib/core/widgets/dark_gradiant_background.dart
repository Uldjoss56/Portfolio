import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class DarkGradiantBackground extends StatelessWidget {
  const DarkGradiantBackground({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            myTurquois0155,
            myTurquois0255,
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
