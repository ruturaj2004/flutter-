// import 'package:go_router/go_router.dart';
// import 'package:salesman_app/model/search_products_model/search_products_res_model.dart';
// import 'package:salesman_app/presentation/group_screen/group_screen.dart';
// import 'package:salesman_app/presentation/home_screen/home_screen.dart';
// import 'package:salesman_app/presentation/order_screen/order_screen.dart';
// import 'package:salesman_app/presentation/payment_screen/payment_screen.dart';
// import 'package:salesman_app/presentation/profile_screen/profile_screen.dart';
// import 'package:salesman_app/presentation/shopping_cart_screen/shopping_cart_screen.dart';
// import 'package:salesman_app/presentation/verify_otp_screen/verify_otp_screen.dart';
// import '../../presentation/product_detail_screen/product_detail_screen.dart';
// import '../../presentation/send_otp_screen/send_otp_screen.dart';
// import '../preferences/local_preferences.dart';

// class Routes {
//   static String initalRoute = '/';
//   static String sendOtp = '/sendOtp-screen';
//   static String otpScreen = '/Otp-screen';
//   static String groupScreen = '/group-screen';
//   static String homeScreen = '/home-screen';
//   static String orderScreen = '/order-screen';
//   static String shopingCart = "/shoping-cart";
//   static String detailScreen = '/detail-screen';
//   static String paymentscreen = '/payment-scren';
//   static String profileScreen = "/Profile-screen";
//   GoRouter get router => _goRouter;

//   late final GoRouter _goRouter = GoRouter(
//     initialLocation:orderScreen,
    
//     //  _determineInitialLocation(),
//     routes: [
//       GoRoute(
//         path: sendOtp,
//         builder: (context, state) => const SendOtpScreen(),
//       ),
//       GoRoute(
//           path: otpScreen,
//           builder: (context, state) {
//             var item = state.extra as Map<String, dynamic>;
//             String phoneNumber = item['phoneNumber'];
//             return OtpScreen(
//               phoneNumber: phoneNumber,
//             );
//           }),
//       GoRoute(
//         path: groupScreen,
//         builder: (context, state) => const GroupScreen(),
//       ),
//       GoRoute(
//         path: homeScreen,
//         builder: (context, state) => const HomeScreen(),
//       ),
//       GoRoute(
//         path: orderScreen,
//         builder: (context, state) => const OrderScreen(),
//       ),
//       GoRoute(
//         path: shopingCart,
//         builder: (context, state) => ShoppingCart(),
//         // var item = state.extra as Map<String, dynamic>;
//         // final int? groupId = item['groupId'];
//         // final int? parentId = item['parentId'];
//         // return ShopingCart(groupId: groupId, parentId: parentId);
//       ),
//       GoRoute(
//           path: detailScreen,
//           builder: (context, state) {
//             var item = state.extra as Map<String, dynamic>?;
//             searchProducts productModel = item?["searchmodel"];

//             return ProductDetailScreen(
//               productModel: productModel,
//             );
//           }),
//       GoRoute(
//         path: paymentscreen,
//         builder: (context, state) {
//           return const PaymentScreen();
//         },
//       ),
//       GoRoute(
//         path: profileScreen,
//         builder: (context, state) {
//           return const ProfileScreen();
//         },
//       ),
//     ],
//   );

//   String _determineInitialLocation() {
//     final token = LocalStorageUtils.instance.getString('refreshToken');
//     if (token != null && token.isNotEmpty) {
//       return Routes.groupScreen;
//     }
//     return Routes.sendOtp;
//   }
// }
