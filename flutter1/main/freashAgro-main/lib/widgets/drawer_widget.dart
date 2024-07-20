// import 'package:baap_organic_app/constant/app_color.dart';
// import 'package:baap_organic_app/presentation/home_screen/home_screen.dart';
// import 'package:baap_organic_app/presentation/philosophy_screen/philosophy_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:baap_organic_app/constant/app_string.dart';
// import 'package:baap_organic_app/widgets/listTile_widget.dart';
// import 'package:baap_organic_app/widgets/text_widget.dart';

// class CustomDrawer extends StatefulWidget {
//   const CustomDrawer({Key? key}) : super(key: key);

//   @override
//   State<CustomDrawer> createState() => _CustomDrawerState();
// }

// class _CustomDrawerState extends State<CustomDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox(
//         child: Drawer(
//           child: ListView(children: [
//             ListTile(
//               leading: const Icon(Icons.cancel_presentation_rounded,
//                   color: AppColors.iconColor),
//               onTap: () {
//                 Navigator.of(context).pop(); // Close the drawer
//               },
//             ),
//             ListTileWidget(
//               leading: const Icon(
//                 Icons.home,
//                 color: AppColors.iconColor,
//               ),
//               title: AppString.homeText,
//               onTap: () => _navigateToScreen(context, const HomeScreen()),
//             ),
//             ExpansionTile(
//               leading: const Icon(
//                 Icons.shop_rounded,
//                 color: AppColors.iconColor,
//               ),
//               title: const TextWidget(
//                 data: AppString.shopText,
//                 fontWeight: FontWeight.normal,
//               ),
//               children: [
//                 _listTileWidget(
//                   title: "All Products",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Newly Launched",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Ghee",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Combos",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Winter Treats",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Essentials",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Super Foods",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Care",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Coffee",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Vegan",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Gift Hampers",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             ExpansionTile(
//               leading: const Icon(
//                 Icons.pets_rounded,
//                 color: AppColors.iconColor,
//               ),
//               title: const TextWidget(
//                 data: AppString.ourPhilosophyText,
//                 fontWeight: FontWeight.normal,
//               ),
//               children: [
//                 // _listTileWidget(
//                 //     title: "Our Philosophy",
//                 //     onTap: () =>
//                 //         _navigateToScreen(context, const PhilosophyScreen())),
//                 _listTileWidget(
//                   title: "Health of People & Planet",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Soil Health",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Conscious Cattle Rearing",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Our Community",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Awards & Recognition",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             ExpansionTile(
//               leading: const Icon(
//                 Icons.person,
//                 color: AppColors.iconColor,
//               ),
//               title: const TextWidget(
//                 data: AppString.theMovementText,
//                 fontWeight: FontWeight.normal,
//               ),
//               children: [
//                 _listTileWidget(
//                   title: "Work With Farmers",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Workshops & Lectures",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Collaborations",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             ExpansionTile(
//               leading: const Icon(
//                 Icons.note_alt_rounded,
//                 color: AppColors.iconColor,
//               ),
//               title: const TextWidget(
//                 data: AppString.engageText,
//                 fontWeight: FontWeight.normal,
//               ),
//               children: [
//                 _listTileWidget(
//                   title: "Blogs - Farmer's Kitaab",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Blogs - Food & Health",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Blogs - Real Life Stories",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Publications",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "FAQs",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Testimonials",
//                   onTap: () {},
//                 ),
//                 _listTileWidget(
//                   title: "Overseas Orders",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             ListTileWidget(
//               leading: const Icon(
//                 Icons.my_library_books_rounded,
//                 color: AppColors.iconColor,
//               ),
//               title: AppString.labReportsText,
//               onTap: () {},
//             ),
//             const Divider(
//               color: Colors.grey,
//               thickness: 1,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
//               child: TextWidget(data: AppString.getInTouchText),
//             ),
//             ExpansionTile(
//                 leading: const Icon(
//                   Icons.call,
//                   color: AppColors.iconColor,
//                 ),
//                 title: const TextWidget(
//                   data: AppString.connectText,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 children: [
//                   ExpansionTile(
//                     title: const TextWidget(
//                       data: "Contact Us",
//                       fontWeight: FontWeight.normal,
//                     ),
//                     children: [
//                       _listTileWidget(
//                         title: "Mail Us",
//                         onTap: () {},
//                       ),
//                       _listTileWidget(
//                         title: "Call Us",
//                         onTap: () {},
//                       ),
//                       _listTileWidget(
//                         title: "Whatsapp Us",
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                   _listTileWidget(
//                     title: "Farm Visits",
//                     onTap: () {},
//                   ),
//                   _listTileWidget(
//                     title: "Delhi Store",
//                     onTap: () {},
//                   ),
//                   _listTileWidget(
//                     title: "Farmer's Market",
//                     onTap: () {},
//                   ),
//                   _listTileWidget(
//                     title: "Franchise",
//                     onTap: () {},
//                   ),
//                 ]),
//             _listTileWidget(
//               title: AppString.rewardsText,
//               onTap: () {},
//             ),
//           ]),
//         ),
//       ),
//     );
//   }

//   _listTileWidget({
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return ListTileWidget(
//       title: title,
//       onTap: onTap,
//     );
//   }

//   void _navigateToScreen(BuildContext context, Widget screen) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => screen),
//     );
//   }
// }
