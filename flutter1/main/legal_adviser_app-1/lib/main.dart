import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_adviser/const/bloc_provider.dart';
import 'package:legal_adviser/model/env_global.dart';
import 'package:legal_adviser/utils/app_config.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'const/api_end_points.dart';

void main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = await AppConfig().forEnvironment(env);
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: blocProviders,
      child: MyApp(
        config: appConfig,
      ),
    ),
  );
}

late ApiEndpoints apiEndpoints;

class MyApp extends StatefulWidget {
  MyApp({required this.config, super.key});

  final ApiBaseUrlModel config;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    apiEndpoints = ApiEndpoints(apiBaseUrlModel: widget.config);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRoutes = Routes();
    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Legel Advisor',
            debugShowCheckedModeBanner: false,
            routeInformationParser: appRoutes.router.routeInformationParser,
            routeInformationProvider: appRoutes.router.routeInformationProvider,
            routerDelegate: appRoutes.router.routerDelegate,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
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
