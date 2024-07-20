import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_image.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/text_widget.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.push(Routes.loginScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 25,
      ),
      child: Column(
        children: [
          _imageWidget(),
          _lottieWidget(),
        ],
      ),
    )));
  }

  _imageWidget() {
    return Column(children: [
      Image.asset(
        AppImages.splashlogo,
      ),
      SizedBoxWidget(
        height: 30,
      ),
    ]);
  }

  _lottieWidget() {
    return Column(children: [
      TextWidget(
        data: AppString.lawyerText,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: const Color.fromARGB(255, 188, 183, 183),
      ),
      Lottie.asset(
        'assets/animation/lawyer.json',
      ),
    ]);
  }
}
