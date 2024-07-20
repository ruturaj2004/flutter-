import 'package:easypanchayat/widgets/dashed_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/sizedbox_widget.dart';
import '../../widgets/text_widget.dart';
import '../profile_screen/profile_screen.dart';

class PropertyDetail extends StatefulWidget {
  const PropertyDetail({super.key});

  @override
  State<PropertyDetail> createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.backgroundGreyColor,
            body: Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _containerWidget(),
                const SizedBoxWidget(
                  height: 15,
                ),
                _ownerNameContainer(),
                const SizedBoxWidget(
                  height: 15,
                ),
                _floarContainer(),
                const SizedBoxWidget(
                  height: 10,
                ),
                _texTextWidget(),
                const SizedBoxWidget(
                  height: 10,
                ),
                _taxContainer(),
              ]),
              _imageWidget()
            ]),
            bottomNavigationBar: const FooterWidget(
              isBackgroundColor: true,
            )));
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

  _containerWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 320.h,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft:
              Radius.circular(32), // Adjust the radius as per your requirement
          bottomRight:
              Radius.circular(32), // Adjust the radius as per your requirement
        ),
        child: Container(
          color: AppColors.containerGreyColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 27, right: 26, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleBarWidget(),
                const SizedBoxWidget(
                  height: 10,
                ),
                const DashedDivider(),
                const SizedBoxWidget(
                  height: 10,
                ),
                _containerDataWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _titleBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/image/left_arrow.svg', // Replace with your SVG image path
                height: 17.h,
                width: 17.h,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBoxWidget(
              width: 11,
            ),
            TextWidget(
              text: 'मालमत्तेची माहिती',
              fontSize: 20.sp,
              color: AppColors.blackColor,
            )
          ],
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

  _containerDataWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "मालमत्ता क्रमांक",
                    fontSize: 16.sp,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: "19287374",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBoxWidget(
                width: 90,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "अनु क्र.",
                    fontSize: 16.sp,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: "12",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBoxWidget(
                width: 90,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "फ्लोअर",
                    fontSize: 16.sp,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: "1",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              )
            ],
          ),
          const SizedBoxWidget(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "क्षेत्रफळ",
                    fontSize: 16.sp,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: "1203.30 स्केअर फूट",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBoxWidget(
                width: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "चालू कर",
                    fontSize: 16.sp,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: "रु 1230.00",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBoxWidget(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: " ",
                    fontSize: 16.sp,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: "थकीत",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.redTextColor,
                  ),
                ],
              )
            ],
          ),
          const SizedBoxWidget(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "पत्ता",
                    fontSize: 16.sp,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text:
                        "WARD NO 3, GAVTHAN, GHOLEWADI RD,\nPAREGAON KH, TAL SANGAMNER",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _ownerNameContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 160.h,
        width: MediaQuery.of(context).size.width,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'मालकांची नावं',
                fontSize: 18.sp,
                color: AppColors.blackColor,
              ),
              const SizedBoxWidget(
                height: 5,
              ),
              const DashedDivider(),
              const SizedBoxWidget(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'अदिती विपुल शर्मा',
                    fontSize: 18.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: 'प्रथम',
                    fontSize: 18.sp,
                    color: AppColors.blueTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBoxWidget(
                height: 5,
              ),
              TextWidget(
                text: 'अदिती विपुल शर्मा',
                fontSize: 18.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
              const SizedBoxWidget(
                height: 5,
              ),
              TextWidget(
                text: 'गणपत वामन पळपुटे',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _floarContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 120.h,
        width: MediaQuery.of(context).size.width,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'फ्लोअर    1',
                fontSize: 18.sp,
                color: AppColors.blackColor,
              ),
              const SizedBoxWidget(
                height: 5,
              ),
              const DashedDivider(),
            ],
          ),
        ),
      ),
    );
  }

  _texTextWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: TextWidget(
        text: 'कर भरणे तपशील',
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    );
  }

  _taxContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'फ्लोअर    1',
                    fontSize: 18.sp,
                    color: AppColors.blackColor,
                  ),
                  TextWidget(
                    text: 'थकीत',
                    fontSize: 18.sp,
                    color: AppColors.redTextColor,
                  ),
                ],
              ),
              const SizedBoxWidget(
                height: 5,
              ),
              const DashedDivider(),
              const SizedBoxWidget(
                height: 10,
              ),
              Row(
                children: [
                  TextWidget(
                    text: 'Rs. 20,000',
                    fontSize: 18.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBoxWidget(width: 60),
                  Container(
                    height: 40.h,
                    width: 59.w,
                    color: AppColors.blackColor,
                    child: TextButton(
                        onPressed: () {},
                        child: const TextWidget(
                          text: 'PAY NOW',
                          color: AppColors.whiteColor,
                        )),
                  ),
                  const SizedBoxWidget(width: 15),
                  Container(
                    height: 40.h,
                    width: 94.w,
                    color: AppColors.buttonColor,
                    child: TextButton(
                        onPressed: () {},
                        child: const TextWidget(
                          text: 'Download Invoice',
                          color: AppColors.blackColor,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
