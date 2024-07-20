import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salesman_app/constant/app_color.dart';

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
      height: 20.h,
      width: 20.w,
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
