import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
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
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Hotlines",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF276A7B),
                ),
              ),
            ),
            SizedBox(height: 30),

            // First Hotline
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage('assets/police.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Police",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE6E7E8),
                            shadows: [
                              Shadow(
                                color: Colors.black, // Shadow color
                                offset: Offset(1.0, 1.0), // Shadow offset
                                blurRadius: 3.0, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Department",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE6E7E8),
                            shadows: [
                              Shadow(
                                color: Colors.black, // Shadow color
                                offset: Offset(1.0, 1.0), // Shadow offset
                                blurRadius: 3.0, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    GestureDetector(
                      onTap: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                            '+639123456789');
                      },
                      child: SizedBox(
                        width: 80,
                        height: 100,
                        child: Center(
                          child: Image.asset('assets/call3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Second Hotline
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage('assets/DSWD-Emblem.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "DSWD",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE6E7E8),
                        shadows: [
                          Shadow(
                            color: Colors.black, // Shadow color
                            offset: Offset(1.0, 1.0), // Shadow offset
                            blurRadius: 3.0, // Shadow blur radius
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 110),
                    GestureDetector(
                      onTap: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                            '+639123456789');
                      },
                      child: SizedBox(
                        width: 80,
                        height: 100,
                        child: Center(
                          child: Image.asset('assets/call3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            //Third Hotline
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage('assets/bfp.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bureau",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE6E7E8),
                            shadows: [
                              Shadow(
                                color: Colors.black, // Shadow color
                                offset: Offset(1.0, 1.0), // Shadow offset
                                blurRadius: 3.0, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "of Fire",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE6E7E8),
                            shadows: [
                              Shadow(
                                color: Colors.black, // Shadow color
                                offset: Offset(1.0, 1.0), // Shadow offset
                                blurRadius: 3.0, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 110),
                    GestureDetector(
                      onTap: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                            '+639123456789');
                      },
                      child: SizedBox(
                        width: 80,
                        height: 100,
                        child: Center(
                          child: Image.asset('assets/call3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
