import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 230,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Hana Jane",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur Lo...gyhyfguhugtjugjgy6tugjhgjgujyi87ygkmhhij <3",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(180, 205, 206, 56),
                            ),
                            height: 32,
                            margin: const EdgeInsets.all(15),
                          ),
                        ),
                        LikeButton(
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 175,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Phoebe Castro",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "Loving can hurt, loving can hurt sometimes",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(180, 205, 206, 56),
                            ),
                            height: 32,
                            margin: const EdgeInsets.all(15),
                          ),
                        ),
                        LikeButton(
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 175,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Errol Celis",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "But it's the only thing that I know",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(180, 205, 206, 56),
                            ),
                            height: 32,
                            margin: const EdgeInsets.all(15),
                          ),
                        ),
                        LikeButton(
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 200,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Xavier Santiago",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "When it gets hard, you know it can get hard sometimes",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(180, 205, 206, 56),
                            ),
                            height: 32,
                            margin: const EdgeInsets.all(15),
                          ),
                        ),
                        LikeButton(
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 175,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Miguel Toledana",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "It is the only thing makes us feel alive",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(180, 205, 206, 56),
                            ),
                            height: 32,
                            margin: const EdgeInsets.all(15),
                          ),
                        ),
                        LikeButton(
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 250,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Hana Jane",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur Lo...gyhyfguhugtjugjgy6tugjhgjgujyi87ygkmhhij <3",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(180, 205, 206, 56),
                            ),
                            height: 32,
                            margin: const EdgeInsets.all(15),
                          ),
                        ),
                        LikeButton(
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
