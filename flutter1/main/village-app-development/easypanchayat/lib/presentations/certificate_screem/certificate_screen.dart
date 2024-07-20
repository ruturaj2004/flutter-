import 'package:easy_localization/easy_localization.dart';
import 'package:easypanchayat/presentations/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/sizedbox_widget.dart';
import '../../widgets/text_widget.dart';

class ExpandableListScreen extends StatefulWidget {
  @override
  _ExpandableListScreenState createState() => _ExpandableListScreenState();
}

class _ExpandableListScreenState extends State<ExpandableListScreen> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
          body: Stack(children: [
            _imageWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 27, right: 27),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleBarWidget(),
                    const SizedBoxWidget(
                      height: 25,
                    ),
                    _certificateListWidget(),
                  ]),
            ),
          ]),
          bottomNavigationBar: const FooterWidget(
            isBackgroundColor: true,
          )),
    );
  }

  _titleBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/image/left_arrow.svg', // Replace with your SVG image path
                height: 17.h,
                width: 17.h,
                color: AppColors.blackColor,
              ),
              const SizedBoxWidget(
                width: 11,
              ),
              TextWidget(
                text: "certificates".tr(),
                fontSize: 20.sp,
                color: AppColors.blackColor,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors
                .profileBackgroundColor, // Adjust the radius as per your preference
            child: SvgPicture.asset(
              'assets/image/person_icon.svg', // Replace with your SVG image path
              height: 20.h,
              width: 20.w,
              color: AppColors.iconColor,
            ),
          ),
        ),
      ],
    );
  }

  _imageWidget() {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: 285.h,
        child: Image.asset(
          'assets/image/property_img.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _certificateListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: Row(
            children: [
              Transform.rotate(
                angle: _isExpanded ? 1.6 : 0, // Rotate when expanded
                child: const Icon(Icons.chevron_right), // Chevron right icon
              ),
              const SizedBoxWidget(
                width: 10,
              ),
              const Text(
                'कोणता दाखला हवा आहे',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Container(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: const Column(
              children: [
                Text('दाखला  1.'),
                SizedBoxWidget(
                  height: 10,
                ),
                Text('दाखला  2.'),
                SizedBoxWidget(
                  height: 10,
                ),
                Text('दाखला  3.'),
              ],
            ),
          ),
      ],
    );
  }
}
