import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/checkup_page.dart';

class AddAppointmentPage extends StatefulWidget {
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController primaryDoctorController = TextEditingController();
  TextEditingController symptomsController = TextEditingController();
  TextEditingController medicationsController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController checkUpDateController = TextEditingController();
  TextEditingController approvalController = TextEditingController();

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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            //get the name from the user table
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),

            //get the age from birthdate through calculation
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),

            //Sex
            TextField(
              controller: sexController,
              decoration: InputDecoration(labelText: 'Sex'),
            ),

            //Address
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),

            //Phone Number
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),

            //Occupation
            TextField(
              controller: occupationController,
              decoration: InputDecoration(labelText: 'Occupation'),
            ),

            //Marital Status
            TextField(
              controller: maritalStatusController,
              decoration: InputDecoration(labelText: 'Marital Status'),
            ),

            //Primary Doctor (dont know if we should include this)
            TextField(
              controller: primaryDoctorController,
              decoration: InputDecoration(labelText: 'Primary Doctor'),
            ),

            //Symptoms
            TextField(
              controller: symptomsController,
              decoration:
                  InputDecoration(labelText: 'Symptoms (comma-separated)'),
            ),

            //Medications
            TextField(
              controller: medicationsController,
              decoration:
                  InputDecoration(labelText: 'Medications (comma-separated)'),
            ),

            //Allergies
            TextField(
              controller: allergiesController,
              decoration:
                  InputDecoration(labelText: 'Allergies (comma-separated)'),
            ),

            //Check-Up Date
            TextField(
              controller: checkUpDateController,
              decoration: InputDecoration(labelText: 'Check-Up Date'),
              keyboardType: TextInputType.datetime,
            ),

            //Approval
            TextField(
              controller: approvalController,
              decoration: InputDecoration(labelText: 'Approval'),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                CheckUpForm checkUpForm = CheckUpForm(
                  name: nameController.text,
                  age: int.parse(ageController.text),
                  sex: sexController.text,
                  address: addressController.text,
                  phoneNumber: phoneNumberController.text,
                  occupation: occupationController.text,
                  maritalStatus: maritalStatusController.text,
                  primaryDoctor: primaryDoctorController.text,
                  symptoms: symptomsController.text.split(','),
                  medications: medicationsController.text.split(','),
                  allergies: allergiesController.text.split(','),
                  checkUpDate: DateTime.parse(checkUpDateController.text),
                  approval: approvalController.text,
                );

                // Pass the checkUpForm data back to CheckUpPage
                Navigator.pop(context, checkUpForm);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
