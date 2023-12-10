import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/sign_in_up/splash_page.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  //for the reset of password

  Future _resetPassword() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Validate email before sending reset email
      if (!EmailValidator.validate(_emailController.text.trim())) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Invalid Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ),
        );
        Navigator.pop(context);
        return;
      }
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Password Reset Email Sent'),
        ),
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Invalid Email'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text('Forgot Password',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff276A7B),
              fontWeight: FontWeight.bold,
            )),
      ),
      backgroundColor: Color(0xFFE6E7E8),

      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Enter your email address.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff276A7B),
                ),
              ),
            ),
            SizedBox(height: 20),

            //email textfield
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Color(0xff276A7B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),

                //style before clicked
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 63, 115, 167),
                    width: 2.0,
                  ),
                ),

                //style when clicked
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Color(0xff276A7B),
                    width: 1.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Color(0xff276A7B),
              ),
            ),
            SizedBox(height: 20),
            RegButton(
              //call the class RegButton
              width: 400,
              height: 40,
              text: 'Reset Password',
              textColor: Colors.white,
              bgColor: const Color(0xFF276A7B),
              onPressed: () {
                _resetPassword();
                // Navigator.push(//move to the next page or different screen
                //   context,
                //   MaterialPageRoute(builder: (context) => const LoginPage()
                //   ), //the route it should follow when clicked
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
