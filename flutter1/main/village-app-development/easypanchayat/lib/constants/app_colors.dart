import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundDark = Color(0xff3E404D);
  static const Color textGrey = Color(0xffD1D1D1);
  static const Color borderColor = Color(0xff6B6B6B);
  static const Color blueTextColor = Color(0xff0E9FC1);
  static const Color redTextColor = Color(0xffF75D2F);
  static const Color greyDarkColor = Color(0xff717070);
  static const Color pinkColor = Color(0xffE546BA);
  static const Color yellowColor = Color(0xffFFC400);
  static const Color lightBlueColor = Color(0xff1ABDE3);
  static const Color buttonColor = Color(0xffBCBCBC);
  static const Color lightGreyColor = Color(0xffE0E0E0);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color iconColor = Color(0xff0FBECE);
  static const Color profileBackgroundColor = Color(0xffF2F3F7);
  static const Color textColor = Color(0xff717070);
  static const Color profileTextColor = Color(0xff535353);
  static const Color profileTextBlueColor = Color(0xff009EAD);
  static const Color saveButtonColor = Color(0xff3E404D);
  static const Color backgroundGreyColor = Color(0xffF7F7F7);
  static const Color containerGreyColor = Color(0xffE3E3E3);
  static const Color buttonGreyColor = Color(0xffE1E1E1);

  static const Color backgroundGreyDark = Color.fromRGBO(72, 72, 72, 1);
  static const Color greyCold = Color(0xff707070);
  static const Color itemBackground = Color(0xffDBDAE0);
  static const Color textformFieldColor = Color(0xffA7A7A7);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: backgroundDark,
    cardColor: whiteColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
