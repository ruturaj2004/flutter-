import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/widgets/textWidget.dart';

class SnackBarWidget {
  static void showSnackbar(BuildContext context, String errorMessage,
      {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color ?? Colors.green,
        content: TextWidget(
          context: context,
          data: errorMessage,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
