import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/constants/appimages.dart';
import 'package:trip_app/widgets/buttonWidget.dart';
import 'package:trip_app/widgets/sizedBoxWidget.dart';
import 'package:trip_app/widgets/textWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginBaapApp extends StatefulWidget {
  const LoginBaapApp({super.key});

  @override
  State<LoginBaapApp> createState() => _LoginBaapAppState();
}

class _LoginBaapAppState extends State<LoginBaapApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 100.sp,
                color: const Color.fromARGB(255, 212, 22, 8),
              ),
              SizedBoxWidget(
                height: 16.h,
              ),
              TextWidget(
                context: context,
                data: "You are not logged in to Baap App",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBoxWidget(
                height: 20.h,
              ),
              TextWidget(
                context: context,
                data: "Login to Baap App",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBoxWidget(
                height: 15.h,
              ),
              Image.asset(
                AppImages.baapAppImage,
                height: 50.h,
                width: 50.w,
              ),
              SizedBoxWidget(
                height: 10.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size(100.w, 40.h)),
                  onPressed: () {
                    String url =
                        "https://play.google.com/store/apps/details?id=com.baapcompany.baapapp";
                    if (url.isNotEmpty) {
                      launchUrl(Uri.parse(url));
                    }
                  },
                  child: TextWidget(
                    context: context,
                    data: "Open",
                    color: Colors.white,
                    fontSize: 15.sp,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
