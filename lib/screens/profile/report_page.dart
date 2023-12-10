import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String dropdownvalue = 'Home';
  int selectedOption = 1;
  var items = [
    'Home',
    'Services',
    'Profile',
    'Sign up / Log in',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Report a problem",
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
                  'Which page has an error?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF276A7B),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Color(0xff276A7B),
                  fontSize: 16,
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                //enabled border styling
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(
                        255, 156, 156, 158), // Change the border color here
                    width: 1.0, // Adjust the border width as needed
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
              ),
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(color: Color(0xFF276A7B)),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Freezes'),
              leading: Radio<int>(
                value: 1,
                groupValue: selectedOption,
                activeColor: Color(
                    0xFF276A7B), // Change the active radio button color here
                fillColor: MaterialStateProperty.all(
                    Color(0xFF276A7B)), // Change the fill color when selected
                splashRadius: 20, // Change the splash radius when clicked
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Missing Elements'),
              leading: Radio<int>(
                value: 2,
                groupValue: selectedOption,
                activeColor: Color(
                    0xFF276A7B), // Change the active radio button color here
                fillColor: MaterialStateProperty.all(
                    Color(0xFF276A7B)), // Change the fill color when selected
                splashRadius: 20, // Change the splash radius when clicked
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Crashes'),
              leading: Radio<int>(
                value: 3,
                groupValue: selectedOption,
                activeColor: Color(
                    0xFF276A7B), // Change the active radio button color here
                fillColor: MaterialStateProperty.all(
                    Color(0xFF276A7B)), // Change the fill color when selected
                splashRadius: 20, // Change the splash radius when clicked
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Describe the issue...',
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
            Expanded(child: SizedBox()),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // Add your button's click logic here
                      // For example, you can navigate to another screen or perform an action
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF276A7B),
                    ),
                    child: const Text('Send',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ))),
                ElevatedButton(
                    onPressed: () {
                      // Add your button's click logic here
                      // For example, you can navigate to another screen or perform an action
                      Navigator.of(context).pop();
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
            )),
          ],
        ),
      ),
    );
  }
}
