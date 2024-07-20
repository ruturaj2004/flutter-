import 'package:baap_organic_app/presentation/cart_screen/cart_screen.dart';
import 'package:baap_organic_app/presentation/grid_view_screen/grid_view_product.dart';
import 'package:baap_organic_app/presentation/home_screen/home_screen.dart';
import 'package:baap_organic_app/presentation/product_screen/all_product_screen.dart';
import 'package:baap_organic_app/presentation/user/login_from.dart';
import 'package:baap_organic_app/presentation/user/login_screen.dart';
import 'package:go_router/go_router.dart';
class Routes {
  static String initalRoute = '/';
  static String homeScreen = '/home-screen';
  static String productscreen = '/product-screen';
  static String dailyEssensial ='/daily-essensial';
  static String addProduct='/add-to-cart';
  static String philosophyscreen = '/philosophy-screen';
  static String loginscreen = '/login-screen';
  static String loginfrom = '/loginfrom-screen';
  static String resetpassword = '/resetpassword-screen';
  static String signup = '/signup-screen';
  static String gridview = '/grid-view-screen';
  static String cartScreen = '/cart-screen';
  //static String phonescreen = '/phone-screen';

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: homeScreen,
    routes: [
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: productscreen,
        builder: (context, state) => const ProductScreen(),
      ),
      GoRoute(
        path: loginscreen,
        builder: (context, state) => const LoginScreen(),
      ),
       GoRoute(
        path: addProduct,
        builder: (context, state) => const CartScreen(),
       ), 
      //   GoRoute(
      //   path: dailyEssensial,
      //   builder: (context, state) => const Daily_essensial(),
      //  ),
      // GoRoute(
      //   path: philosophyscreen,
      //   builder: (context, state) => const PhilosophyScreen(),
      // ),

      GoRoute(
        path: loginfrom,
        builder: (context, state) => const LoginFrom(),
      ),
       GoRoute(
        path: gridview,
        builder: (context, state) =>  GridViewProduct(),
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) =>  CartScreen(),
      ),
    ],
  );
}
