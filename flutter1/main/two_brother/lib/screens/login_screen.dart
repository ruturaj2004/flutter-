import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/constant/app_string.dart';
// import 'package:two_brother/screens/login_from.dart';
import 'package:two_brother/screens/signup.dart';
import 'package:two_brother/widget/appbar.dart';
import 'package:two_brother/widget/icon.dart';
import 'package:two_brother/widget/sizebox.dart';
import 'package:two_brother/widget/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(
        title: Center(
          child: Column(
            children: [
              TextWidget(
                data: AppString.two,
                color: AppColor.success,
                fontWeight: FontWeight.w800,
                fontSize: 17.sp,
              ),
              TextWidget(
                data: AppString.brothers,
                color: AppColor.success,
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
              ),
              TextWidget(
                data: AppString.farm,
                fontWeight: FontWeight.bold,
                color: AppColor.success,
                fontSize: 6.sp,
                letterSpacing: 1,
              ),
            ],
          ),
        ),
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
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                data: AppString.two,
                fontWeight: FontWeight.w900,
                fontSize: 17.sp,
              ),
              TextWidget(
                data: AppString.brothers,
                fontSize: 17.sp,
                fontWeight: FontWeight.w900,
              ),
              TextWidget(
                data: AppString.farm,
                fontWeight: FontWeight.w600,
                fontSize: 7.sp,
                letterSpacing: 1,
              ),
              SizedBoxWidget(
                height: 10,
              ),
              // SizedBoxWidget(
              //   width: double.infinity,
              //   height: 43,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         primary: AppColor.gray,
              //         onPrimary: Colors.black,
              //         shape: LinearBorder()),
              //     onPressed: () {
              //       Navigator.of(context)
              //           .push(MaterialPageRoute(builder: (context) => LoginFrom()));
              //     },
              //     child: Row(

              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: const [
              //         Image(
              //           image: AssetImage("assets/images/email.png"),
              //           height: 28.0,
              //           width: 30,
              //           color: AppColor.white,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(left: 10, right: 50),
              //           child: Text(
              //             AppString.email,
              //             style: TextStyle(
              //               fontSize: 16,
              //               color: AppColor.white,
              //               fontWeight: FontWeight.w400,
              //             ),
              //           ),
              //         ),
              //         Icon(
              //           Icons.keyboard_arrow_right_outlined,
              //           color: AppColor.white,
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                height: 60,
                width: double.infinity,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.email_outlined),
                    Text("Email gfueuue"),
                    Icon(Icons.keyboard_arrow_right_outlined)
                  ],
                ),
              ),
              SizedBoxWidget(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: LinearBorder()),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 90),
                          child: Text(
                            AppString.email,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
