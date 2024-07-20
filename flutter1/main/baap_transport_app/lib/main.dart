import 'dart:developer';

import 'package:baap_trasport_app/constants/api_end_points.dart';
import 'package:baap_trasport_app/constants/bloc_provider.dart';
import 'package:baap_trasport_app/utils/api_base_model/api_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'app_config.dart';
import 'utils/preferences/local_preferences.dart';
import 'utils/routes/routes.dart';

void main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageUtils.init();
  Bloc.observer = MyBlocObserver();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  final appConfig = await AppConfig().formEnviroment(env);
  runApp(MultiBlocProvider(
    providers: blocProvider,
    child: MyApp(
      appConfig: appConfig,
    ),
  ));
}

late ApiEndPoints apiEndPoints;

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.appConfig,
  });

  final ApiBaseModel appConfig;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _goRouter = Routes();
  @override
  void initState() {
    apiEndPoints = ApiEndPoints(apiBaseModel: widget.appConfig);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      child: MaterialApp.router(
        title: 'Hostel Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        routeInformationParser: _goRouter.router.routeInformationParser,
        routerDelegate: _goRouter.router.routerDelegate,
        routeInformationProvider: _goRouter.router.routeInformationProvider,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}
