import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_street_parking/screens/components/globals.dart';

class Registered_Vehicle_screen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final String userUid = 'userUid'; // replace with actual user UID
  final CollectionReference _vehiclesCollection = FirebaseFirestore.instance
      .collection('user')
      .doc(GlobalData.currentUserUid)
      .collection('vehicles');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder(
          stream: _vehiclesCollection.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
        
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
        
            // Extract the data from the snapshot
            var vehicleData = snapshot.data!.docs;
        
            // Use the vehicleData to display your UI
            return Container(
              width: 430,
              height: 932,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.21, -0.98),
                  end: Alignment(-0.21, 0.98),
                  colors: [Color(0xFFFFB700), Color(0xFFFF8900)],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 340,
                    child: Container(
                      width: 363,
                      height: 61,
                      decoration: ShapeDecoration(
                        gradient: const RadialGradient(
                          center: Alignment(1, 0.50),
                          radius: 0.35,
                          colors: [Color(0xFF3BB403), Color(0xFF00FF73)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 30,
                    child: Container(
                      width: 370,
                      height: 60,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-1.00, 0.03),
                          end: Alignment(1, -0.03),
                          colors: [Color(0xFFFF1E00), Color(0xFFDE8500)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 115,
                    top: 40,
                    child: SizedBox(
                      width: 175,
                      height: 60,
                      child: Text(
                        'Vechicles',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 71,
                    child: Container(
                      width: 400,
                      height: 242,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/ReportPage_Vehicle.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  // vechicle number container
                  Positioned(
                    left: 15,
                    top: 470,
                    child: Container(
                      width: 368,
                      height: 280,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Vehicle Data:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Wrap ListView with a Container to specify width
                        SizedBox(
                          width: 400, // Adjust the width as needed
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: vehicleData.length,
                            itemBuilder: (context, index) {
                              var vehicle = vehicleData[index].data() as Map<String, dynamic>;
                              var vehicleUid = vehicleData[index].id; // Access the document UID
                              var vehicleName = vehicle['name'] ?? '';
                              var vehicleNumber = vehicle['number'] ?? '';
                              var selectedVehicleType = vehicle['type'] ?? '';
        
                              return Center(
                                child: ListTile(
                                  // title: Text(vehicleName),
                                  subtitle: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        vehicleName,
                                        style: const TextStyle(
                                          fontSize: 30, // Adjust the font size as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        vehicleNumber,
                                        style: const TextStyle(
                                          fontSize: 30, // Adjust the font size as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        selectedVehicleType,
                                        style: const TextStyle(
                                          fontSize: 30, // Adjust the font size as needed
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Use the vehicleUid as needed
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}