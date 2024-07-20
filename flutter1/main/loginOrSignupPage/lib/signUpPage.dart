import 'package:firstpage/singIn.dart';
import 'package:flutter/material.dart';

class signupage extends StatefulWidget {
  const signupage({super.key});

  @override
  State<signupage> createState() => _signupageState();
}

class _signupageState extends State<signupage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SIGN UP",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text("Email", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)))),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text("Password", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)))),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 30,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 215, 211, 211),
                        borderRadius: BorderRadius.circular(5)),
                    width: 30,
                    child: Column(children: [
                      Center(
                        child: Text("OR"),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Color.fromARGB(255, 93, 89, 89),
            ),
            SizedBox(
              width: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 215, 211, 211),
                              borderRadius: BorderRadius.circular(17)),
                          width: 30,
                          child: Column(children: [
                            Center(
                              child: Icon(Icons.person_3),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 215, 211, 211),
                              borderRadius: BorderRadius.circular(17)),
                          width: 30,
                          child: Column(children: [
                            Center(
                              child: Icon(Icons.person_3),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 215, 211, 211),
                              borderRadius: BorderRadius.circular(17)),
                          width: 30,
                          child: Column(children: [
                            Center(
                              child: Icon(Icons.person_3),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
//             Row(
//               children: [
//                 FloatingActionButton(
//   backgroundColor: Colors.amberAccent,
//   onPressed: () {},
//   child: Icon(
//     Icons.,
//     size: 35,
//     color: Colors.black,
//   ),
// ),
// SizedBox(width: 10,),
// FloatingActionButton(
//   backgroundColor: Colors.amberAccent,
//   onPressed: () {},
//   child: Icon(
//     Icons.train,
//     size: 35,
//     color: Colors.black,
//   ),
// ),
// SizedBox(width: 10,),
// FloatingActionButton(
//   backgroundColor: Colors.amberAccent,
//   onPressed: () {},
//   child: Icon(
//     Icons.train,
//     size: 35,
//     color: Colors.black,
//   ),
// ),
//               ],
//             )
            ,
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Already a user?", style: TextStyle(fontSize: 17)),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signin()),
                          );
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
