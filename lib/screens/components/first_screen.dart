import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/admin_as_login.dart';
import 'package:flutter_application_street_parking/screens/components/login_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/Vehicle_Registration.dart';
// import 'package:flutter_application_street_parking/screens/components/vehicle_registration.dart';
import 'package:flutter_application_street_parking/screens/components/registration_screen.dart';

// import 'package:flutter_auth/Screens/Login/Vehicle_Registration.dart';
// import 'package:flutter_auth/Screens/Login/login_warrior.dart';
// import 'package:flutter_auth/Screens/Welcome/components/signup_citizen.dart';
// import 'package:flutter_auth/Screens/Welcome/components/signup_warrior.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class first_screen extends StatelessWidget {
  const first_screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 26,
              top: 49,
              child: Container(
                width: 381,
                height: 270,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/first_page.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(53),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -30,
              top: 351,
              child: SizedBox(
                width: 461,
                height: 194,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome To',
                        style: TextStyle(
                          color: Color(0xFFFF8900),
                          fontSize: 48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: Color(0xFFFF8900),
                          fontSize: 55,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'SmartPark',
                        style: TextStyle(
                          color: Color(0xFF3BB403),
                          fontSize: 64,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
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
              left: -10,
              top: 513,
              child: SizedBox(
                width: 430,
                height: 72,
                child: Text(
                  'Effortless parking, one spot at a time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 570,
              child: Container(
                width: 349,
                height: 65,
                decoration: ShapeDecoration(
                  color: Color(0xFFF5860C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
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
              left: 25,
              top: 666,
              child: Container(
                width: 349,
                height: 65,
                decoration: ShapeDecoration(
                  color: Color(0xCE021BFC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
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
              left: 20,
              top: 585,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Login_screen();
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: 349,
                  height: 40,
                  child: Text(
                    'Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 682,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return admin_as_login();
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: 361,
                  height: 40,
                  child: Text(
                    'Admin Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0, // Adjusted height to a valid value
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 68,
              top: 108,
              child: SizedBox(
                width: 67,
                height: 9,
                child: Text(
                  'Smart Park',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF031299),
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 222,
              top: 247,
              child: SizedBox(
                width: 98,
                height: 21,
                child: Text(
                  'Smart Park',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF031299),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 760,
              child: Container(
                width: 349,
                height: 62,
                decoration: ShapeDecoration(
                  color: Color(0xFF3BB403),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
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
              left: 28,
              top: 775,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return registration_screen();
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: 351,
                  height: 40,
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
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
