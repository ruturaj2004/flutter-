// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/constant/app_string.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/widgets/icon_widget.dart';
import 'package:baap_organic_app/widgets/sizebox.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Daily_essensial extends StatefulWidget {
  const Daily_essensial({super.key});

  @override
  State<Daily_essensial> createState() => _Daily_essensialState();
}

class _Daily_essensialState extends State<Daily_essensial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconWidget(
          iconData: Icons.arrow_back,
        ),
        title: const CustomAppBar(),
        centerTitle: true,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
               const  SizedBox(height: 10,),
                Titletext(),
              ],
            ),
          ),
          Position()
        ],
      ),
    );
  }

  Titletext() {
    return TextWidget(
      data: AppString.dailytitleText,
      color: AppColors.suceessColor,
      fontWeight: FontWeight.w800,
      fontSize: 15.sp,
    );
  }

  
  
  Position() {
    return  Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return  const SizedBox(
                                  height: 790,
                                  width: 540,
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            textStyle:  TextStyle(
                              fontSize: 15.h,
                              fontWeight: FontWeight.bold,
                            ),
                            minimumSize: const Size(205, 50),
                          ),
                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.compare_arrows_sharp,
                                  color: Colors.white), 
                              SizedBox(
                                  width:
                                      8.w), 
                              const Text(
                                'Filter',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                     const  SizedBox(width: 1,),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const SizedBox(
                                  height: 490,
                                  width: 540,
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            minimumSize: const Size(205, 50),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.import_export, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Sort',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
  }
}


