/* Authored by: Xavier D. Santiago
Company: Lockey
Project: Klinikonek
Feature: [KLKE-003] Feature title
Description: This is the page where users will log in to their account.
 */

import 'package:flutter/material.dart'; // Import necessary packages.
import 'splash_page.dart';
import 'signup_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  // Create a StatefulWidget for the Sign-Up page.
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText =
      true; // Initialize a boolean variable for password visibility toggle.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Create a Scaffold for the page structure.
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add padding to the content.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'Welcome Back', // Display a welcoming message.
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                      fontFamily: 'Raleway',
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                      fontFamily: 'Raleway',
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
            SizedBox(height: 20),
            Container(
              width: 400,
              height: 42,
              child: TextField(
                decoration: InputDecoration(
                  labelText:
                      'Email', // Create a text input field for the user's email.
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Color(0xFFA7C7E7),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Raleway',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Colors.blue, // Change the border color here
                      width: 2.0, // Adjust the border width as needed
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEDECF4), // Change the border color here
                      width: 1.0, // Adjust the border width as needed
                    ),
                  ),
                ),
                keyboardType:
                    TextInputType.emailAddress, // Set keyboard type for email.
                style: TextStyle(
                  color: const Color(0xFF276A7B),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText:
                      'Password', // Create a text input field for the user's password.
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Color(0xFFA7C7E7),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEDECF4),
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF276A7B),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Implement password visibility toggle.
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
                obscureText: _obscureText, // Hide the password text.
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
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
