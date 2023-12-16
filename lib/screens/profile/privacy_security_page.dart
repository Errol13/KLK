import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/sign_in_up/login_page.dart';

class PSPage extends StatefulWidget {
  const PSPage({super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _PSPageState createState() => _PSPageState();
}

class _PSPageState extends State<PSPage> {
  bool _obscureText = true;

  //delete account
  void deleteAccount() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.delete();
        
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      } else {
        print('No user signed in.');
      }
    } on FirebaseAuthException catch (e) {
      if(e.code=='requires-recent-login'){
        _errorNotice("requires re-login");
      }
      else{
      _errorNotice('$e');
      }
    }
  }

  //dialog
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

  void _show() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext ctx) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            backgroundColor:
                Color(0xFFC6DBDC).withOpacity(0.9), // Adjust the opacity here
            title: Text(
              'Delete Confirmation',
              style: TextStyle(
                color: Color(0xFF276A7B),
              ),
            ),
            content: Text('Are you sure you want to delete your account?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(); // Close the dialog
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:Color.fromARGB(255, 130, 130, 131), 
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  deleteAccount();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(
                      255,
                      202,
                      41,
                      20,
                    ), // Define text styles.
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Privacy and Security",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF276A7B),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Old Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF276A7B),
                      )),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
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
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('New Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF276A7B),
                      )),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
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
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Confirm New Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF276A7B),
                      )),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
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
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      // Add your button's click logic here
                      // For example, you can navigate to another screen or perform an action
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF276A7B),
                    ),
                    child: const Text('Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ))),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: _show,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 199, 37, 32),
                    ),
                    child: const Text('Delete Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
