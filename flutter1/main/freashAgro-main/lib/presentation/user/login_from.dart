// ignore: unused_import
import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/utils/routes/routes.dart';
import 'package:baap_organic_app/widgets/icon_widget.dart';
import 'package:baap_organic_app/widgets/text_form_field.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../constant/app_string.dart';
import '../../widgets/sizebox.dart';

class LoginFrom extends StatefulWidget {
  const LoginFrom({super.key});

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {
  bool isChecked = false;
  bool isChecked2 = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _comfirmController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _iscomfirmVisible = false;
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    TextWidget(
                      data: AppString.helloText,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        CustomTextFormFieldWidget(
                          hintText: AppString.firstNameText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter a valid Name";
                            }
                            return null;
                          },
                          height: 38.h,
                          width: 140.w,
                        ),
                        SizedBoxWidget(
                          width: 25.w,
                        ),
                        CustomTextFormFieldWidget(
                          hintText: AppString.lastNameText,
                          height: 38.h,
                          width: 150.w,
                        ),
                      ],
                    ),
                    SizedBoxWidget(
                      height: 20.h,
                    ),
                    const CustomTextFormFieldWidget(hintText: AppString.emailText),
                    SizedBoxWidget(
                      height: 20.h,
                    ),
                    CustomTextFormFieldWidget(
                      hintText: AppString.passwordText,
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    SizedBoxWidget(
                      height: 20.h,
                    ),
                    CustomTextFormFieldWidget(
                      hintText: AppString.confirmpasswordText,
                      controller: _comfirmController,
                      obscureText: !_iscomfirmVisible,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _iscomfirmVisible = !_iscomfirmVisible;
                          });
                        },
                        child: Icon(
                          _iscomfirmVisible
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        return const Color.fromARGB(255, 245, 241, 240);
                      }),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isChecked = value!;
                          },
                        );
                      },
                    ),
                    const Column(
                      children: [
                        Text(AppString.checkText, style: TextStyle(fontSize: 13))
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        return const Color.fromARGB(255, 245, 241, 240);
                      }),
                      value: isChecked2,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isChecked2 = value!;
                          },
                        );
                      },
                    ),
                    const Column(
                      children: [
                        Text(AppString.chechAgreeText, style: TextStyle(fontSize: 13))
                      ],
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Color.fromARGB(248, 3, 0, 0),
                  ),
                  child: const Center(
                      child: TextWidget(
                    data: AppString.registerText,
                    fontSize: 20,
                    color: AppColors.whiteColor,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Text(AppString.accountText, style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              context.push(Routes.loginscreen);
                            },
                            child: const Text(
                              AppString.loginnow,
                              style: TextStyle(
                                color: AppColors.loginbuttoncolor,
                                fontSize: 15,
                                decorationThickness: 2,
                              ),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
