import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/services/admin_medicine.dart';

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
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your button's click logic here
          // For example, you can navigate to another screen or perform an action
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                AdminMedicine(), // Replace with the actual MedicinePage.
          ));
        },
        backgroundColor: Color(0xFF276A7B),
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Make children fill the width
          children: [
            //Available Medicine Banner
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

            //searchbar
            Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 2.0,
                    ),
                  ),
                  //enabled border styling
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 156, 156, 158),
                      width: 1.0, // Adjust the border width as needed
                    ),
                  ),
                ),
              ),
            ),

            //List of Medicines
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
}
