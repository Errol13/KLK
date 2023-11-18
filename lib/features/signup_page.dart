/* Authored by: Phoebe Marion B. Castro
Company: Lockey Inc.
Project: KLINIKONEK
Feature: [KLK-002] Registration Page(Sign Up)
Description: This is the page where the users will need to register or sign up.
 */

import 'package:flutter/material.dart';
import 'first_page.dart';
import 'splash_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText =
      true; // Initialize a boolean variable for password visibility toggle.

  TextEditingController _birthdateController = TextEditingController();

//Birthdate Field Show DateTime
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _handleDateSelection(picked);
    }
  }

  void _handleDateSelection(DateTime pickedDate) {
    setState(() {
      _birthdateController.text =
          pickedDate.toString(); // You can format the date as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Create a Scaffold for the page structure.
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the content.
        child: Column(
          //create elements vertically
          mainAxisAlignment: MainAxisAlignment
              .center, //children will be aligned center in y-axis
          crossAxisAlignment: CrossAxisAlignment
              .center, //children will be aligned center in x-axis
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 50),
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
            const SizedBox(
                height:
                    30), //used as margin-like between widgets with the height 20 // Add spacing.
            SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Image.asset(
                  'assets/Logo.png', // Display an image (logo).
                ),
              ),
            ),
            const SizedBox(height: 60),

            //sign up fields
            Expanded(
              child: SizedBox(
                height: 40,
                width: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Last Name',
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

                          //enabled border styling
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
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
                          //enabled border styling
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'M.I.',
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
                          //enabled border styling
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Birthdate
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 40,
                width: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _selectDate(
                              context); // Display the date picker on tap
                        },
                        child: AbsorbPointer(
                          child: TextField(
                            controller: _birthdateController,
                            decoration: InputDecoration(
                              labelText: 'Birth Date',
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
                              //enabled border styling
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 156, 156,
                                      158), // Change the border color here
                                  width:
                                      1.0, // Adjust the border width as needed
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Email Field
            SizedBox(height: 10), // Add spacing.
            Expanded(
              child: SizedBox(
                height: 40,
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    labelText:
                        'Email', // Create a text input field for the user's email.
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
                    //enabled border styling
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(
                            255, 156, 156, 158), // Change the border color here
                        width: 1.0, // Adjust the border width as needed
                      ),
                    ),
                  ),
                  keyboardType: TextInputType
                      .emailAddress, // Set keyboard type for email.
                  style: const TextStyle(
                    color: Color(0xFF276A7B),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10), // Add spacing.
            Expanded(
              child: SizedBox(
                height: 40,
                width: 400,
                child: TextField(
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
                      borderRadius: BorderRadius.circular(12),
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
                  ),
                  style: const TextStyle(
                    color: Color(0xFF276A7B),
                  ),
                  obscureText: _obscureText, // Hide the password text.
                ),
              ),
            ),

            //Confirm Password
            const SizedBox(height: 10), // Add spacing.
            Expanded(
              child: SizedBox(
                height: 40,
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    labelText:
                        'Confirm Password', // Create a text input field for the user's password.
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: const TextStyle(
                      color: Color(0xff276A7B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
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
                  ),
                  style: const TextStyle(
                    color: Color(0xFF276A7B),
                  ),
                  obscureText: _obscureText, // Hide the password text.
                ),
              ),
            ),

            const SizedBox(height: 30), // Add spacing.
            Expanded(
              child: RegButton(
                width: 400,
                height: 40,
                text: 'Create account', // Display a Sign-Up button.
                textColor: Colors.white,
                bgColor: const Color(0xFF276A7B),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const FirstPage()), // Navigate to the Home page.
                  );
                },
              ),
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
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginPage()), // Navigate to the Login page.
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
