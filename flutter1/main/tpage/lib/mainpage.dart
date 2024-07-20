import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 74, 67, 67),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.waving_hand_rounded,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ],
                ),  
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(color: Colors.amber, fontSize: 14),
                ),
                Text(
                  "Steve Jone",
                  style: TextStyle(fontSize: 15,color: const Color.fromARGB(255, 255, 253, 246)),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
    border: Border.all(
      color: Color.fromARGB(255, 23, 59, 137), // Set the color of the border
      width: 2.0, // Set the width of the border
    ),
    borderRadius: BorderRadius.circular(100.0), // Set the border radius
  ),
                  child: IconButton(
                    
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/man.png',
                      height: 35,
                      width: 35,
                      
                     
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
      
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: [
              
              SizedBox(
                height: 30,
          
              ),
              
              ElevatedCardExample(),
              FilledCardExample(),
              OutlinedCardExample(),
              
            ],
          ),
        ),
      ),
    );
  }
}

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 172, 86, 206),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35), // Adjust the value as needed
        ),
        child: SizedBox(
          width: 380,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      Text(
                        "Health Tips",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                ListTile(
                  title: Text('Drinking water can prevent',
                      style: TextStyle(fontSize: 17)),
                  subtitle: Text('dehydration, a condition that can...',
                      style: TextStyle(fontSize: 17, color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(26), // Adjust the value as needed
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // You can adjust the content here based on your requirements
                        Text(
                          'Drink more water',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                            width:
                                10), // Adjust the spacing between text and image

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 244, 250, 126),
                            borderRadius: BorderRadius.circular(
                                25), // Adjust the radius as needed
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/bottel.png',
                              height: 30,
                              width: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 31, 172, 127),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35), // Adjust the value as needed
        ),
        child: SizedBox(
          width: 380,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      Text(
                        "Articles",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                ListTile(
                  title: Text('Drinking water can prevent',
                      style: TextStyle(fontSize: 17)),
                  subtitle: Text('dehydration, a condition that can...',
                      style: TextStyle(fontSize: 17, color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(26), // Adjust the value as needed
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // You can adjust the content here based on your requirements
                        Text(
                          'Read More Articles',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                            width:
                                10), // Adjust the spacing between text and image

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 172, 86, 206),
                            borderRadius: BorderRadius.circular(
                                25), // Adjust the radius as needed
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/notes.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class OutlinedCardExample extends StatelessWidget {
  const OutlinedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 244, 250, 126),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35), // Adjust the value as needed
        ),
        child: SizedBox(
          width: 380,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      Text(
                        "Health Care",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                ListTile(
                  title: Text('Drinking water can prevent',
                      style: TextStyle(fontSize: 17)),
                  subtitle: Text('dehydration, a condition that can...',
                      style: TextStyle(fontSize: 17, color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(26), // Adjust the value as needed
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // You can adjust the content here based on your requirements
                        Text(
                          'Stress Manegment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                            width:
                                10), // Adjust the spacing between text and image

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 31, 172, 127),
                            borderRadius: BorderRadius.circular(
                                25), // Adjust the radius as needed
                          ),
                          child: Image.asset(
                            "assets/images/brain.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
