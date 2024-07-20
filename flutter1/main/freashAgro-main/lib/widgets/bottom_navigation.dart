import 'package:baap_organic_app/constant/app_color.dart';
import 'package:flutter/material.dart';

class ShowBottomNavigationBar extends StatefulWidget {
  const ShowBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<ShowBottomNavigationBar> createState() =>
      _ShowBottomNavigationBarState();
}

class _ShowBottomNavigationBarState extends State<ShowBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.format_list_numbered_rounded,
                color: Colors.black,
              ),
            ),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.notification_add,
                color: Colors.black,
              ),
            ),
            label: 'Inbox',
          ),
        
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.person_3_sharp,
                color: Colors.black,
              ),
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
