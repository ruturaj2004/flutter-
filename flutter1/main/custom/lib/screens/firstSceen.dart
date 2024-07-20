import 'package:custom/constants/app_color.dart';
import 'package:custom/constants/app_sizebox.dart';
import 'package:custom/constants/app_string.dart';
import 'package:custom/screens/secondScreen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppString.welcome),
            Text(
              AppString.ownerName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: AppSizebox.top20pxsizebox,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "People",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  "management on",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  "your fingertrip",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [_startNow()],
              ),
            ),
            SizedBox(
              height: AppSizebox.bottom20pxsizebox,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppString.poweredby,
                    style: TextStyle(
                      fontSize: 14,
                    )),
                Text(AppString.companyname,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }

  _startNow() {
    return (ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondScreen()));
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Text("Start Now",
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold))));
  }
}
