import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:klinikonek_project/model/user_model.dart';
import 'package:klinikonek_project/screens/profile/account_page.dart';
import 'package:klinikonek_project/screens/profile/privacy_security_page.dart';
import 'package:klinikonek_project/screens/profile/report_page.dart';
import 'notif_page.dart';
import 'package:klinikonek_project/screens/sign_in_up/login_page.dart';
import 'package:provider/provider.dart';
import 'package:klinikonek_project/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? currentUser; // Variable to store the current user's data

  @override
  void initState() {
    super.initState();
    fetchCurrentUserData();
  }

  Future<void> fetchCurrentUserData() async {
    // Fetch data for the current user from Firestore
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('Users')
        .doc(widget.user?.uid)
        .get();

    if (snapshot.exists) {
      // Convert the document data to UserData
      currentUser = UserModel.fromJson(snapshot.data()!);

      // Update the state to trigger a rebuild
      if (mounted) {
        setState(() {});
      }
    }
  }

  //confirmation
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Logout Confirmation',
          style: TextStyle(
            color: Color(0xFF276A7B),
          ),
        ),
        content: Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Close the dialog
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromARGB(255, 156, 156, 158), // Define text styles.
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance
                    .signOut(); // Perform logout using FirebaseAuth
                Navigator.of(dialogContext).pop(); // Close the dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } catch (e) {
                print('Error signing out: $e');
                // Handle error if needed
              }
            },
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF276A7B), // Define text styles.
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                child: Row(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF276A7B),
                  ),
                ),
              ],
            )),

            SizedBox(height: 30),
            //edit profile pic (needs to be a button WIP)

            Expanded(
              flex: 5,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentUser == null
                    ? CircularProgressIndicator(
                        color: Color(0xFF276A7B),
                      ) // Loading indicator
                    : Text(
                        currentUser!.firstName + " " + currentUser!.lastName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF276A7B),
                        ),
                      ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentUser == null
                    ? CircularProgressIndicator(
                        color: Color(0xFF276A7B),
                      ) // Loading indicator
                    : Text(
                        currentUser!.email,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF276A7B),
                        ),
                      ),
              ],
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AccountPage(),
                        ));
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Icon(
                            Icons.navigate_next,
                            color: Color(0xFF276A7B),
                          ),
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ));
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Icon(
                            Icons.navigate_next,
                            color: Color(0xFF276A7B),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PSPage(),
                        ));
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Icon(
                            Icons.navigate_next,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                        child: Image.asset('assets/Error.png'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Report a problem",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReportPage(),
                        ));
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Icon(
                            Icons.navigate_next,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _showLogoutConfirmationDialog(context);
                                    },
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(123, 39, 39, 1),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
