import 'package:flutter/material.dart';

class Shoes extends StatefulWidget {
  const Shoes({super.key});

  @override
  State<Shoes> createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            width: 500,
            child: Row(
              children: [Image.asset("assets/images/shoes.jpg")],
            ),
          ),
          Row(
            children: [
              Text(
                "Essential",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Women Shoes")
            ],
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "NIKE",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                    )
                  ],
                ),
              
               Row(
            children: [
              Text("AIR",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 10))
            ],
          ),
          ],
            ),
            
          ),
         
        ],
      ),
    );
  }
}
