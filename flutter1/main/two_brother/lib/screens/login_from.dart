// ignore: unused_import

import 'package:flutter/material.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/constant/app_string.dart';
import 'package:two_brother/screens/login_screen.dart';
import 'package:two_brother/widget/appbar.dart';
import 'package:two_brother/widget/sizebox.dart';
import 'package:two_brother/widget/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFrom extends StatefulWidget {
  const LoginFrom({super.key});

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {
  bool isChecked = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back),
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                TextWidget(
                  data: AppString.hello,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              children: [
                TextWidget(
                  data: AppString.start,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
             SizedBoxWidget(
                  height: 30,
                ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.inputcolor, // Set your desired background color here
                    hintText:AppString.firstname,
                    border: InputBorder.none,
                        constraints: BoxConstraints.tightFor(
                          width: 160,
                          height: 40,
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.inputcolor, // Set your desired background color here
                    hintText: AppString.lastname,
                    border: InputBorder.none,
                        constraints: BoxConstraints.tightFor(
                          width: 160,
                          height: 40,
                        ),
                      ),
                    )
                  ],
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
                    fillColor: AppColor.inputcolor, // Set your desired background color here
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
                    fillColor: AppColor.inputcolor, // Set your desired background color here
                    hintText: AppString.password,
                    border: InputBorder.none, // Remove border
                    suffixIcon: Icon(Icons.remove_red_eye),
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
                    fillColor: AppColor.inputcolor, // Set your desired background color here
                    hintText: AppString.comfirm,
                    border: InputBorder.none, // Remove border
                    suffixIcon: Icon(Icons.remove_red_eye),
                    contentPadding:
                        EdgeInsets.all(10), // Adjust padding as needed
                  ),
                )
              ],
            ),
            SizedBoxWidget(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.blue; // or the color you want when selected
                    }
                    return const Color.fromARGB(255, 245, 241,
                        240); // or the color you want when not selected
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
                Column(
                  children: [
                    Text(AppString.check1, style: TextStyle(fontSize: 13))
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
                      return Colors.blue; // or the color you want when selected
                    }
                    return const Color.fromARGB(255, 245, 241,
                        240); // or the color you want when not selected
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
                Column(
                  children: [
                    Text(AppString.check2, style: TextStyle(fontSize: 13))
                  ],
                ),
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
                child: Text(
                 AppString.register,
                  style: TextStyle(fontSize: 20),
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
                    Text(AppString.ac, style: TextStyle(fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          AppString.loginnow,
                          style: TextStyle(
                            color:AppColor.loginbutton ,
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
    );
  }
}
