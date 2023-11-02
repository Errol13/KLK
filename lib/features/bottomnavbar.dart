import 'package:flutter/material.dart';
import 'home_page.dart';
import 'services_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; // Keep track of the selected index

  // Screens to navigate to based on index
  final List<Widget> _screens = [
    HomePage(),
    ServicePage(),
    HomePage(),
    ServicePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:
              Icon(Icons.home, color: _selectedIndex == 0 ? Colors.blue : null),
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
      selectedItemColor: Colors.blue,
      selectedFontSize: 15,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        // Navigate to the selected screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _screens[index]),
        );
      },
    );
  }
}
