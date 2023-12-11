import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klinikonek_project/screens/services/admin_medicine.dart';

class MedicinePage extends StatefulWidget {
  MedicinePage({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  _MedicinePageState createState() => _MedicinePageState();
}

class Medicine {
  final String name;
  final int quantity;
  final String imageUrl;

  Medicine(this.name, this.quantity, this.imageUrl);
}

List<Medicine> medicines = [
  Medicine("Paracetamol Biogesic", 10, 'assets/biogesic.png'),
  Medicine("Bioflu", 5, 'assets/bioflu.jpg'),
  Medicine("Decolgen Forte", 15, 'assets/dedcolgen.jpg'),
  Medicine("Neozep Forte", 10, 'assets/neozep.jpg'),
  Medicine("TEMPRA Paracetamol", 5, 'assets/tempra.png'),
  Medicine("Medicol Advance", 15, 'assets/medicol.jpg'),
  Medicine("Dolfenal", 10, 'assets/dolfenal.jpg'),
  Medicine("Diatabs", 0, 'assets/diatabs.jpg'),
  Medicine("Tuseran Forte", 15, 'assets/tuseran.jpg'),
];

class _MedicinePageState extends State<MedicinePage> {
  final TextEditingController _searchController = TextEditingController();
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('Users')
        .doc(widget.user?.uid)
        .get();

    if (snapshot.exists) {
      isAdmin = snapshot.data()?['isAdmin'] ?? false;

      if (mounted) {
        setState(() {});
      }
    }
  }

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
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminMedicine(),
                ));
              },
              backgroundColor: Color(0xFF276A7B),
              child: Icon(Icons.add),
            )
          : null,
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
                    Expanded(child: SizedBox(width: 3)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Available Medicines",
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
                      width: 80,
                      height: 100,
                      child: Center(
                        child: Image.asset('assets/pill.png'),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    filterMedicines(value);
                  },
                  onSubmitted: (value) {
                    filterMedicines(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        filterMedicines('');
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
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Scrollbar(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: medicines.length,
                    itemBuilder: (context, index) {
                      Medicine medicine = medicines[index];
                      bool isAvailable = medicine.quantity > 0;

                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(medicine.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              flex: 2,
                              child: Image.asset(medicine.imageUrl,
                                  width: 60, height: 60),
                            ),
                            if (isAvailable)
                              Expanded(
                                flex: 0,
                                child: Column(
                                  children: [
                                    Text("Available:"),
                                    Text(
                                      "${medicine.quantity} pieces",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              )
                            else
                              Expanded(
                                flex: 0,
                                child: Text(
                                  "Not Available",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterMedicines(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, show all medicines
        medicines = [...medicines];
      } else {
        // Filter medicines based on the search query
        medicines = medicines
            .where((medicine) =>
                medicine.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }
}
