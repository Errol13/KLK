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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Medical Records"),
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
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
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
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Last Name')),
                    DataColumn(label: Text('First Name')),
                    DataColumn(label: Text('File')),
                    DataColumn(label: Text('Options')),
                  ],
                  rows: [
                    for (var patient in filteredPatients)
                      DataRow(
                        cells: [
                          DataCell(Text((filteredPatients.indexOf(patient) + 1).toString())),
                          DataCell(Text(patient.lastName)),
                          DataCell(Text(patient.firstName)),
                          DataCell(Icon(Icons.insert_drive_file)),
                          DataCell(
                            PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == 'delete') {
                                  // Handle delete action
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
