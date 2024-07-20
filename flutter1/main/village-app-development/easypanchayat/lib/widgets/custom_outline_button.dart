import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart'; // Make sure to import the necessary packages

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomOutlinedButton({super.key, 
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 50.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.only(top: 3),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: AppColors.buttonColor,
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
