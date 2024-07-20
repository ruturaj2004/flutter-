import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_string.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int visit = 0;
  double height = 70;
  Color selectColor = const Color(0xff9DDEA5);
  Color color = const Color(0xff6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: BottomBarDefault(
        items: const [
          TabItem(icon: Icons.person_add_alt_1_rounded, title: AppString.leads),
          TabItem(icon: Icons.assignment_outlined, title: AppString.orders),
          TabItem(icon: Icons.group, title: AppString.campaign),
          TabItem(icon: Icons.pie_chart, title: AppString.status),
        ],
        backgroundColor: AppColors.successColor.withOpacity(.8),
        color: color,
        colorSelected: selectColor,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
