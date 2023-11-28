import 'package:flutter/material.dart';
import 'package:klinikonek_project/features/login_page.dart';
import 'first_page.dart';
import 'notif_page.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/Logo.png', height: 30, width: 30),
            SizedBox(width: 10),
            const Text(
              "Klinikonek",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF276A7B),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Make children fill the width
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF276A7B),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            //edit profile pic (needs to be a button WIP)
             Expanded(
              flex:5,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Julia Mario",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF276A7B),
                    ),
                  )
                ],
              ),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "juliamario@mail.com",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF276A7B),
                    ),
                  )
                ],
              ),
            ),
            //account (needs to be a button WIP)
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Image.asset('assets/account_icon.png'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Icon(
                          Icons.navigate_next,
                          color: const Color.fromRGBO(167, 199, 231, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Notification (needs to be a button WIP)
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Image.asset('assets/Bell.png'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Notification",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your button's click logic here
                        // For example, you can navigate to another screen or perform an action
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              NotificationPage(), // Replace with the actual MedicinePage.
                        ));
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Icon(
                            Icons.navigate_next,
                            color: Color.fromRGBO(167, 199, 231, 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Privacy  & Security (needs to be a button WIP)
            SizedBox(height: 10),

            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Image.asset('assets/Security.png'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Privacy & Security",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Icon(
                          Icons.navigate_next,
                          color: const Color.fromRGBO(167, 199, 231, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your navigation logic here
                // For instance, navigate back to the login page
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      LoginPage(), // Replace with the actual MedicinePage.
                ));
              },
              child: Expanded(
                child: SizedBox(
                  height: 100,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(123, 39, 39, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
