// import 'package:baap_organic_app/constant/app_string.dart';
// import 'package:baap_organic_app/widgets/button_widget.dart';
// import 'package:baap_organic_app/widgets/listTile_widget.dart';
// import 'package:baap_organic_app/widgets/sectionText_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:baap_organic_app/constant/app_color.dart';
// import 'package:baap_organic_app/constant/app_images.dart';
// import 'package:flutter_svg/svg.dart';
// import '../appbar/appbar.dart';
// import 'package:baap_organic_app/utils/routes/routes.dart';
// import 'package:baap_organic_app/widgets/drawer_widget.dart';
// import 'package:baap_organic_app/widgets/icon_widget.dart';
// import 'package:baap_organic_app/widgets/text_widget.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// final _formKey = GlobalKey<FormState>();

// class PhilosophyScreen extends StatefulWidget {
//   const PhilosophyScreen({Key? key}) : super(key: key);

//   @override
//   State<PhilosophyScreen> createState() => _PhilosophyScreenState();
// }

// class _PhilosophyScreenState extends State<PhilosophyScreen> {
//   String? _selectedValue = "INR";
//   String searchText = "";

//   final _emailController = TextEditingController();
//   String? validateEmail(String? email) {
//     RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
//     final isEmailValid = emailRegex.hasMatch(email ?? '');
//     if (!isEmailValid) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             context.go(Routes.homeScreen);
//           },
//           child: IconWidget(iconData: Icons.arrow_back_outlined),
//         ),
//         title: const Center(
//           child: CustomAppBar(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _freeShippingWidget(),
//             _searchBarWidget(),
//             _twoBrothersWidget(),
//             _soilHeroWidget(),
//             _healthyPlanetWidget(),
//             _consciousCattleWidget(),
//             _togetherCreateWidget(),
//             _recognitionWidget(),
//             _imageWidget(),
//             SizedBox(height: 30.h),
//             _emailWidget(),
//             _googlePlayWidget(),
//             SizedBox(height: 20.h),
//             _categoriesWidget(),
//           ],
//         ),
//       ),
//     );
//   }

//   _freeShippingWidget() {
//     return Container(
//       color: AppColors.iconColor,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: TextWidget(
//               data:
//                   "February is the month of love for good food - Free shipping \nabove ₹1499/-",
//               fontSize: 10.sp,
//               color: AppColors.whiteColor,
//               fontWeight: FontWeight.normal,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _searchBarWidget() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               DrawerButton(onPressed: () => _openDrawer(context)),
//               const CustomAppBar(),
//               Row(
//                 children: [
//                   Container(
//                     height: 30.h,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: AppColors.blackColor,
//                         width: 1.w,
//                       ),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: DropdownButton(
//                         hint: TextWidget(
//                           data: "INR",
//                           fontSize: 10.sp,
//                           color: AppColors.blackColor,
//                         ),
//                         underline: const SizedBox(),
//                         value: _selectedValue,
//                         items: [
//                           DropdownMenuItem(
//                             value: "INR",
//                             child: TextWidget(
//                               data: "INR",
//                               fontSize: 10.sp,
//                               color: AppColors.blackColor,
//                             ),
//                           ),
//                           DropdownMenuItem(
//                             value: "USD",
//                             child: TextWidget(
//                               data: "USD",
//                               fontSize: 10.sp,
//                               color: AppColors.blackColor,
//                             ),
//                           ),
//                         ],
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedValue = value as String?;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.location_pin,
//                         color: AppColors.blackColor),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.shopping_bag_outlined,
//                       color: AppColors.blackColor,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           SizedBox(
//             height: 35.h,
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 hintStyle: TextStyle(
//                   fontSize: 13.sp,
//                 ),
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: AppColors.iconColor,
//                     style: BorderStyle.solid,
//                     width: 5.0.w,
//                   ),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   searchText = value;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _twoBrothersWidget() {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Image.asset(
//           AppImages.philosophyScreenBgImage,
//           width: 400.sp,
//           height: 400.sp,
//           fit: BoxFit.cover,
//         ),
//         Padding(
//           padding: EdgeInsets.all(60.0.sp),
//           child: TextWidget(
//             data:AppString.beginning,
//             fontSize: 11.sp,
//             color: AppColors.textGreyColor,
//             letterSpacing: 1,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }

//   _soilHeroWidget() {
//     return TextSectionWidget(
//       imageUrl: AppImages.soilImage,
//       title: "SOIL IS OUR HERO",
//       description:
//           "Our soil is worth its weight in gold. We\n wish to leave it in a better shape than\n when we received it. We want it to\n breathe, to live, to sustain life. The reason\n for our regenerative farming practices is\n to maintain a healthy and enriched soil.",
//       imageHeight: 230.h,
//       onButtonPressed: () =>
//           _navigateToKnowMore(context, const PhilosophyScreen()),
//       backgroundColor: AppColors.iconColor,
//       textColor: AppColors.whiteColor,
//       titleTextColor: const Color(0xFFFDF2CD),
//       button: ButtonWidget(
//         onPressed: () => _navigateToKnowMore(context, const PhilosophyScreen()),
//         radius: 5,
//         height: 15.h,
//         width: 125.w,
//         buttonText: 'KNOW MORE',
//         buttonTextColor: AppColors.whiteColor,
//         borderWidth: 1,
//         buttonTextSize: 12.sp,
//         backGroundColor: AppColors.iconColor,
//         borderColor: AppColors.whiteColor,
//       ),
//     );
//   }

//   _healthyPlanetWidget() {
//     return TextSectionWidget(
//       imageUrl: AppImages.healthyPeopleImage,
//       title: "HEALTHY PLANET HEALTHY\n PEOPLE",
//       description:
//           "We are 4th gen farmers who are inspired\n by ancient wisdom & sustainability\n organic farming isn’t a type of farming\n but is a way of life. We practice\n regenerative organic farming and thus\n replinish soil health everyday while at\n work.",
//       imageHeight: 210.h,
//       onButtonPressed: () =>
//           _navigateToKnowMore(context, const PhilosophyScreen()),
//       backgroundColor: AppColors.whiteColor,
//       titleTextColor: AppColors.iconColor,
//       textColor: AppColors.blackColor,
//       button: ButtonWidget(
//         onPressed: () => _navigateToKnowMore(context, const PhilosophyScreen()),
//         radius: 5,
//         height: 15.h,
//         width: 210.w,
//         buttonText: 'OUR FARMING PRACTICES',
//         buttonTextColor: AppColors.whiteColor,
//         borderWidth: 1,
//         buttonTextSize: 12.sp,
//         backGroundColor: AppColors.iconColor,
//         borderColor: AppColors.whiteColor,
//       ),
//     );
//   }

//   _consciousCattleWidget() {
//     return TextSectionWidget(
//       imageUrl: AppImages.consciousCattleImage,
//       title: "CONSCIOUS CATTLE\n REARNIG",
//       description:
//           "At the heart of our farming practices are\n our Cows.\n We have Pure breed Native Gir Cows at\n the farm for their dung and urine - the\n only two things we use as inputs for our\n soil. The milk has always been a by-\n product.",
//       imageHeight: 210.h,
//       onButtonPressed: () =>
//           _navigateToKnowMore(context, const PhilosophyScreen()),
//       backgroundColor: AppColors.lightYellowColor,
//       textColor: AppColors.iconColor,
//       titleTextColor: AppColors.iconColor,
//       button: ButtonWidget(
//         onPressed: () => _navigateToKnowMore(context, const PhilosophyScreen()),
//         radius: 5,
//         height: 15.h,
//         width: 120.w,
//         buttonText: 'KNOW MORE',
//         buttonTextColor: AppColors.whiteColor,
//         borderWidth: 1,
//         buttonTextSize: 12.sp,
//         backGroundColor: AppColors.iconColor,
//         borderColor: AppColors.whiteColor,
//       ),
//     );
//   }

//   _togetherCreateWidget() {
//     return TextSectionWidget(
//       imageUrl: AppImages.togetherCreateImage,
//       title: "TOGETHER WE CREATE",
//       description:
//           "Each time you buy from us, you help\n secure livelihoods and empower rural\n women. We care to be climate positive\n while making food that is healthy and\n traceable to its source. Born from\n indigenous seeds and raised by the\n tireless hands of our farmer folk, tbof\n products are made fresh at our farm-\nkitchen.",
//       imageHeight: 210.h,
//       onButtonPressed: () =>
//           _navigateToKnowMore(context, const PhilosophyScreen()),
//       backgroundColor: AppColors.whiteColor,
//       titleTextColor: AppColors.iconColor,
//       textColor: AppColors.blackColor,
//       button: ButtonWidget(
//         onPressed: () => _navigateToKnowMore(context, const PhilosophyScreen()),
//         radius: 5,
//         height: 15.h,
//         width: 120.w,
//         buttonText: 'READ MORE',
//         buttonTextColor: AppColors.whiteColor,
//         borderWidth: 1,
//         buttonTextSize: 12.sp,
//         backGroundColor: AppColors.iconColor,
//         borderColor: AppColors.whiteColor,
//       ),
//     );
//   }

//   _recognitionWidget() {
//     return Container(
//       color: const Color(0xFF691a17),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextWidget(
//                   data: "IMPACT & RECOGNITION",
//                   color: AppColors.lightYellowColor,
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ],
//             ),
//           ),
//           TextSectionWidget(
//             imageUrl: AppImages.journeyTwowardsImage,
//             title: "JOURNEY TOWARDS\n SUSTAINABILITY",
//             description: "Featured on GQ India",
//             imageHeight: 260.h,
//             onButtonPressed: () =>
//                 _navigateToKnowMore(context, const PhilosophyScreen()),
//             backgroundColor: const Color(0xFF691a17),
//             textColor: Colors.white,
//             titleTextColor: AppColors.lightYellowColor,
//             button: ButtonWidget(
//               onPressed: () =>
//                   _navigateToKnowMore(context, const PhilosophyScreen()),
//               radius: 5,
//               height: 15.h,
//               width: 135.w,
//               buttonText: 'READ MORE',
//               buttonTextColor: AppColors.blackColor,
//               borderWidth: 1,
//               buttonTextfontWeight: FontWeight.bold,
//               buttonTextSize: 12.sp,
//               backGroundColor: AppColors.whiteColor,
//               borderColor: AppColors.whiteColor,
//             ),
//           ),
//           TextSectionWidget(
//             imageUrl: AppImages.farmersImage,
//             title: "EMPOWERING 9000 FARMERS",
//             description: "Featured on YourStory",
//             imageHeight: 260.h,
//             onButtonPressed: () =>
//                 _navigateToKnowMore(context, const PhilosophyScreen()),
//             backgroundColor: const Color(0xFF691a17),
//             textColor: Colors.white,
//             titleTextColor: AppColors.lightYellowColor,
//             button: ButtonWidget(
//               onPressed: () =>
//                   _navigateToKnowMore(context, const PhilosophyScreen()),
//               radius: 5,
//               height: 15.h,
//               width: 135.w,
//               buttonText: 'READ MORE',
//               buttonTextColor: AppColors.blackColor,
//               borderWidth: 1,
//               buttonTextfontWeight: FontWeight.bold,
//               buttonTextSize: 12.sp,
//               backGroundColor: AppColors.whiteColor,
//               borderColor: AppColors.whiteColor,
//             ),
//           ),
//           TextSectionWidget(
//             imageUrl: AppImages.towardsJoyImage,
//             title: "TOWARDS JOY: THE BIG\n SWITCH",
//             description: "Featured on TheBetterIndia",
//             imageHeight: 260.h,
//             onButtonPressed: () =>
//                 _navigateToKnowMore(context, const PhilosophyScreen()),
//             backgroundColor: const Color(0xFF691a17),
//             textColor: Colors.white,
//             titleTextColor: AppColors.lightYellowColor,
//             button: ButtonWidget(
//               onPressed: () =>
//                   _navigateToKnowMore(context, const PhilosophyScreen()),
//               radius: 5,
//               height: 15.h,
//               width: 135.w,
//               buttonText: 'READ MORE',
//               buttonTextColor: AppColors.blackColor,
//               borderWidth: 1,
//               buttonTextfontWeight: FontWeight.bold,
//               buttonTextSize: 12.sp,
//               backGroundColor: AppColors.whiteColor,
//               borderColor: AppColors.whiteColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _imageWidget() {
//     return Row(
//       children: [
//         SizedBox(
//           height: 80.h,
//           width: 360.w,
//           child: Image.asset(
//             AppImages.organicLifeImage,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }

//   _emailWidget() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextWidget(
//             data: "The Organic Way of Life",
//             color: AppColors.iconColor,
//             fontSize: 15.sp,
//             fontWeight: FontWeight.bold,
//           ),
//           SizedBox(height: 15.sp),
//           TextWidget(
//             data:
//                 "Subscribe for special offers, newsletters and become a part of our movement",
//             color: AppColors.iconColor,
//             fontSize: 12.sp,
//             fontWeight: FontWeight.bold,
//           ),
//           SizedBox(height: 15.sp),
//           Form(
//             key: _formKey,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     height: 40,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: "Your e-mail",
//                         hintStyle: TextStyle(fontSize: 11.sp),
//                         border: const OutlineInputBorder(),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               // Handle valid email submission
//                             }
//                           },
//                           icon: const Icon(Icons.arrow_forward),
//                           iconSize: 15.sp,
//                         ),
//                       ),
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: validateEmail, // Ensure you define this method
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _googlePlayWidget() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _appStoreButton(AppImages.googlePlayImage),
//               _appStoreButton(AppImages.appStoreImage),
//             ],
//           ),
//           SizedBox(height: 10.sp),
//           const Divider(height: 5, thickness: 1.0, color: AppColors.iconColor),
//           SizedBox(height: 20.sp),
//           InkWell(
//             onTap: () {},
//             child: Image.asset(AppImages.twoBrothersImage, height: 150.h),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _socialIcon('assets/icon/facebook.svg', onTap: () {}),
//               _socialIcon('assets/icon/twitter.svg', onTap: () {}),
//               _socialIcon('assets/icon/instagram.svg', onTap: () {}),
//               _socialIcon('assets/icon/youtube.svg', onTap: () {}),
//               _socialIcon('assets/icon/linkedin.svg', onTap: () {}),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   _categoriesWidget() {
//     return Column(
//       children: [
//         ExpansionTile(
//           title: TextWidget(
//             data: "CATEGORIES",
//             fontSize: 14.sp,
//             fontWeight: FontWeight.bold,
//           ),
//           children: [
//             _listTileWidget(
//               title: "Bilona A2 Ghee",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Breakfast & Snacks",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Kitchen Essentials",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Natural Sweetners",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Healthy Snacking",
//               size: 11.sp,
//               onTap: () {},
//             ),
//           ],
//         ),
//         ExpansionTile(
//           title: TextWidget(
//             data: "GENERAL",
//             fontSize: 14.sp,
//             fontWeight: FontWeight.bold,
//           ),
//           children: [
//             _listTileWidget(
//               title: "Sitemap",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Terms Of Service",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Refund & Cancellation Policy",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Privacy Policy",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Shipping & Delivery Policy",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Mobile App",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Contact Us",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Whatsapp Us",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Our Team",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "Corporate Information & Investor relations",
//               size: 11.sp,
//               onTap: () {},
//             ),
//             _listTileWidget(
//               title: "We are hiring! ⭐️",
//               size: 11.sp,
//               onTap: () {},
//             ),
//           ],
//         ),
//         const Divider(
//           thickness: 1,
//           color: AppColors.iconColor,
//           height: 1,
//           indent: 25,
//           endIndent: 25,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextWidget(
//                 fontSize: 11.sp,
//                 data:
//                     "TBOF FOODS PRIVATE LIMITED (Two Brothers Organic Farms India)",
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextWidget(
//                 data: "(CIN): U01110PN2019TC182942",
//                 fontSize: 11.sp,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextWidget(
//                 fontSize: 11.sp,
//                 data:
//                     "11th FLOOR, N-1104, JASMINIUM BUILDING, MAGARPATTA CITY, HADAPSAR, Pune, Maharashtra, 411028",
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: TextWidget(
//                   data: "Email: info@twobrothersindia.com",
//                   decoration: TextDecoration.underline,
//                   fontSize: 11.sp,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextWidget(
//                 data: "Tel: 7406753753",
//                 fontSize: 11.sp,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextWidget(
//                 data: "Grievances: 7406753753",
//                 fontSize: 11.sp,
//               ),
//               const Divider(
//                 thickness: 1,
//                 color: AppColors.iconColor,
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: TextWidget(
//                         data: "Made with 💗 U.LABS",
//                         fontSize: 12.sp,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   _listTileWidget({
//     String? title,
//     VoidCallback? onTap,
//     double? size,
//   }) {
//     return ListTileWidget(
//       title: title,
//       size: size,
//       onTap: onTap,
//     );
//   }

//   _appStoreButton(String imageUrl) {
//     return InkWell(
//       onTap: () {},
//       child: Image.asset(imageUrl, height: 38.h),
//     );
//   }

//   _socialIcon(String assetName, {required Null Function() onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child:
//           SvgPicture.asset(assetName, color: AppColors.iconColor, height: 12),
//     );
//   }

//   void _openDrawer(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const CustomDrawer()),
//     );
//   }

//   void _navigateToKnowMore(BuildContext context, Widget screen) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => screen),
//     );
//   }
// }
