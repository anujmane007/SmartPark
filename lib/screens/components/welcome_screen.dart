import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/first_screen.dart';

// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:flutter_auth/Screens/Login/login_warrior.dart';
// import 'package:flutter_auth/Screens/Welcome/components/signup_citizen.dart';
// import 'package:flutter_auth/Screens/Welcome/components/signup_warrior.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class welcome_screen extends StatelessWidget {
  const welcome_screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 430,
          height: 923,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              // Positioned(
              //   left: -20,
              //   top: 736,
              //   child: Container(
              //     width: 350,
              //     height: 72,
              //     decoration: ShapeDecoration(
              //       color: Color(0xFF3BB403),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //       shadows: [
              //         BoxShadow(
              //           color: Color(0x3F000000),
              //           blurRadius: 4,
              //           offset: Offset(0, 4),
              //           spreadRadius: 0,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Positioned(
                left: 20,
                top: 720,
                child: Container(
                  width: 350,
                  height: 72,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3BB403),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
                left: 20,
                top: 735,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const first_screen(); // Assuming signup_citizen_screen is a widget.
                        },
                      ),
                    );
                  },
                  child: const SizedBox(
                    width: 350,
                    height: 52,
                    child: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
        
              // Positioned(
              //   left: 40,
              //   top: 742,
              //   child: SizedBox(
              //     width: 350,
              //     height: 10,
              //     child: Text(
              //       'Get Started',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 32,
              //         fontFamily: 'Inter',
              //         fontWeight: FontWeight.w800,
              //         height: 0,
              //       ),
              //     ),
              //   ),
              // ),
              const Positioned(
                left: -20,
                top: 420,
                child: SizedBox(
                  width: 430,
                  height: 194,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome To',
                          style: TextStyle(
                            color: Color(0xFFFF8900),
                            fontSize: 50,
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
                            fontSize: 70,
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
              const Positioned(
                left: -15,
                top: 615,
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
                left: 5,
                top: -39,
                child: Container(
                  width: 400,
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Welcome_page.png"),
                      fit: BoxFit.fill,
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
