import 'package:flutter/material.dart';
import 'package:legal_adviser/const/app_string.dart';

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
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: InkWell(
                child: const Icon(
                  Icons.work,
                  color: Colors.black,
                ),
              ),
              label: AppString.myCases,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.message_outlined,
                color: Colors.black,
              ),
              label: AppString.messages,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              label: AppString.appointments,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.ballot_outlined,
                color: Colors.black,
              ),
              label: AppString.balance,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_3_sharp,
                color: Colors.black,
              ),
              label: AppString.account,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
