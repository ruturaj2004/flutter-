    import 'package:flutter/material.dart';

    class SizedBoxWidget extends StatelessWidget {
      final double? width;
      final double? height;
      final Widget? child;

      const SizedBoxWidget({super.key, this.width, this.height, this.child});

      @override
      Widget build(BuildContext context) {
        return SizedBox(
          width: width,
          height: height,
          child: child,
        );
      }
    }
