import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 231, 232, 1),
      appBar: AppBar(
        title: Text(
          "Klinikonek",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF276A7B),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(15),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Image.asset(
                      'assets/wave.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Hi Julia!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                ),
                IconButton(
                  icon: ImageIcon(
                    AssetImage("assets/user.png"),
                    color: null,
                  ),
                  onPressed: () {},
                  iconSize: 40,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              height: 200,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              height: 200,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              height: 200,
              color: Colors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medical_services,
              color: Color.fromRGBO(167, 199, 231, 1),
            ),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: Color.fromRGBO(167, 199, 231, 1),
            ),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Color.fromRGBO(167, 199, 231, 1),
            ),
            label: 'Account',
          ),
        ],
        selectedItemColor: const Color.fromRGBO(39, 106, 123, 1),
        selectedFontSize: 15,
        onTap: (int i) => debugPrint("Button $i Tapped"),
      ),
    );
  }
}
