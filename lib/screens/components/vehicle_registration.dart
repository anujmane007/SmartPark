import 'package:flutter/material.dart';

class VehicleRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? selectedVehicleType; // A variable to store the selected vehicle type

    return Scaffold(
      body: Container(
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
            const Positioned(
              left: 90,
              top: 735,
              child: SizedBox(
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
                  hint: Text(
                    "Select",
                    style: TextStyle(fontSize: 30),
                  ), // Add the "Choose" placeholder
                  value:
                      selectedVehicleType, // Use the selected value from the variable
                  onChanged: (String? newValue) {
                    // Handle the selection of vehicle type here
                  },
                  items: <String>['Car', 'Bike']
                      .map<DropdownMenuItem<String>>((String value) {
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Vehicle No', // Placeholder text
                    hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Vehicle Name', // Placeholder text
                    hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                        NetworkImage("assets/images/Vehicle_Registration.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 150,
              top: 680,
              child: Container(
                width: 84,
                height: 58,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "assets/images/Registered_Vehicle_info.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 775,
              child: Container(
                width: 337,
                height: 61,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 0, 240, 92),
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
              ),
            ),
            const Positioned(
              left: 30,
              top: 785,
              child: SizedBox(
                width: 329,
                height: 61,
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
          ],
        ),
      ),
    );
  }
}

