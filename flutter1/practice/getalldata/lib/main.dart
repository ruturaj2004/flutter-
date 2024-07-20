import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getalldata/constant/block_provider.dart';
import 'package:getalldata/presentation/home_screen.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
void main (){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocprovider,
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}