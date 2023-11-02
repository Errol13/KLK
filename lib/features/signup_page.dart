/* Authored by: Phoebe Marion B. Castro
Company: Lockey Inc.
Project: KLINIKONEK
Feature: [KLK-002] Registration Page(Sign Up)
Description: This is the page where the users will need to register or sign up.
 */

import 'package:flutter/material.dart';
import 'package:klinikonek_project/features/home_page.dart'; // Import necessary packages.
import 'splash_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true; // Initialize a boolean variable for password visibility toggle.

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Create a Scaffold for the page structure.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the content.
        child: Column( //create elements vertically
          mainAxisAlignment: MainAxisAlignment.center, //children will be aligned center in y-axis
          crossAxisAlignment: CrossAxisAlignment.center, //children will be aligned center in x-axis
          children: [ 
            const Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'Kumusta ka?', // Display a welcoming message.
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B), // Define text styles.
                    ),
                  ),
                  Text(
                    'Sign Up', // Display a sign-up heading.
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B), // Define text styles.
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), //used as margin-like between widgets with the height 20 // Add spacing.
            SizedBox(
              height: 200,
              width: 100,
              child: Center(
                child: Image.asset(
                  'assets/Logo.png', // Display an image (logo).
                ),
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name', // Create a text input field for the user's full name.
                  labelStyle: const TextStyle(
                    color: Color(0xff276A7B),
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
                    borderSide: const BorderSide(
                      color: Color(0xFFA7C7E7),
                      width: 1.0,
                    ),
                  ),
                ),
                style: const TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),
            ),
            const SizedBox(height: 10), // Add spacing.
            SizedBox(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email', // Create a text input field for the user's email.
                  labelStyle: const TextStyle(
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
                    borderSide: const BorderSide(
                      color: Color(0xFFA7C7E7),
                      width: 1.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress, // Set keyboard type for email.
                style: const TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),
            ),
            const SizedBox(height: 10), // Add spacing.
            SizedBox(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password', // Create a text input field for the user's password.
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: const TextStyle(
                    color: Color(0xff276A7B),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFFA7C7E7),
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
                        _obscureText = !_obscureText; // Implement password visibility toggle.
                      });
                    },
                  ),
                ),
                style: const TextStyle(
                  color: Color(0xFF276A7B),
                ),
                obscureText: _obscureText, // Hide the password text.
              ),
            ),
            const SizedBox(height: 40), // Add spacing.
            RegButton(
              width: 400,
              height: 40,
              text: 'Sign Up', // Display a Sign-Up button.
              textColor: Colors.white,
              bgColor: const Color(0xFF276A7B),
              onPressed: () {
                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to the Home page.
                 );
              },
            ),
            const SizedBox(height: 15), // Add spacing.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?", // Display a message.
                  style: TextStyle(
                    color: Color(0xFFA7C7E7),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()), // Navigate to the Login page.
                    );
                  },
                  child: const Text(
                    'Log In', // Display a Log In button.
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
