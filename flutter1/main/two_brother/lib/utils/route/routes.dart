import 'package:go_router/go_router.dart';
import 'package:two_brother/screens/description.dart';
import 'package:two_brother/screens/itemview.dart';
import 'package:two_brother/screens/lawNetwork.dart';
import 'package:two_brother/screens/login_from.dart';
import 'package:two_brother/screens/login_screen.dart';
import 'package:two_brother/screens/product.dart';
import 'package:two_brother/screens/resetpassword.dart';
import 'package:two_brother/screens/signup.dart';

class Routes {
  late final GoRouter router;
  static const String initial = "/";
  static const String phoneScreen = "/phone-screen";
  static const String loginformScreen = "/login-form";
  static const String signup = "/signup-screen";
  static const String resetpassword = "/resetpass-screen";
  static const String product = "/product-screen";
  static const String item = "/itemview-screen";
  static const String des = "/desc-screen";
  static const String law = "/law-network";





  Routes() {
    router = GoRouter(
      initialLocation: phoneScreen,
      routes: [
        GoRoute(
          path: phoneScreen,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: loginformScreen,
          builder: (context, state) => LoginFrom(),
        ),
        GoRoute(
          path: signup,
          builder: (context, state) => Signup(),
        ),
        GoRoute(
          path: resetpassword,
          builder: (context, state) => Restpassword(),
        ),
        GoRoute(
          path:product,
          builder: (context, state) => Productlist(),
           ),
           GoRoute(path: item,
           builder: (context, state) => IteamView(),),
         GoRoute(path: item,
         builder: (context, state) => IteamView(),),
         GoRoute(path: des,
         builder: (context, state) => MyApp(),),
         GoRoute(path: law,
         builder: (context, state) => LawNetwork(),)
      ],
    );
  }
}
