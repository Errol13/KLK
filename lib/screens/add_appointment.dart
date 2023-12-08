import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/checkup_page.dart';
import 'package:intl/intl.dart';
import 'package:klinikonek_project/screens/splash_page.dart';

class AddAppointmentPage extends StatefulWidget {
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  TextEditingController primaryDoctorController = TextEditingController();
  TextEditingController symptomsController = TextEditingController();
  TextEditingController medicationsController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController _checkUpDateController = TextEditingController();
  TextEditingController approvalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Check if any of the required fields is empty
        if (primaryDoctorController.text.isEmpty ||
            symptomsController.text.isEmpty ||
            medicationsController.text.isEmpty ||
            allergiesController.text.isEmpty ||
            _checkUpDateController.text.isEmpty ||
            approvalController.text.isEmpty) {
          // If any field is empty, allow the back navigation
          return true;
        } else {
          // If all fields are filled, show a confirmation dialog
          // and handle the navigation accordingly
          bool? confirmExit = await showExitConfirmationDialog(context);
          return confirmExit ??
              false; // Default to false if user dismisses the dialog
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFE6E7E8),
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset('assets/Logo.png', height: 30, width: 30),
              SizedBox(width: 10),
              Text(
                "Klinikonek",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff276A7B),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Appointment Form',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff276A7B),
                ),
              ),

              SizedBox(height: 20),

              //Primary Doctor (don't know if we should include this)
              TextField(
                controller: primaryDoctorController,
                decoration: InputDecoration(
                  labelText: 'Primary Doctor',
                  labelStyle: TextStyle(
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 1.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),
              SizedBox(height: 20),

              //Symptoms
              TextField(
                controller: symptomsController,
                decoration: InputDecoration(
                  labelText: 'Symptoms',
                  hintText: 'e.g., fever, headache',
                  labelStyle: TextStyle(
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 1.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),

              SizedBox(height: 20),

              //Medications
              TextField(
                controller: medicationsController,
                decoration: InputDecoration(
                  labelText: 'Medications',
                  hintText: 'e.g., painkillers, antibiotics',
                  labelStyle: TextStyle(
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 1.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),
              SizedBox(height: 20),

              //Allergies
              TextField(
                controller: allergiesController,
                decoration: InputDecoration(
                  labelText: 'Allergies',
                  labelStyle: TextStyle(
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 1.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),
              SizedBox(height: 20),

              //Check-Up Date
              TextField(
                controller: _checkUpDateController,
                onTap: () => _selectDate(context),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Check-Up Date',
                  labelStyle: TextStyle(
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 1.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),
              SizedBox(height: 20),

              //Approval
              TextField(
                controller: approvalController,
                decoration: InputDecoration(
                  labelText: 'Approval',
                  labelStyle: TextStyle(
                    color: Color(0xff276A7B),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xff659d66),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 1.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),

              SizedBox(height: 20),

              //add appointment
              RegButton(
                //call the class RegButton
                width: 400,
                height: 40,
                text: 'Add',
                textColor: Colors.white,
                bgColor: const Color(0xFF276A7B),
                onPressed: () {
                  // Check if any of the required fields is empty
                  if (primaryDoctorController.text.isEmpty ||
                      symptomsController.text.isEmpty ||
                      medicationsController.text.isEmpty ||
                      allergiesController.text.isEmpty ||
                      _checkUpDateController.text.isEmpty ||
                      approvalController.text.isEmpty) {
                    // If any field is empty, simply pop the screen without sending data
                    Navigator.pop(context);
                  } else {
                    // If all fields are filled, send the CheckUpForm data back
                    CheckUpForm checkUpForm = CheckUpForm(
                      primaryDoctor: primaryDoctorController.text,
                      symptoms: symptomsController.text.split(','),
                      medications: medicationsController.text.split(','),
                      allergies: allergiesController.text.split(','),
                      checkUpDate: DateTime.parse(_checkUpDateController.text),
                      approval: approvalController.text,
                    );

                    // Pass the checkUpForm data back to CheckUpPage
                    Navigator.pop(context, checkUpForm);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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
    final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    setState(() {
      _checkUpDateController.text = formattedDate;
    });
  }

  Future<bool?> showExitConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Discard Changes?'),
          content: Text(
              'Are you sure you want to leave without saving your changes?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, true), // Allow exit
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(context, false), // Stay on the page
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
