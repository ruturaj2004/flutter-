import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DashedDivider extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  const DashedDivider({super.key, 
    this.color = AppColors.profileTextColor,
    this.strokeWidth = 1.0,
    this.dashWidth = 3.0,
    this.dashSpace = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = strokeWidth;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
