import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_street_parking/screens/components/Report_page.dart';
import 'package:flutter_application_street_parking/screens/components/Tag_Installation.dart';
import 'package:flutter_application_street_parking/screens/components/first_screen.dart';
import 'package:flutter_application_street_parking/screens/components/home_screen.dart';
import 'package:flutter_application_street_parking/screens/components/login_screen.dart';
import 'package:flutter_application_street_parking/screens/components/register_vechicle_screen.dart';
import 'package:flutter_application_street_parking/screens/components/registration_screen.dart';

class VehicleRegistration extends StatefulWidget {
  final String userUid;

  const VehicleRegistration({Key? key, required this.userUid})
      : super(key: key);

  @override
  State<VehicleRegistration> createState() => _VehicleRegistrationState();
}

class _VehicleRegistrationState extends State<VehicleRegistration> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController vehicleNameController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  String? selectedVehicleType;

  Future<void> _registerVehicle(BuildContext context) async {
    String vehicleName = vehicleNameController.text;
    String vehicleNumber = vehicleNumberController.text;

    if (vehicleName.isEmpty ||
        vehicleNumber.isEmpty ||
        selectedVehicleType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    Map<String, dynamic> vehicleData = {
      'name': vehicleName,
      'number': vehicleNumber,
      'type': selectedVehicleType,
    };

    try {
      await _firestore
          .collection('user')
          .doc(widget.userUid)
          .collection('vehicles')
          .add(vehicleData);

      vehicleNameController.clear();
      vehicleNumberController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vehicle registered successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error registering vehicle. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Registration"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Text(
                'Hi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Welcome'),
              onTap: () {
                // Navigate to the home page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const first_screen()),
                ); // Closes the drawer
              },
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Navigate to the home page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home_screen()),
                ); // Closes the drawer
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login_screen()),
                ); // Closes the drawer
              },
            ),
            ListTile(
              title: const Text('Sign-up'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()),
                ); // Closes the drawer
              },
            ),
            ListTile(
              title: const Text('Report'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const report_page()),
                ); // Closes the drawer
              },
            ), // Add more ListTile widgets for additional pages
            ListTile(
              title: const Text('Install Tag'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TagInstallation()),
                ); // Closes the drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              const Positioned(
                left: 30,
                top: 320,
                child: SizedBox(
                  width: 211,
                  height: 34,
                  child: Text(
                    'Vehicle Name:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 32,
                top: 440,
                child: SizedBox(
                  width: 211,
                  height: 34,
                  child: Text(
                    'Vehicle Number:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 560,
                child: SizedBox(
                  width: 211,
                  height: 34,
                  child: Text(
                    'Vehicle Type:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 90,
                top: 735,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Registered_Vehicle_screen();
                        },
                      ),
                    );
                  },
                  child: const SizedBox(
                    width: 311,
                    height: 34,
                    child: Text(
                      'Tap to See Registered Vehicle',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 595,
                child: Container(
                  width: 340,
                  height: 65,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: DropdownButton<String>(
                    hint: const Text(
                      "Select",
                      style: TextStyle(fontSize: 30),
                    ),
                    value: selectedVehicleType,
                    onChanged: (String? newValue) {
                      // Handle the selection of vehicle type here
                      setState(() {
                        selectedVehicleType = newValue;
                      });
                    },
                    items: ['Car', 'Bike'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 480,
                child: Container(
                  width: 340,
                  height: 65,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: TextField(
                    controller: vehicleNumberController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Vehicle No', // Placeholder text
                      hintStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 365,
                child: Container(
                  width: 340,
                  height: 65,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: TextField(
                    controller: vehicleNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Vehicle Name', // Placeholder text
                      hintStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 23,
                top: 21,
                child: SizedBox(
                  width: 343,
                  height: 122,
                  child: Text(
                    'SmartPark',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF00DE65),
                      fontSize: 64,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 110,
                child: Container(
                  width: 333,
                  height: 189,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/Vehicle_Registration.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 680,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Registered_Vehicle_screen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 84,
                    height: 58,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/Registered_Vehicle_info.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: 32,
              //   top: 775,
              //   child: Container(
              //     width: 337,
              //     height: 61,
              //     decoration: ShapeDecoration(
              //       color: const Color.fromARGB(255, 0, 240, 92),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //       shadows: const [
              //         BoxShadow(
              //           color: Color(0x3F000000),
              //           blurRadius: 4,
              //           offset: Offset(0, 4),
              //           spreadRadius: 0,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Positioned(
                left: 30,
                top: 785,
                child: GestureDetector(
                  onTap: () async {
                    await _registerVehicle(context);
                    // Optionally, you can navigate to another screen here
                  },
                  child: Container(
                    width: 329,
                    height: 61,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(255, 0, 240, 92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Register Vehicle',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
