import 'package:custom/constants/app_color.dart';
import 'package:custom/constants/app_string.dart';
import 'package:custom/widgets/calendar.dart';
import 'package:custom/widgets/container.dart';

import 'package:flutter/material.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppString.welcome),
                    Text(
                      AppString.ownerName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Administator Food factory"),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.notifications_active_outlined),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.more_vert_outlined,
                            size: 25,
                            color: Color(0xFF5F6368),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CalanderWidget(
                  context: context,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 207, 205, 205)),
              child: Center(
                  child: Text(
                "Check In",
                style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerWidget(),
                ContainerWidget(),
                ContainerWidget()
              ],
            ),
            Row(
              children: [
                Text("Leave Request",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            Divider(
              thickness: 1,
              color: Color.fromARGB(255, 201, 200, 200),
            ),
              Row(
              children: [
                Text("No recent leave request",style: TextStyle(fontSize: 18),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
