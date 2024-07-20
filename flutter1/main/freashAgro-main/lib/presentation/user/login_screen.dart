import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../constant/app_string.dart';
import '../../widgets/icon_widget.dart';
import '../../widgets/sizebox.dart';
import '../../widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const CustomAppBar(),
        actions: [
          IconWidget(
            iconData: Icons.search_rounded,
          ),
          SizedBoxWidget(
            width: 10.w,
          ),
          IconWidget(
            iconData: Icons.favorite_border,
          ),
          SizedBoxWidget(
            width: 10.w,
          ),
          IconWidget(
            iconData: Icons.shopping_cart_outlined,
          ),
          const SizedBoxWidget(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                data: AppString.twoText,
                fontWeight: FontWeight.w900,
                fontSize: 17.sp,
              ),
              TextWidget(
                data: AppString.brothersText,
                fontSize: 17.sp,
                fontWeight: FontWeight.w900,
              ),
              TextWidget(
                data: AppString.farmText,
                fontWeight: FontWeight.w600,
                fontSize: 7.sp,
                letterSpacing: 1,
              ),
              const SizedBoxWidget(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  context.push(Routes.loginfrom);
                },
                child: Container(
                  height: 45.h,
                  width: double.infinity,
                  color: AppColors.textGreyColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        IconWidget(
                          iconData: Icons.email_outlined,
                          color: AppColors.whiteColor,
                          size: 30,
                        ),
                         SizedBoxWidget(width: 10.w),
                        TextWidget(
                          data: AppString.emailText,
                          color: AppColors.whiteColor,
                          fontSize: 17.sp,
                          letterSpacing: 1,
                        ),
                         SizedBoxWidget(width: 68.w),
                        IconWidget(
                          iconData: Icons.keyboard_arrow_right_outlined,
                          color: AppColors.whiteColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBoxWidget(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextWidget(
                      data: "Shreyas",
                      color: AppColors.blackColor,
                      fontSize: 18.sp,
                      letterSpacing: 1,
                    ),
                    IconWidget(
                      iconData: Icons.keyboard_arrow_right_outlined,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
