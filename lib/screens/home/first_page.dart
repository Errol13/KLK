import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/services/call_page.dart';
import 'package:klinikonek_project/screens/services/services_page.dart';
import 'home_page.dart';
import 'package:klinikonek_project/screens/profile/profile_page.dart';
import 'package:flutter/services.dart';

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
    return WillPopScope(
      onWillPop: () async {
        //exit the app
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF276A7B),
          selectedFontSize: 15,
          onTap: _navigatedBottomBar,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Color(0xFF276A7B): Color(0xFFA7C7E7),),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.medical_services,
                color: _selectedIndex == 1
                    ? Color(0xFF276A7B)
                    : Color.fromRGBO(167, 199, 231, 1),
              ),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: _selectedIndex == 2
                    ? Color(0xFF276A7B)
                    : Color.fromRGBO(167, 199, 231, 1),
              ),
              label: 'Call',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _selectedIndex == 3
                    ? Color(0xFF276A7B)
                    : Color.fromRGBO(167, 199, 231, 1),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
