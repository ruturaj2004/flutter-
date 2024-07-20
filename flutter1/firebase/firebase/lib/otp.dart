import 'dart:math';

import 'package:firebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendOtpScreen extends StatefulWidget {
  String verificationId;
  SendOtpScreen({super.key, required this.verificationId});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify otp"),
      ),
      body: Column(
        children: [
          TextField(
            controller: otpController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "enter otp",
              suffixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otpController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  });
                } catch (ex) {}
              },
              child: Text("otp"))
        ],
      ),
    );
  }
}
