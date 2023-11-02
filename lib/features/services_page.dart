import 'package:flutter/material.dart';
import 'bottomnavbar.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
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
                "Services",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF276A7B),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Appointment
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
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
                          "Check-up",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                        Text(
                          "Schedule",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    SizedBox(
                      width: 100,
                      height: 120,
                      child: Center(
                        child: Image.asset('calendar.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Medicine
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Medicines",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF276A7B),
                      ),
                    ),
                    SizedBox(width: 60),
                    SizedBox(
                      width: 100,
                      height: 120,
                      child: Center(
                        child: Image.asset('pill.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Emergency Vehicles
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
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
                          "Emergency",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                        Text(
                          "Vehicles",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    SizedBox(
                      width: 100,
                      height: 120,
                      child: Center(
                        child: Image.asset('ambulance.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
