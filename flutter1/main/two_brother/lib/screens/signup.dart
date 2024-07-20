import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/constant/app_string.dart';
import 'package:two_brother/screens/login_from.dart';
import 'package:two_brother/screens/resetpassword.dart';
import 'package:two_brother/widget/appbar.dart';
import 'package:two_brother/widget/icon.dart';
import 'package:two_brother/widget/sizebox.dart';
import 'package:two_brother/widget/text_widget.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          leading: IconWidget(iconData: Icons.arrow_back),
          title: Padding(
            padding: const EdgeInsets.all(60.0),
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
                  SizedBoxWidget(
                    height: 10,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor
                          .inputcolor, // Set your desired background color here
                      hintText: AppString.Email,
                      border: InputBorder.none, // Remove border

                      contentPadding:
                          EdgeInsets.all(10), // Adjust padding as needed
                    ),
                  ),
                  SizedBoxWidget(
                    height: 10,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor
                          .inputcolor, // Set your desired background color here
                      hintText: AppString.password,
                      border: InputBorder.none, // Remove border
                      suffixIcon: Icon(Icons.remove_red_eye),
                      contentPadding:
                          EdgeInsets.all(10), // Adjust padding as needed
                    ),
                  ),
                  SizedBoxWidget(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Restpassword()));
                          },
                          child: TextWidget(data: AppString.forget))
                    ],
                  ),
                  SizedBoxWidget(
                    height: 10,
                  ),
                  SizedBoxWidget(
                    width: double.infinity, // <-- match_parent
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 35, 39, 42),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: TextWidget(
                        data: AppString.login,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBoxWidget(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextWidget(data: AppString.dontac, fontSize: 15),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginFrom()),
                              );
                            },
                            child: TextWidget(
                              data: AppString.signup,

                              color: AppColor.loginbutton,
                              fontSize: 15,

                              // decorationThickness: 2,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
