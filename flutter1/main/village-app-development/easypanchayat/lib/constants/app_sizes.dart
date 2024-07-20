// import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  // text sizes
  static double light10pxTextSize = 10.0.sp;
  static double small12pxTextSize = 12.0.sp;
  static double medium14pxTextSize = 14.0.sp;
  static double large16pxTextSize = 16.0.sp;
  static double heavy18pxTextSize = 18.0.sp;
  static double const20pxTextSize = 20.0.sp;
  static double const21pxTextSize = 21.0.sp;

  // screen padding for phone
  static double horizontalScreen25pxPaddingPhone = 25.0.w;
  static double horizontalScreen20pxPaddingPhone = 20.0.w;
  static double horizontalScreen12pxPaddingPhone = 12.0.w;
  static double horizontalScreen8pxPaddingPhone = 8.0.w;

  static double verticalScreen20pxPaddingPhone = 20.0.h;
  static double verticalScreen12pxPaddingPhone = 12.0.h;
  static double verticalScreen8pxPaddingPhone = 8.0.h;
  static double verticalScreen5pxPaddingPhone = 5.0.h;

  static double content8pxHeight = 8.0.h;
  static double content12pxHeight = 12.0.h;

  static double setHeight(double value) {
    return value.sh;
  }

  static double setWidth(double value) {
    return value.sw;
  }

  static double height(double value) {
    return value.h;
  }

  static double width(double value) {
    return value.w;
  }
}
