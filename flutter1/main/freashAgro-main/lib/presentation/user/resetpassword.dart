import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/constant/app_string.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/widgets/sizebox.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';


class Restpassword extends StatefulWidget {
  const Restpassword({super.key});

  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const CustomAppBar(),),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Row(
              children: [
                TextWidget(
                  data: AppString.resetpasswordText,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const Row(
              children: [
                TextWidget(
                  data: AppString.decriptionText,
                  fontSize: 8,
                ),
              ],
            ),
            const SizedBoxWidget(
              height: 30,
            ),
             const SizedBoxWidget(
                    height: 10,
                  ),
                  const TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: AppColors
                          .inputColor,
                      hintText: AppString.emailText,
                      border: InputBorder.none, 

                      contentPadding:
                          EdgeInsets.all(10), 
                    ),
                  ),
                  const SizedBoxWidget(
                    height: 20,
                  ),
                  SizedBoxWidget(
              width: double.infinity, 
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 35, 39, 42),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const TextWidget(
                data: AppString.resetbuttonText,
                 fontSize: 20,
                ),
              ),
            ),
          ]),
        ));
  }
}
