import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_app/constants/bloc_provider.dart';
import 'package:trip_app/utils/peferance/peferance.dart';
import 'package:trip_app/utils/routes/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await LocalStorageUtils.init();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MultiBlocProvider(
      providers: blocProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRoutes = Routes();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            title: 'Baap Trip',
            debugShowCheckedModeBanner: false,
            routeInformationParser: appRoutes.router.routeInformationParser,
            routeInformationProvider: appRoutes.router.routeInformationProvider,
            routerDelegate: appRoutes.router.routerDelegate,
          );
        });
  }
}
