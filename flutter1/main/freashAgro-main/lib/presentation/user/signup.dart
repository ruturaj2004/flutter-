import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/constant/app_string.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/presentation/user/resetpassword.dart';
import 'package:baap_organic_app/widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/text_widget.dart';
import 'login_from.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const CustomAppBar(),),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
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
                  const SizedBoxWidget(
                    height: 10,
                  ),
                  const TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.inputColor, 
                      hintText: AppString.emailText,
                      border: InputBorder.none, 

                      contentPadding:
                          EdgeInsets.all(10), 
                    ),
                  ),
                  const SizedBoxWidget(
                    height: 10,
                  ),
                  const TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.inputColor, 
                      hintText: AppString.passwordText,
                      border: InputBorder.none, 
                      suffixIcon: Icon(Icons.remove_red_eye),
                      contentPadding:
                          EdgeInsets.all(10), 
                    ),
                  ),
                  const SizedBoxWidget(
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
                                    builder: (context) => const Restpassword()));
                          },
                          child: const TextWidget(data: AppString.forgetText))
                    ],
                  ),
                  const SizedBoxWidget(
                    height: 10,
                  ),
                  SizedBoxWidget(
                    width: double.infinity, 
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 35, 39, 42),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const TextWidget(
                        data: AppString.loginText,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBoxWidget(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          TextWidget(data: AppString.donthaveanaccountText, fontSize: 15),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginFrom()),
                              );
                            },
                            child: const TextWidget(
                              data: AppString.signupText,

                              color: AppColors.loginbuttoncolor,
                              fontSize: 15,

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
