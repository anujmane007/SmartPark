import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/Report_page.dart';
import 'package:flutter_application_street_parking/screens/components/Tag_Installation.dart';
import 'package:flutter_application_street_parking/screens/components/parking_spaces.dart';

import 'package:flutter_application_street_parking/screens/components/vehicle_registration.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});
// CHANGING THE COMMANDS
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.21, 0.98),
            end: Alignment(0.21, -0.98),
            colors: [Color(0xFF1C08FF), Color(0xFF3EFFFF)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 19,
              top: 24,
              child: Container(
                width: 270,
                height: 45,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.03),
                    end: Alignment(1, -0.03),
                    colors: [Color(0xFFFF6C03), Color(0xFFFFB700)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: [
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
              left: 12,
              top: 500,
              child: Container(
                width: 370,
                height: 340,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.35,
                    colors: [Color(0xFFE1E1E1), Colors.white],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  shadows: [
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
              left: 120,
              top: 406,
              child: Container(
                width: 160,
                height: 70,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.40,
                    colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   left: 538,
            //   top: 731,
            //   child: Container(
            //     width: 550,
            //     height: 550,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: NetworkImage("https://via.placeholder.com/550x550"),
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              left: 25,
              top: 740,
              child: Container(
                width: 343,
                height: 77,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.49,
                    colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: [
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
              left: 124,
              top: 418,
              child: SizedBox(
                width: 146,
                height: 66,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '10.27',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'hr',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 406,
              child: Container(
                width: 84,
                height: 70,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.40,
                    colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 410,
              child: Container(
                width: 68,
                height: 66,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/rs_home.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 354,
              child: SizedBox(
                width: 392,
                height: 21,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tap ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5400000214576721),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'on the car for new tag installation.',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5400000214576721),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 310,
              top: 20,
              child: Container(
                width: 51,
                height: 53,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/Logout 1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -5,
              top: 30,
              child: SizedBox(
                width: 267,
                height: 49,
                child: Text(
                  'Parking Location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 89,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TagInstallation();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 375,
                  height: 248,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "assets/images/home_page_background.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 240,
                top: 24,
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("assets/images/search_icon.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            Positioned(
              left: 300,
              top: 406,
              child: Container(
                width: 84,
                height: 70,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.35,
                    colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 300,
              top: 415,
              child: SizedBox(
                width: 97,
                height: 47,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'min',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 510,
              child: Container(
                width: 340,
                height: 90,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.35,
                    colors: [Color(0xFF3BB403), Color(0xFF00FF73)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
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
            // ADD VECHICLE SECTION
            Positioned(
              left: 30,
              top: 620,
              child: Container(
                width: 340,
                height: 90,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.35,
                    colors: [Color(0xFF3BB403), Color(0xFF00FF73)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
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
              left: 50,
              top: 515,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ParkingSpaces();
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: 241,
                  height: 76,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Park Fast\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Quick Navigation to nearest Available Parking Spot',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 165,
              top: 640,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return VehicleRegistration();
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: 225,
                  height: 76,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Add Vehicle\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Register New Vehicle',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 2,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 287,
              top: 510,
              child: Container(
                width: 90,
                height: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/park_fast.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 254,
              top: 730,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/report_vechicle.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 47,
              top: 750,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return report_page();
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: 318,
                  height: 77,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Report\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Invalid Parking',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1.4,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 287,
              top: 434,
              child: SizedBox(
                width: 24,
                height: 24,
                child: Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 620,
              child: Container(
                width: 140,
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/Add_vechicle.png"),
                    fit: BoxFit.fill,
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
