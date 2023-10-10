import 'package:flutter/material.dart';
import 'package:klinikonek_project/features/home_page.dart';
import 'splash_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true; // for the password's eye icon function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), //padding is 16
        child: Column( //create elements vertically
          mainAxisAlignment: MainAxisAlignment.center, //children will be aligned center in y-axis
          crossAxisAlignment: CrossAxisAlignment.center, //children will be aligned center in x-axis
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
            const SizedBox(height: 20), //used as margin-like between widgets with the height 20
            SizedBox(
              height: 200,
              width: 100,
              child: Center(
                child: Image.asset(
                  'assets/Logo.png',
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container( //group things and make style properties
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
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
                    borderSide: BorderSide(
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: const Color(0xFF276A7B),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Color(0xff276A7B),
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
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFFA7C7E7),
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xFF276A7B),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  color: const Color(0xFF276A7B),
                ),
                obscureText: _obscureText,
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
                 MaterialPageRoute(builder: (context) => HomePage()),
                 );
              },
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
            ),
          ],
        ),
      ),
    );
  }
}
