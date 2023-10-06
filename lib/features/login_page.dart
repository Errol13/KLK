//import 'dart:html';

import 'package:flutter/material.dart';
import 'splash_page.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
              width: 100,
              child: Center(
                child: Image.asset(
                  'assets/Logo.png',
                  // fit: BoxFit.cover,
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
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFFA7C7E7),
                      width: 1.0,
                    ),
                  ),
                ),
                obscureText: true,
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
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFFA7C7E7),
                      width: 1.0,
                    ),
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFF276A7B),
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            RegButton(
              width: 400,
              height: 40,
              text: 'Login',
              textColor: Colors.white,
              bgColor: const Color(0xFF276A7B),
              onPressed: () {},
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet?",
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
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF276A7B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
