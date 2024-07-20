import 'package:allbutton/constant/app_color.dart';
import 'package:flutter/material.dart';


class CircularProgressIndicatorWidget extends StatefulWidget {
  const CircularProgressIndicatorWidget({super.key});

  @override
  State<CircularProgressIndicatorWidget> createState() =>
      _CircularProgressIndicatorWidgetState();
}

class _CircularProgressIndicatorWidgetState
    extends State<CircularProgressIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: AppColors.blackColor,
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.whiteColor,
        ),
      ),
    );
  }
}
