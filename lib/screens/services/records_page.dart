import 'package:flutter/material.dart';

class MedicalRecordPage extends StatefulWidget {
  @override
  State<MedicalRecordPage> createState() => _MedicalRecordPageState();
}

class _MedicalRecordPageState extends State<MedicalRecordPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Patient> patients = [
    Patient(firstName: 'Elsa', lastName: 'Arandelle', age: 26),
    Patient(firstName: 'Ana', lastName: 'Ana', age: 25),
    Patient(firstName: 'Spongebob', lastName: 'Squarepants', age: 40),
    Patient(firstName: 'Sam', lastName: 'Smith', age: 20),
    Patient(firstName: 'Zed', lastName: 'Zed', age: 10),
    Patient(firstName: 'Mickey', lastName: 'Mouse', age: 90),
    Patient(firstName: 'Bugs', lastName: 'Bunny', age: 81),
    Patient(firstName: 'Homer', lastName: 'Simpson', age: 39),
    Patient(firstName: 'Lisa', lastName: 'Simpson', age: 38),
    Patient(firstName: 'Aang', lastName: 'Avatar', age: 112),
    Patient(firstName: 'Dora', lastName: 'Explorer', age: 12),
    Patient(firstName: 'Goku', lastName: 'Saiyan', age: 35),
    Patient(firstName: 'Naruto', lastName: 'Uzumaki', age: 20),
    Patient(firstName: 'Tom', lastName: 'Cat', age: 80),
    Patient(firstName: 'Sailor', lastName: 'Moon', age: 16),
    Patient(firstName: 'Pikachu', lastName: 'Pokemon', age: 25),
    Patient(firstName: 'Gon', lastName: 'Freecss', age: 12),
    Patient(firstName: 'Saitama', lastName: 'One', age: 25),
    Patient(firstName: 'Velma', lastName: 'Dinkley', age: 28),
    Patient(firstName: 'Dexter', lastName: 'Laboratory', age: 10),
    Patient(firstName: 'Finn', lastName: 'Adventure Time', age: 15),
    Patient(firstName: 'BoJack', lastName: 'Horseman', age: 52),
    Patient(firstName: 'Rick', lastName: 'Sanchez', age: 60),
    Patient(firstName: 'Morty', lastName: 'Smith', age: 14),
    Patient(firstName: 'Edward', lastName: 'Elric', age: 18),
    Patient(firstName: 'Sakura', lastName: 'Cardcaptor', age: 13),
    Patient(firstName: 'Natsu', lastName: 'Dragneel', age: 23),
    Patient(firstName: 'Scooby', lastName: 'Doo', age: 7),
    Patient(firstName: 'Shaggy', lastName: 'Rogers', age: 22),
    Patient(firstName: 'Frodo', lastName: 'Baggins', age: 33),
    Patient(firstName: 'Daffy', lastName: 'Duck', age: 80),
    Patient(firstName: 'Tweety', lastName: 'Bird', age: 75),
    Patient(firstName: 'Asterix', lastName: 'Gaul', age: 35),
  ];

  List<Patient> filteredPatients = [];

  @override
  void initState() {
    super.initState();
    filterPatients('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E7E8),
      appBar: AppBar(
        title: Text(
          "Medical Records",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff276A7B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                filterPatients(value);
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    filterPatients('');
                  },
                ),
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 156, 156, 158),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 156, 156, 158),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 12.0,
                  columns: [
                    DataColumn(
                        label: Text(
                      'ID',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff276A7B),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'Last Name',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff276A7B),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff276A7B),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'File',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff276A7B),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'Options',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff276A7B),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ],
                  rows: [
                    for (var patient in filteredPatients)
                      DataRow(
                        color: MaterialStateColor.resolveWith(
                          (states) {
                            return Colors
                                .white; // Set the default background color to white
                          },
                        ),
                        cells: [
                          DataCell(Text((filteredPatients.indexOf(patient) + 1)
                              .toString())),
                          DataCell(Text(
                            patient.lastName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(patient.firstName)),
                          DataCell(Icon(
                            Icons.insert_drive_file,
                            color: Colors.orangeAccent,
                          )),
                          DataCell(
                            PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == 'delete') {
                                  print('Deleting patient ${patient.lastName}');
                                }
                              },
                              itemBuilder: (context) {
                                return ['Delete'].map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: 'delete',
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void filterPatients(String query) {
    setState(() {
      filteredPatients = patients
          .where((patient) =>
              patient.firstName.toLowerCase().contains(query.toLowerCase()) ||
              patient.lastName.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Sort the filteredPatients alphabetically based on lastName
      filteredPatients.sort((a, b) => a.lastName.compareTo(b.lastName));
    });
  }
}

class Patient {
  final String firstName;
  final String lastName;
  final int age;

  Patient({
    required this.firstName,
    required this.lastName,
    required this.age,
  });
}
