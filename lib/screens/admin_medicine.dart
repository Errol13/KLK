import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/medicines(services)_page.dart';
import 'first_page.dart';

class AdminMedicine extends StatefulWidget {
  const AdminMedicine(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _AdminMedicineState createState() => _AdminMedicineState();
}

class _AdminMedicineState extends State<AdminMedicine> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Add Medicine",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF276A7B),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        iconSize: 50,
                        icon: Icon(Icons.add_a_photo_rounded))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Medicine Name',
                          labelStyle: const TextStyle(
                            color: Color(0xff276A7B),
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff659d66),
                              width: 1.0,
                            ),
                          ),

                          //enabled border styling
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Dosage',
                          labelStyle: const TextStyle(
                            color: Color(0xff276A7B),
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff659d66),
                              width: 1.0,
                            ),
                          ),

                          //enabled border styling
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Description (Optional)',
                          labelStyle: const TextStyle(
                            color: Color(0xff276A7B),
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff659d66),
                              width: 1.0,
                            ),
                          ),

                          //enabled border styling
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 156, 156,
                                  158), // Change the border color here
                              width: 1.0, // Adjust the border width as needed
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF276A7B),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      child: FloatingActionButton.small(
                        onPressed: _decrementCounter,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.remove,
                            color: Color.fromRGBO(99, 92, 92, 1)),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Expanded(
                      child: Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FloatingActionButton.small(
                        onPressed: _incrementCounter,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Color.fromRGBO(99, 92, 92, 1),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // Add your button's click logic here
                        // For example, you can navigate to another screen or perform an action
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MedicinePage(), // Replace with the actual MedicinePage.
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF276A7B),
                      ),
                      child: const Text('Save',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ))),
                  ElevatedButton(
                      onPressed: () {
                        // Add your button's click logic here
                        // For example, you can navigate to another screen or perform an action
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MedicinePage(), // Replace with the actual MedicinePage.
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 199, 37, 32),
                      ),
                      child: const Text('Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
