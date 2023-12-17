/* Authored by: Xavier D. Santiago
Company: Lockey
Project: Klinikonek
Feature: [KLKE-003] Feature title
Description: This is the page where users will log in to their account.
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; // Import necessary packages.
import 'splash_page.dart';
import 'signup_page.dart';
import 'package:klinikonek_project/screens/home/first_page.dart';
import 'package:klinikonek_project/auth.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  // Create a StatefulWidget for the Sign-Up page.
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText =
      true; // Initialize a boolean variable for password visibility toggle.

  //authentication
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Auth auth = Auth(); // Create an instance of the Auth class

  //validate form
  bool _validateForm() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  //Login Loading and Exception Handling
  void _logInUser(BuildContext context) async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF276A7B),),
        );
      },
    );

    //try to log in
    try {
      // Use Firebase Authentication for login
      await auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      Navigator.pop(context);
      
      // Navigate to the next screen on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstPage()),
      );
      
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);

      //print('Firebase Auth Exception: $e');

      if (e.code == 'invalid-email' || e.code == 'user-not-found') {
        _errorNotice('Invalid Email');
      } else if (e.code == 'invalid-login-credentials' || e.code =='wrong-password') {
        _errorNotice('Incorrect Password');
      } else if (e.code == 'too-many-requests') {
        _errorNotice('Too many attempts ! Try later');
      }
      else{
        _errorNotice('Incorrect Password');
      }
    }
  }

  //wrong password and email notice method
  void _errorNotice(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Color(0xFF276A7B),
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Create a Scaffold for the page structure.
     // resizeToAvoidBottomInset: false, //fix overflow pixel in keyboard popping
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the content.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Welcome Back!', // Display a welcoming message.
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText:
                          'Email', // Create a text input field for the user's email.
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: const TextStyle(
                        color: Color(0xff276A7B),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color:
                              Color(0xff659d66), // Change the border color here
                          width: 2.0, // Adjust the border width as needed
                        ),
                      ),
                      //enabled border styling
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(
                              255, 156, 156, 158), // Change the border color here
                          width: 1.0, // Adjust the border width as needed
                        ),
                      ),
        
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    keyboardType: TextInputType
                        .emailAddress, // Set keyboard type for email.
                    style: const TextStyle(
                      color: Color(0xFF276A7B),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText:
                          'Password', // Create a text input field for the user's password.
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
                          color: Color(0xff659d66),
                          width: 2.0,
                        ),
                      ),
                      //enabled border styling
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(
                              255, 156, 156, 158), // Change the border color here
                          width: 1.0, // Adjust the border width as needed
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF276A7B),
                    ),
                    obscureText: _obscureText, // Hide the password text.
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF276A7B),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex:0,
                child: RegButton(
                  width: 400,
                  height: 40,
                  text: 'Login',
                  textColor: Colors.white,
                  bgColor: const Color(0xFF276A7B),
                  onPressed: () async {
                    if (_validateForm()) {
                      _logInUser(context);
                    }
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
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
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
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
              Expanded(child: const SizedBox(height: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
