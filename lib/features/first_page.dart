import 'package:flutter/material.dart';
import 'home_page.dart';
import 'call_page.dart';
import 'services_page.dart';
import 'profile_page.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0; // Keep track of the selected index
  void _navigatedBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Screens to navigate to based on index
  final List<Widget> _pages = [
    HomePage(),
    ServicePage(),
    CallPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        selectedFontSize: 15,
        onTap: _navigatedBottomBar,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.blue : Color(0xFFA7C7E7),),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medical_services,
              color: _selectedIndex == 1
                  ? Colors.blue
                  : Color.fromRGBO(167, 199, 231, 1),
            ),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: _selectedIndex == 2
                  ? Colors.blue
                  : Color.fromRGBO(167, 199, 231, 1),
            ),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _selectedIndex == 3
                  ? Colors.blue
                  : Color.fromRGBO(167, 199, 231, 1),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
