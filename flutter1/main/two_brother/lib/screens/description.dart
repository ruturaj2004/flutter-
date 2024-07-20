import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/constant/app_string.dart';
import 'package:two_brother/widget/appbar.dart';
// import 'package:two_brother/widget/icon.dart';
// import 'package:two_brother/widget/sizebox.dart';
import 'package:two_brother/widget/text_widget.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  // ignore: override_on_non_overriding_member
  String? _selectedValue;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        color: AppColor.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextWidget(
                data:
                    "February is the month of love for good food - Free shipping \nabove ₹1499/-",
                fontSize: 10.sp,
                color: AppColor.white,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          AppBar(
            leading: DrawerButton(
              onPressed: () {
                // Navigator.push(
                //   // context,
                //   // MaterialPageRoute(
                //   //     builder: (context) => const SidebarScreen()),

                // );
              },
            ),
            title: CustomAppBar(),
            actions: [
              Row(
                children: [
                  Container(
                    // height: 30,
                    //width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DropdownButton(
                        hint: TextWidget(
                          data: "INR",
                          fontSize: 10.sp,
                          color: AppColor.black,
                        ),
                        underline: const SizedBox(),
                        value: _selectedValue,
                        items: [
                          DropdownMenuItem(
                            value: "INR",
                            child: Row(
                              children: [
                                TextWidget(
                                  data: "INR",
                                  fontSize: 10.sp,
                                  color: AppColor.black,
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: "USD",
                            child: Row(
                              children: [
                                TextWidget(
                                  data: "USD",
                                  fontSize: 10.sp,
                                  color: AppColor.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value as String?;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_pin, color: AppColor.black)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColor.black,
                  )),
              Row(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 3, 71,
                                5)), // Set border color to black when focused
                      ),
                      hintText: 'Search Tech Talk',
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ]));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _selectedValue;
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
              Row(
                children: [
                  Container(
                    child: DropdownButton(
                      hint: TextWidget(
                        data: "INR",
                        fontSize: 10.sp,
                        color: AppColor.black,
                      ),
                      underline: const SizedBox(),
                      value: _selectedValue,
                      items: [
                        DropdownMenuItem(
                          value: "INR",
                          child: Row(
                            children: [
                              TextWidget(
                                data: "INR",
                                fontSize: 10.sp,
                                color: AppColor.black,
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                            value: "USD",
                            child: Row(
                              children: [
                                TextWidget(
                                  data: "USD",
                                  fontSize: 10.sp,
                                  color: AppColor.black,
                                ),
                              ],
                            ),
                          ),

                      ],
                      onChanged: (String? value) {},
                    ),
                    
                  ),
                  // IconWidget(
                  //   iconData: Icons.search_rounded,
                  // ),
                  // SizedBoxWidget(
                  //   width: 10.w,
                  // ),
                  // IconWidget(
                  //   iconData: Icons.favorite_border,
                  // ),
                  // SizedBoxWidget(
                  //   width: 10.w,
                  // ),
                  // IconWidget(
                  //   iconData: Icons.shopping_cart_outlined,
                  // ),
                  // const SizedBoxWidget(
                  //   width: 10,
                  // )
                  IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_pin, color: AppColor.black)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColor.black,
                  )),
                ],
              ),
              // body:    Column(
              //   children: [
              //     Container(
              //       color: AppColor.green,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: TextWidget(
              //               data:
              //                   "February is the month of love for good food - Free shipping \nabove ₹1499/-",
              //               fontSize: 10.sp,
              //               color: AppColor.white,
              //               fontWeight: FontWeight.normal,
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Column(
              //       children: [
              //         Container(
              //           height: 200,
              //           color: AppColor.gray,
              //           child: Column(
              //             children: [
              //               AppBar(
              //                 leading: DrawerButton(),

              //               ),
              //               Row(children: [

              //               ],)
              //             ],
              //           ),

              //         ),
              //       ],
              //     )
              //   ],
              // ),
            ]),
            );
  }
}
