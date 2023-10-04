import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
                    'Mabuhay!Welcome to',
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
                  'assets/Logo.png',
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 200),
            RegButton(
              width: 400,
              height: 40,
              text: 'Sign Up',
              textColor: Colors.white,
              bgColor: const Color(0xFF276A7B),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );},
            ),
            SizedBox(height: 20),
            RegButton(
              width: 400,
              height: 40,
              text: 'Login',
              textColor: const Color(0xFF276A7B),
              bgColor: Colors.white,
              border: Border.all(color: const Color(0xFF276A7B), width: 2.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RegButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color textColor;
  final Color bgColor;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding; // Added padding parameter
  final Border? border;

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
    this.border,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
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
