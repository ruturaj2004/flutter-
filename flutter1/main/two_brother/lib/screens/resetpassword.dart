import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/constant/app_string.dart';
import 'package:two_brother/widget/appbar.dart';
import 'package:two_brother/widget/sizebox.dart';
import 'package:two_brother/widget/text_widget.dart';

class Restpassword extends StatefulWidget {
  const Restpassword({super.key});

  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                TextWidget(
                  data: AppString.reset,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              children: [
                TextWidget(
                  data: AppString.decription,
                  fontSize: 8,
                ),
              ],
            ),
            SizedBoxWidget(
              height: 30,
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
                contentPadding: EdgeInsets.all(10), // Adjust padding as needed
              ),
            ),
            SizedBoxWidget(
              height: 20,
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
                  data: AppString.resetbutton,
                  fontSize: 20,
                ),
              ),
            ),
          ]),
        ));
  }
}
