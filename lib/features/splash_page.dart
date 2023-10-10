/* Authored by: Errol John O. Celis
Company: Lockey Inc.
Project: Klinikonek
Feature: [KLK-001] Splash
Description: This is the page where users will select to either login or register.
 */

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), //padding is 16
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //children will be aligned center in y-axis
          crossAxisAlignment: CrossAxisAlignment.center,  //children will be aligned center in x-axis
          children: [
            const Align( //align the elements both in vertical and horizontal axes
              alignment: Alignment.topCenter, //align at the topcenter
              child: Column( //create elements vertically
                children: [
                  Text(
                    'Mabuhay! Welcome to',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                  Text(
                    'Klinikonek',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Image.asset(
                  'assets/Logo.png', // the directory where the image is placed
                ),
              ),
            ),
            SizedBox(height: 100),
            RegButton( //call the class RegButton 
              width: 400,
              height: 40,
              text: 'Sign Up',
              textColor: Colors.white,
              bgColor: const Color(0xFF276A7B),
              onPressed: () {
                Navigator.push( //move to the next page or different screen
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()), //the route it should follow when clicked
                );
              },
            ),
            SizedBox(height: 20),//used as margin-like between widgets with the height 20
            RegButton( //call the class RegButton 
              width: 400,
              height: 40,
              text: 'Login',
              textColor: const Color(0xFF276A7B),
              bgColor: Colors.white,
              onPressed: () {
                Navigator.push(//move to the next page or different screen
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()), //the route it should follow when clicked
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class created for the style and look of registration/login buttons
class RegButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color textColor;
  final Color bgColor;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding; // Added padding parameter

  const RegButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.onPressed,
    this.padding =
        const EdgeInsets.all(12), // Default padding is 12 on all sides
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: padding, // Apply padding to the button
          shape: RoundedRectangleBorder( //make the border with rounded corners and other border-related properties
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(color: Color(0xFF276A7B), width: 1.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
