
import 'package:custom/screens/firstSceen.dart';
// import 'package:custom/screens/fifthScreen.dart';
// import 'package:custom/screens/firstSceen.dart';
// import 'package:custom/screens/fouthScreen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp


 extends StatelessWidget {
  const MyApp
  
  
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}