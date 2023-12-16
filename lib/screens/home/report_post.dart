import 'package:flutter/material.dart';

class ReportPostPage extends StatefulWidget {
  const ReportPostPage({Key? key}) : super(key: key);

  @override
  _ReportPostPageState createState() => _ReportPostPageState();
}

class _ReportPostPageState extends State<ReportPostPage> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report Post",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF276A7B),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Spam'),
              leading: Radio<int>(
                value: 1,
                groupValue: selectedOption,
                activeColor: Color(0xFF276A7B),
                fillColor: MaterialStateProperty.all(
                  Color(0xFF276A7B),
                ),
                splashRadius: 20,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('False Information'),
              leading: Radio<int>(
                value: 2,
                groupValue: selectedOption,
                activeColor: Color(0xFF276A7B),
                fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                splashRadius: 20,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Hate Speech'),
              leading: Radio<int>(
                value: 3,
                groupValue: selectedOption,
                activeColor: Color(0xFF276A7B),
                fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                splashRadius: 20,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Harassment'),
              leading: Radio<int>(
                value: 4,
                groupValue: selectedOption,
                activeColor: Color(0xFF276A7B),
                fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                splashRadius: 20,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Nudity'),
              leading: Radio<int>(
                value: 5,
                groupValue: selectedOption,
                activeColor: Color(0xFF276A7B),
                fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                splashRadius: 20,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Suicide or self-injury'),
              leading: Radio<int>(
                value: 6,
                groupValue: selectedOption,
                activeColor: Color(0xFF276A7B),
                fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                splashRadius: 20,
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 156, 156, 158),
                          width: 1.0,
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
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF276A7B),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 199, 37, 32),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
