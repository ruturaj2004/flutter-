import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/widgets/bottom_navigation.dart';
import 'package:baap_organic_app/widgets/button_widget.dart';
import 'package:baap_organic_app/widgets/sizebox.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      bottomSheet: const SizedBoxWidget(
        height: 60,
        child: ShowBottomNavigationBar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomOutlinedButton(
              onPressed: () {},
              buttonText: "Plase Order (Buy)",
              backgroundColor: AppColors.yellowColor,
              buttonHeight: 40,
              buttonWidth: 200,
              fontSize: 15.sp,
              borderRadius: 15,
            ),
          ),
          _listCart()
        ],
      ),
    );
  }

  _listCart() {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              color: const Color.fromARGB(255, 204, 193, 193),
              child: Row(
                children: [
                  Image.asset("assets/methi.png"),
                    Column(
                    children: [
                      TextWidget(data: "Methi",
                      fontSize: 20.sp,
                      ),
                         TextWidget(data: "20/",
                      fontSize: 13.sp,
                      )
                    ],
                  ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         ElevatedButton(
              //           onPressed: _decrementCounter,
              //           child: const Icon(Icons.remove),
              //         ),
              //         const SizedBoxWidget(
              //           width: 15,
              //         ),
              //         Text(
              //           '$_counter',
              //           style: const TextStyle(
              //               fontSize: 15, fontWeight: FontWeight.bold),
              //         ),
              //         const SizedBox(width: 20),
              //         ElevatedButton(
              //           onPressed: _incrementCounter,
              //           child: const Icon(Icons.add),
              //         ),
              //       ],
              //     ),
                 
              //   ],
              // ),
            
                ])
            ),
          );
        },
      ),
    );
  }
}
