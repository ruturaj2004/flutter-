import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_app/logic/start_trip_cubit/start_trip_logic_cubit.dart';
import 'package:trip_app/model/start_trip_model/start_trip_model.dart';
import 'package:trip_app/presentations/End%20Trip%20Screen/end_trip_screen.dart';
import 'package:trip_app/presentations/login_baap_app/login_baap_app.dart';
import 'package:trip_app/presentations/verify_otp_screen/verify_otp_screen.dart';
import 'package:trip_app/presentations/Route%20Screen/route_screen.dart';
import 'package:trip_app/presentations/send_otp_screen/send_otp_screen.dart';
import 'package:trip_app/utils/peferance/peferance.dart';

class Routes {
  static const String phoneScreen = "/phone-screen";
  static const String otpScreen = "/otp-screen";
  static const String endTripScreen = "/end-trip-screen";
  static const String routeScreen = "/route-screen";
  static const String loginBaapAppScreen = "/login-baap-app-screen";

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: _determineInitialLocation(),
    routes: [
      GoRoute(
        path: phoneScreen,
        builder: (context, state) => const PhoneScreen(),
      ),
      GoRoute(
          path: otpScreen,
          builder: (context, state) {
            var item = state.extra as Map<String, dynamic>;
            String phoneNumber = item['phoneNumber'];
            return OtpScreen(
              phoneNumber: phoneNumber,
            );
          }),
      GoRoute(
        path: endTripScreen,
        builder: (context, state) => EndTripScreen(),
      ),
      GoRoute(
        path: routeScreen,
        builder: (context, state) => const RouteScreen(),
      ),
      GoRoute(
        path: loginBaapAppScreen,
        builder: (context, state) => const LoginBaapApp(),
      )
    ],
  );
  String _determineInitialLocation() {
    String? token = GetStorage().read('token');
    // bool startTripCalled = GetStorage().read('startTripModel') ?? false;
    // bool endTripCalled = GetStorage().read('getDurationModel') ?? false;
    // bool updatelocationCall = GetStorage().read('updatelocation') ?? false;
    if (token != null && token.isNotEmpty) {
      return Routes.routeScreen;
    }
    return Routes.phoneScreen;
  }
}
