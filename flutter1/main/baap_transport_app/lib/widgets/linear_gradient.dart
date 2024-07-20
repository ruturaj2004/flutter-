import 'package:flutter/material.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';

class LinearGradientWidget extends StatelessWidget {
  final Widget? child;

  const LinearGradientWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.backgroundLinearColor,
            AppColors.backgroundLinear,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
