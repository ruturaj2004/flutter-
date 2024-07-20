import 'package:go_router/go_router.dart';
import 'package:legal_adviser/views/build_screen/build_screen.dart';
import 'package:legal_adviser/views/detailcase_screen/detailcase_screen.dart';
import 'package:legal_adviser/views/home_screen/home_screen.dart';
import 'package:legal_adviser/views/inboxscreen/inbox_screen.dart';
import 'package:legal_adviser/views/login_screen/login-screen.dart';
import 'package:legal_adviser/views/phoneno_screen/login_phone_screen.dart';
import 'package:legal_adviser/views/phoneno_screen/signin_screen.dart';
import 'package:legal_adviser/views/register_screen/register_screen.dart';
import 'package:legal_adviser/views/splashscreen/splash_screen.dart';
import 'package:legal_adviser/views/success-screen/success_screen.dart';
import 'package:legal_adviser/views/verifyscreen/verify_screen.dart';

class Routes {
  static String splashScreen = '/splash';
  static String loginScreen = '/login-screen';
  static String homeScreen = '/home-screen';
  static String signInScreen = '/signin-screen';
  static String loginWithPhone = '/phone-Number';
  static String buildScreen = '/build-screen';
  static String registerScreen = '/register-screen';
  static String caseDetailScreen = '/casedetail-screen';

  static String successScreen = '/success-screen';

  static String verifyscreen = '/verify-screen';
  static String inboxscreen = '/inbox-screen';
  static String messagescreen = '/message-screen';
  static String myCaseScreen = '/mycase-screen';

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => Login(),
      ),
      GoRoute(
        path: signInScreen,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: loginWithPhone,
        builder: (context, state) => LoginPhoneScreen(),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: buildScreen,
        builder: (context, state) => BuildScreen(),
      ),
      GoRoute(
        path: successScreen,
        builder: (context, state) => SuccessScreen(),
      ),
      GoRoute(
        path: caseDetailScreen,
        builder: (context, state) => DetailCaseScreen(),
      ),
      GoRoute(path: verifyscreen, builder: (context, state) => VerifyScreen()),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: inboxscreen,
        builder: (context, state) => InboxScreen(),
      )
    ],
  );
}
