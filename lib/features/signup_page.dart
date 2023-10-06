import 'package:flutter/material.dart';
import 'splash_page.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'Kumusta ka?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
<<<<<<< HEAD
              height: 200,
=======
              height: 100,
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
              width: 100,
              child: Center(
                child: Image.asset(
                  'assets/Logo.png',
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
<<<<<<< HEAD
                    color: Color(0xff276A7B),
=======
                    color: Color(0xFFA7C7E7),
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
<<<<<<< HEAD
                      color: Color(0xFFA7C7E7),
=======
                      color: Color(0xFF276A7B),
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
<<<<<<< HEAD
                    color: Color(0xff276A7B),
=======
                    color: Color(0xFFA7C7E7),
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
<<<<<<< HEAD
                      color: Color(0xff659d66),
=======
                      color: Color(0xff688ba8),
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
<<<<<<< HEAD
                      color: Color(0xFFA7C7E7),
=======
                      color: Color(0xFF276A7B),
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                      width: 1.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
<<<<<<< HEAD
                    color: Color(0xff276A7B),
=======
                    color: Color(0xFFA7C7E7),
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
<<<<<<< HEAD
                      color: Color(0xff659d66),
=======
                      color: Colors.white,
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
<<<<<<< HEAD
                      color: Color(0xFFA7C7E7),
=======
                      color: Color(0xFF276A7B),
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
                      width: 1.0,
                    ),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 40),
            RegButton(
              width: 400,
              height: 40,
              text: 'Sign Up',
              textColor: Colors.white,
              bgColor: const Color(0xFF276A7B),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
<<<<<<< HEAD
            ),
             SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Color(0xFFA7C7E7),
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Color(0xFF276A7B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
=======
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 33a98709491fd1074646d24caf536204d720de6f
