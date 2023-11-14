import 'package:flutter/material.dart';
import 'first_page.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

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
  // Add more medicines with different information
];

class _MedicinePageState extends State<MedicinePage> {
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
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Make children fill the width
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
                      width: 100,
                      height: 120,
                      child: Center(
                        child: Image.asset('assets/pill.png'),
                      ),
                    ),
                  ],
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
                      crossAxisCount: 2, // Display two boxes per row
                    ),
                    itemCount: medicines.length,
                    itemBuilder: (context, index) {
                      Medicine medicine = medicines[index];
                      bool isAvailable = medicine.quantity >
                          0; // Check if medicine is available

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
                              child: Text(medicine.name),
                            ),
                            Image.asset(medicine.imageUrl,
                                width: 60, height: 60),
                            SizedBox(height: 20),
                            if (isAvailable)
                              Column(
                                children: [
                                  Text("Available:"),
                                  Text(
                                    "${medicine.quantity} pieces",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              )
                            else
                              Text(
                                "Not Available",
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
