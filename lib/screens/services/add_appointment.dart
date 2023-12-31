import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/services/checkup_page.dart';
import 'package:intl/intl.dart';
import 'package:klinikonek_project/screens/sign_in_up/splash_page.dart';

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

  @override
  void dispose() {
    // Dispose of controllers when the widget is removed from the widget tree
    primaryDoctorController.dispose();
    symptomsController.dispose();
    medicationsController.dispose();
    allergiesController.dispose();
    _checkUpDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Check if any of the required fields is empty
        if (primaryDoctorController.text.isEmpty ||
            symptomsController.text.isEmpty ||
            medicationsController.text.isEmpty ||
            allergiesController.text.isEmpty ||
            _checkUpDateController.text.isEmpty) {
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
                  hintText: 'e.g., peanuts, chicken',
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
                      _checkUpDateController.text.isEmpty) {
                    // Show a dialog if any field is empty
                    _errorNotice('Fill all the fields');
                  } else {
                    // If all fields are filled, send the CheckUpForm data back
                    CheckUpForm checkUpForm = CheckUpForm(
                      primaryDoctor: primaryDoctorController.text,
                      symptoms: symptomsController.text.split(','),
                      medications: medicationsController.text.split(','),
                      allergies: allergiesController.text.split(','),
                      checkUpDate: DateTime.parse(_checkUpDateController.text),
                      approval: false,
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

  // Method to show the dialog when fields are empty
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime lastSelectableDate =
        currentDate.add(Duration(days: 30)); // Limit to one month

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: lastSelectableDate,
      selectableDayPredicate: (DateTime date) {
        // Disable yesterday's dates and allow only succeeding dates within one month
        return date.isAfter(currentDate.subtract(Duration(days: 1))) &&
            date.isBefore(lastSelectableDate);
      },
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
