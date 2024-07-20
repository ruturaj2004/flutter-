import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/presentation/home_screen/home_screen.dart';
import 'package:baap_organic_app/widgets/bottom_navigation.dart';
import 'package:baap_organic_app/widgets/sizebox.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewProduct extends StatefulWidget {
  @override
  State<GridViewProduct> createState() => GridViewProductState();
}

class GridViewProductState extends State<GridViewProduct> {
  bool isFavorite = false;

// This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkColor,
      appBar: AppBar(
        title: const  CustomAppBar()
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          11120,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/orange.png",
                      height: 80,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          data: "Onion",
                          color: const Color.fromARGB(255, 6, 163, 230),
                          fontSize: 20.sp,
                        ),
                        const SizedBoxWidget(
                          width: 10,
                        ),
                        TextWidget(
                          data: "30/kg",
                          color: AppColors.blackColor,
                          fontSize: 17.sp,
                        ),
                        
                      ],
                    ),
                    addCardButton()
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: const SizedBoxWidget(
        height: 60,
        child: ShowBottomNavigationBar(),
      ),
    );
  }
  
 
}
