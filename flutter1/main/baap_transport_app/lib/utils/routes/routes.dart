import 'package:baap_trasport_app/app/home/view/home_screen.dart';
import 'package:baap_trasport_app/app/login/views/login_screen.dart';
import 'package:baap_trasport_app/app/login/views/verify_otp.dart';
import 'package:baap_trasport_app/app/start_trip/view/trip_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashScreen = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String verifyOtp = '/verifyOtp';
  static const String startTrip = '/startTrip';

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: startTrip,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: verifyOtp,
        builder: (context, state) => const VerifyOtp(),
      ),
      GoRoute(
        path: startTrip,
        builder: (context, state) => const TripScreen(),
      ),
    ],
  );
}
