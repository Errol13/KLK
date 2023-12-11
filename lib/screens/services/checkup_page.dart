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
  bool isDone = false;

  CheckUpForm({
    this.primaryDoctor,
    required this.symptoms,
    required this.medications,
    required this.allergies,
    required this.checkUpDate,
    this.approval = false,
    this.isDone = false,
  });
}

class _CheckUpPageState extends State<CheckUpPage> {
  List<CheckUpForm> appointments = [
    CheckUpForm(
      primaryDoctor: "Doctor Lewis",
      symptoms: ['cough', 'phlegm'],
      medications: ['Ambroxol', 'Symdex-D'],
      allergies: ['None'],
      checkUpDate: DateTime(2023, 15, 12),
      approval: true,
    ),
    CheckUpForm(
      primaryDoctor: "Doctor Lewis",
      symptoms: ['cough', 'phlegm'],
      medications: ['Ambroxol', 'Symdex-D'],
      allergies: ['None'],
      checkUpDate: DateTime(2023, 12, 12),
      approval: true,
      isDone: true,
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
  List<String> picURL = [
    'assets/senior.jpeg',
    'assets/immunization.jpg',
    'assets/general.jpg',
    'assets/immunization.jpg',
    'assets/dental.png',
    'assets/general.jpg'
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
                                height: 110,
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  // row for agenda
                                  child: Row(
                                    children: [
                                      // column for texts
                                      Expanded(
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
                                                  fontSize: 14,
                                                  color: Color(0xFF276A7B),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                          ],
                                        ),
                                      ),

                                      // Spacer to fill available space
                                      Spacer(),

                                      // picture
                                      Image.asset(
                                        picURL[i],
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.contain,
                                      ),
                                      
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
                                margin: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Align to the end
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 8), // Adjust the spacing

                                    // Column for appointment details
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          'Doctor: ${appointment.primaryDoctor}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF276A7B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Symptoms: ${appointment.symptoms.join(', ')}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF276A7B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Medications: ${appointment.medications.join(', ')}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF276A7B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Allergies: ${appointment.allergies.join(', ')}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF276A7B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Date: ${DateFormat('MM/dd/yyyy').format(appointment.checkUpDate)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF276A7B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          appointment.isDone
                                              ? 'Done'
                                              : appointment.approval
                                                  ? 'Approved'
                                                  : 'Pending',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: appointment.isDone
                                                ? Colors
                                                    .grey // Change the color for 'Done'
                                                : appointment.approval
                                                    ? Colors.green
                                                    : Colors.yellow,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black,
                                                offset: Offset(1.0, 1.0),
                                                blurRadius: 0.5,
                                              ),
                                            ],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    // PopupMenuButton for "Edit" and "Delete" options
                                    PopupMenuButton<String>(
                                      onSelected: (value) {
                                        // Handle menu item selection
                                        if (value == 'edit') {
                                          // Handle edit action
                                        } else if (value == 'delete') {
                                          // Handle delete action
                                        }
                                      },
                                      itemBuilder: (BuildContext context) {
                                        // Conditionally include the "Edit" option based on isDone status
                                        return appointment.isDone
                                            ? [
                                                PopupMenuItem<String>(
                                                  value: 'delete',
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ]
                                            : [
                                                PopupMenuItem<String>(
                                                  value: 'edit',
                                                  child: Text('Edit'),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: 'delete',
                                                  child: Text('Delete'),
                                                ),
                                              ];
                                      },
                                    ),
                                  ],
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
                    // Insert the new appointment at the beginning of the list
                    appointments.insert(0, newAppointment);
                  });
                }
              },
              backgroundColor: Color(0xFF276A7B),
              child: Icon(Icons.add),
            ),
    );
  }
}
