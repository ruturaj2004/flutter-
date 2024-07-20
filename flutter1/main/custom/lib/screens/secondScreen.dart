import 'package:custom/constants/app_color.dart';
import 'package:custom/constants/app_sizebox.dart';
import 'package:custom/constants/app_string.dart';
import 'package:custom/screens/thirdScreen.dart';
// import 'package:custom/screens/secondScreen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                // Row(
                //   children: [
                //     SizedBox(
                //         width: 312,
                //         child: SearchBar(
                //           hintText: "Search organation",
                //           backgroundColor: MaterialStatePropertyAll(
                //             Color.fromARGB(255, 216, 216, 216),
                //           ),
                //         )),
                //   ],
                // ),
                Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 190, 190, 190)), // Border color
        borderRadius: BorderRadius.circular(30), // Border radius
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search organation",
          border: InputBorder.none, // Hide TextField's border
          contentPadding: EdgeInsets.symmetric(horizontal: 70), // Padding
        ),
        style: TextStyle(color: Color.fromARGB(255, 201, 201, 201)), // Text color
      ),
              ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ThirdSceen()));
                    },
                    child: Container(
                      color: Color.fromARGB(255, 231, 231, 231),
                      width: 300,
                      height: 60,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              
                              children: [
                                Image.asset(
                                  "assets/images/baaplogo.png",
                                  height: 60,
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The Baap Company",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                              Text("Software company")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color.fromARGB(255, 231, 231, 231),
                    width: 300,
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/baaplogo.png",
                                height: 60,
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Infosys india pvt Ltd",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("Software company")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 185,
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
