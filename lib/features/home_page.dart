import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'bottomnavbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 231, 232, 1),
      appBar: AppBar(
        title: const Text(
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
                const Expanded(
                  child: Text(
                    "Hi Julia!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onTap: () {},
                  splashColor: Colors.white10,
                  child: Ink.image(
                      fit: BoxFit.cover,
                      width: 45,
                      height: 45,
                      image: const AssetImage('user.png')),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
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
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
                        const SizedBox(
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
                        const LikeButton(
                          size: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        const SizedBox(
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
              height: 190,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
                        const SizedBox(
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
                        const LikeButton(
                          size: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        const SizedBox(
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
              height: 190,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
                        const SizedBox(
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
                        const LikeButton(
                          size: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        const SizedBox(
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
              height: 220,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
                        const SizedBox(
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
                        const LikeButton(
                          size: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        const SizedBox(
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
              height: 190,
              margin: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: <Widget>[
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
                        const SizedBox(
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
                        const LikeButton(
                          size: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        const SizedBox(
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
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
                        const SizedBox(
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
                        const LikeButton(
                          size: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_comment_rounded),
                          onPressed: () {},
                          iconSize: 35,
                        ),
                        const SizedBox(
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
