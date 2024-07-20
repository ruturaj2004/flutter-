import 'package:flutter/material.dart';

class AppSizes {
  static const double smallTextSize = 12.0;

  static double getTabletSize(BuildContext context, double size) {
    return size * (MediaQuery.of(context).size.width / 800);
  }

  static double getPhoneSize(BuildContext context, double size) {
    return size * (MediaQuery.of(context).size.width / 360);
  }

  static double getWebSize(BuildContext context, double size) {
    return size * (MediaQuery.of(context).size.width / 1920);
  }
}
