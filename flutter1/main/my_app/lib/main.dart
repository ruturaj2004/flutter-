import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data"),
                duration: Duration(seconds: 5),
                backgroundColor: Colors.amber,
              ));
            },
            child: Text("show snackbar")),
            CircularProgressIndicator(color: Colors.black,),
            LinearProgressIndicator(),
            

Column(
  children: [],
)
      ],
    )
    );
  }
}
