import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinikonek_project/screens/services/add_appointment.dart';

class CheckUpPage extends StatefulWidget {
  const CheckUpPage({super.key});

  @override
  _CheckUpPageState createState() => _CheckUpPageState();
}

//Check Up Form

class CheckUpForm {
  String? primaryDoctor; //nullable
  List<String> symptoms;
  List<String> medications;
  List<String> allergies;
  DateTime checkUpDate;
  bool approval = false;

  CheckUpForm({
    this.primaryDoctor,
    required this.symptoms,
    required this.medications,
    required this.allergies,
    required this.checkUpDate,
    this.approval = false,
  });
}

class _CheckUpPageState extends State<CheckUpPage> {
  List<CheckUpForm> appointments = [
    CheckUpForm(
      primaryDoctor: "Doctor Lewis",
      symptoms: ['cough', 'phlegm'],
      medications: ['Ambroxol', 'Symdex-D'],
      allergies: ['None'],
      checkUpDate: DateTime(2023, 12, 12),
      approval: true,
    ),
  ];

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

  bool showAgenda = true;

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
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFC6DBDC),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
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
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showAgenda = true;
                      });
                    },
                    child: Container(
                      color: showAgenda ? Color(0xFF276A7B) : Colors.grey,
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
                        showAgenda = false;
                      });
                    },
                    child: Container(
                      color: !showAgenda ? Colors.green : Colors.grey,
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
            Expanded(
              child: ListView(
                children: [
                  // Display Agenda or Appointments based on the selected state
                  showAgenda
                      ? Column(
                          children: [
                            // Add 6 containers for each day
                            for (int i = 0; i < 6; i++)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                height: 100,
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          days[i],
                                          style: TextStyle(
                                            color: Color(0xFF276A7B),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Expanded(
                                        child: Text(
                                          agenda[i],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF276A7B),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        )
                      : Column(
                          children: [
                            // Display appointments
                            for (CheckUpForm appointment in appointments)
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                margin: EdgeInsets.all(3),
                                child: Center(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Doctor: ${appointment.primaryDoctor}\n'
                                              'Symptoms: ${appointment.symptoms.join(', ')}\n'
                                              'Medications: ${appointment.medications.join(', ')}\n'
                                              'Allergies: ${appointment.allergies.join(', ')}\n',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF276A7B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'Date: ${DateFormat('MM/dd/yyyy').format(appointment.checkUpDate)}\n',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF276A7B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${appointment.approval != false ? 'Approved' : 'Pending'}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                appointment.approval != false
                                                    ? Colors.green
                                                    : Colors.yellow,
                                            shadows: [
                                              Shadow(
                                                color: Colors
                                                    .black, // Shadow color
                                                offset: Offset(1.0,
                                                    1.0), // Shadow offset
                                                blurRadius:
                                                    0.5, // Shadow blur radius
                                              ),
                                            ],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: showAgenda
          ? null
          : FloatingActionButton(
              onPressed: () async {
                // Navigate to the AddAppointmentPage and await the result
                final CheckUpForm newAppointment = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAppointmentPage()),
                );

                // Check if result is not null and update the appointments list
                if (newAppointment != null && newAppointment is CheckUpForm) {
                  setState(() {
                    appointments.add(newAppointment as CheckUpForm);
                  });
                }
              },
              backgroundColor: Color(0xFF276A7B),
              child: Icon(Icons.add),
            ),
    );
  }
}
