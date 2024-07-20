import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Flexible(
          child: Text(
            "DocuVault",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight + 50,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 5.0,
                color: const Color.fromARGB(255, 217, 217, 217),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/linked_services.svg",
                              color: Colors.black,
                              width: 10,
                              height: 10,
                            ),
                            Text(
                              "DocuVault",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/linked_services.svg",
                              color: Colors.black,
                              width: 10,
                              height: 10,
                            ),
                            Text(
                              "DocuVault",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/linked_services.svg",
                              color: Colors.black,
                              width: 10,
                              height: 10,
                            ),
                            Text(
                              "DocuVault",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/linked_services.svg",
                              color: Colors.black,
                              width: 10,
                              height: 10,
                            ),
                            Text(
                              "Invetations",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: SizedBox(
                width: 70,
                height: 60,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color.fromARGB(255, 94, 36, 210),
                  foregroundColor: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 94, 36, 210),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/images/add.svg",
                    color: Colors.black,
                    width: 10,
                    height: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                // Image.asset(
                //   "assets/images/smplyfy.png",
                //   height: 200,
                //   width: 250,
                // ),
                SvgPicture.asset(
                  "assets/images/linked_services.svg",
                  color: Colors.black,
                  width: 10,
                  height: 10,
                ),
                Text(
                  "No Credentials Added Yet",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "There are no credentials added Yet",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "click here",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Text("to add a credential", style: TextStyle(fontSize: 16))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
