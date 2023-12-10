import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class VehicleData {
  VehicleData(this.name, this.quantity);
  final String name;
  final double quantity;
}

class Vehicle {
  final String name;
  final int quantity;
  final String imageUrl;

  Vehicle(this.name, this.quantity, this.imageUrl);
}

List<Vehicle> vehicles = [
  Vehicle("Ambulance", 8, 'assets/ambulance_services.png'),
  Vehicle("Fire Truck", 7, 'assets/fire_truck.png'),
  Vehicle("Police Mobile", 14, 'assets/police_car.png'),
];

class _VehiclePageState extends State<VehiclePage> {
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
                          "Available Vehicles",
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
                        child: Image.asset('assets/ambulance.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ColumnSeries<VehicleData, String>>[
                  ColumnSeries<VehicleData, String>(
                      dataSource: <VehicleData>[
                        VehicleData("Ambulance", 8),
                        VehicleData("Firetruck", 7),
                        VehicleData("Poilice Mobile", 14),
                      ],
                      xValueMapper: (VehicleData veh, _) => veh.name,
                      yValueMapper: (VehicleData veh, _) => veh.quantity,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ],
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
                      crossAxisCount: 3, // Display two boxes per row
                    ),
                    itemCount: vehicles.length,
                    itemBuilder: (context, index) {
                      Vehicle vehicle = vehicles[index];
                      bool isAvailable = vehicle.quantity >
                          0; // Check if medicine is available

                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
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
                              child: Text(vehicle.name),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image.asset(vehicle.imageUrl,
                                  width: 60, height: 60),
                            ),
                            SizedBox(height: 10),
                            if (isAvailable)
                              Expanded(
                                flex: 0,
                                child: Column(
                                  children: [
                                    Text("Available:"),
                                    Text(
                                      "${vehicle.quantity}",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                              )
                            else
                              Expanded(
                                flex: 0,
                                child: Text(
                                  "Not Available",
                                  style: TextStyle(color: Colors.red),
                                ),
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
