import 'dart:async';

import 'package:custom/constants/app_color.dart';
import 'package:custom/constants/app_sizebox.dart';
import 'package:custom/constants/app_string.dart';
import 'package:custom/screens/fifthScreen.dart';
  // import 'package:custom/screens/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FouthScreen extends StatefulWidget {
  const FouthScreen({super.key});

  @override
  
  
  State<FouthScreen> createState() => _FouthScreenState();
  
}

class _FouthScreenState extends State<FouthScreen> {
   void initState() {
    super.initState();
   }
  @override
  



  Widget build(BuildContext context) {
     Timer(
            Duration(seconds: 3),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => FifthScreen())));
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
           
              Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/images/success.json', // Replace with your Lottie JSON file
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            Text("Your request is send to administrator"),
            Text("Check back again.")
           
          ],
        ),
              ),
            SizedBox(
              height: 180,
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
}
