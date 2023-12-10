import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  String selectedMaritalStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Account",
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF276A7B),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Age',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Location',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Sex',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Blood Type',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Marital Status',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Occupation',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      // Add your button's click logic here
                      // For example, you can navigate to another screen or perform an action
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF276A7B),
                    ),
                    child: const Text('Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
