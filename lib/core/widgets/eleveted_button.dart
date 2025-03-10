import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.label,
    this.isLoading,
  });

  final Function()? onPressed;
  final String? label;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (isLoading != null && isLoading == true)
                    ? ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          myWhite,
                          BlendMode.srcIn,
                        ),
                        child: lottieAsset(
                          "assets/animations/loading.json",
                          fit: BoxFit.cover,
                          width: 20,
                        ),
                      )
                    : Text(
                        label ?? "",
                        
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
