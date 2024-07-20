import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LOGIN",
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
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.blue; // or the color you want when selected
                    }
                    return const Color.fromARGB(255, 245, 241,
                        240); // or the color you want when not selected
                  }),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    },
                    );
                  },
                ),
                Column(
                  children: [
                    Text("Remender Me !", style: TextStyle(fontSize: 18))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password!",
                      style: TextStyle(
                        fontSize: 17,
                        decorationThickness: 2,
                      ),
                    ))
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/facebook-app-symbol.png',
                      color: Color.fromARGB(255, 58, 157, 219),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/google.png',
                      color: Colors.red[400],
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    
                    child: Image.asset(
                      'assets/images/linkedin.png',
                      color: Color.fromARGB(255, 56, 67, 183),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Need An Account?", style: TextStyle(fontSize: 17)),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "SIGN UP",
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
