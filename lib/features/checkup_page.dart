import 'package:flutter/material.dart';
import 'package:klinikonek_project/features/add_appointment.dart';

class CheckUpPage extends StatefulWidget {
  const CheckUpPage({super.key});

  @override
  _CheckUpPageState createState() => _CheckUpPageState();
}

//Check Up Form

class CheckUpForm {
  final String name;
  final int age;
  final String sex;
  final String address;
  final String phoneNumber;
  final String? occupation; //nullable
  final String maritalStatus;
  final String? primaryDoctor; //nullable
  final List<String> symptoms;
  final List<String> medications;
  final List<String> allergies;
  final DateTime checkUpDate;
  final String? approval;

  CheckUpForm({
    required this.name,
    required this.age,
    required this.sex,
    required this.address,
    required this.phoneNumber,
    this.occupation,
    required this.maritalStatus,
    this.primaryDoctor,
    required this.symptoms,
    required this.medications,
    required this.allergies,
    required this.checkUpDate,
    this.approval,
  });
}

class _CheckUpPageState extends State<CheckUpPage> {
  List<String> appointments = []; // List to store appointments
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
   List<String> agenda = [
    "Senior Citizen Check-up",
    "Immunization",
    "General Check-up",
    "Immunization",
    "Dental Care",
    "General Check-up"
  ];

  // Index to track the current page (Agenda or Appointments)
  int _selectedColumn = 0; // 0 for Agenda, 1 for Appointments

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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFC6DBDC),
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
                          "See Schedule",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 100,
                      height: 120,
                      child: Center(
                        child: Image.asset('assets/calendar.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            //Use IndexedStack for 2 columns
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColumn = 0; //agenda
                      });
                    },
                    child: Container(
                      color: _selectedColumn == 0
                          ? Colors.blue
                          : Colors
                              .grey, //color selected and color when not selected
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "Agenda",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColumn = 1;
                      });
                    },
                    child: Container(
                      color: _selectedColumn == 1
                          ? Colors.green
                          : Colors
                              .grey, //color selected and color when not selected
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "Appointments",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Use IndexedStack to switch between columns
            IndexedStack(
              index: _selectedColumn,
              children: [
                // Agenda Column
                Column(
                  children: [
                    SizedBox(height: 5),
                
                    // Add 6 containers for each day
                    for (int i = 0; i < 6; i++)
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Text(
                                  days[i],
                                  style: TextStyle(
                                    color: Color(0xFF276A7B),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          
                              SizedBox(height: 3),
                          
                              Expanded(
                                child: Text(
                                  agenda[i],
                                  style: TextStyle(
                                    fontSize: 6,
                                    color:Color(0xFF276A7B),
                                  ),
                                ),
                              ), 
                            SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),

                // Appointments Column
                Column(
                  children: [
                    SizedBox(height: 10),
                    // Display appointments
                    for (String appointment in appointments)
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            appointment,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: _selectedColumn == 1
          ? FloatingActionButton(
              onPressed: () async {
                // Navigate to the AddAppointmentPage and await the result
                final CheckUpForm newAppointment = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAppointmentPage()),
                );

                // Check if result is not null and update the appointments list
                if (newAppointment != null && newAppointment is CheckUpForm) {
                  setState(() {
                    appointments.add(newAppointment as String);
                  });
                }
              },
              backgroundColor: Color(0xFF276A7B),
              child: Icon(Icons.add),
            )
          : null, // set to null as to not display it in Agenda Column
    );
  }
}
