import 'package:flutter/material.dart';

class CheckUpPage extends StatefulWidget {
  const CheckUpPage({super.key});

  @override
  _CheckUpPageState createState() => _CheckUpPageState();
}

//Check Up Form

class CheckUpForm {
  final String name;
  final int age;
  final String sex;
  final String address;
  final String phoneNumber;
  final String? occupation ;
  final String maritalStatus;
  final String? primaryDoctor;
  final List<String> symptoms;
  final List<String> medications;
  final List<String> allergies;
  final DateTime checkUpDate;

  CheckUpForm({
    required this.name,
    required this.age,
    required this.sex,
    required this.address,
    required this.phoneNumber,
    this.occupation,
    required this.maritalStatus,
    this.primaryDoctor,
    required this.symptoms,
    required this.medications,
    required this.allergies,
    required this.checkUpDate,
  });
}




class _CheckUpPageState extends State<CheckUpPage> {
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

      //content

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
                          "See Schedule",
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
                        child: Image.asset('assets/calendar.png'),
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
                // child: Scrollbar(
                //   child: GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2, // Display two boxes per row
                //     ),
                //     itemCount: medicines.length,
                //     itemBuilder: (context, index) {
                //       Medicine medicine = medicines[index];
                //       bool isAvailable = medicine.quantity >
                //           0; // Check if medicine is available

                //       return Container(
                //         margin: EdgeInsets.all(10),
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10.0),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.5),
                //               spreadRadius: 2,
                //               blurRadius: 5,
                //               offset: Offset(0, 3),
                //             ),
                //           ],
                //         ),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Center(
                //               child: Text(medicine.name),
                //             ),
                //             Image.asset(medicine.imageUrl,
                //                 width: 60, height: 60),
                //             SizedBox(height: 20),
                //             if (isAvailable)
                //               Column(
                //                 children: [
                //                   Text("Available:"),
                //                   Text(
                //                     "${medicine.quantity} pieces",
                //                     style: TextStyle(color: Colors.green),
                //                   ),
                //                 ],
                //               )
                //             else
                //               Text(
                //                 "Not Available",
                //                 style: TextStyle(color: Colors.red),
                //               ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
