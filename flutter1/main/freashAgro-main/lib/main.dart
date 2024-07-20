import 'dart:developer';
import 'package:baap_organic_app/app_config.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constant/api_endpoint.dart';
import 'model/api_base_model.dart';
import 'utils/routes/routes.dart';

void main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // final SharedPreferences sharedPreferences =
  //     await SharedPreferences.getInstance();
  final appConfig = await AppConfig().forEnvironment(env);
  runApp(
    MyApp(
      config: appConfig,
      // sharedPreferences: sharedPreferences,
    ),
  );
}

late ApiEndPoints apiEndpoints;

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.config,
    // required this.sharedPreferences,
  });

  final ApiBaseModel config;
  // final SharedPreferences sharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    apiEndpoints = ApiEndPoints(apiBaseModel: widget.config);
    super.initState();
  }

  final appRoutes = Routes();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 740),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'बळीराजा',
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          routeInformationParser: appRoutes.router.routeInformationParser,
          routeInformationProvider: appRoutes.router.routeInformationProvider,
          routerDelegate: appRoutes.router.routerDelegate,
          // builder: (_, child) => ResponsiveBreakpoints.builder(
          //   child: child!,
          //   breakpoints: [
          //     const Breakpoint(start: 0, end: 360, name: MOBILE),
          //     const Breakpoint(start: 361, end: 800, name: TABLET),
          //     const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          //     const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          //   ],
          // ),
        );
      },
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

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   log("Change in $bloc: $transition");
  //   super.onTransition(bloc, transition);
  // }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}
