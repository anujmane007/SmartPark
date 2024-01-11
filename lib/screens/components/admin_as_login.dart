import 'package:flutter/material.dart';

class admin_as_login extends StatelessWidget {
  const admin_as_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.21, 0.98),
              end: Alignment(0.21, -0.98),
              colors: [Color(0xFF1C08FF), Color(0xFF3EFFFF)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 17,
                top: 480,
                child: Container(
                  width: 400,
                  height: 427,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 0.35,
                      colors: [Color(0xFFE1E1E1), Colors.white],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    shadows: [
                      const BoxShadow(
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
                left: 538,
                top: 731,
                child: Container(
                  width: 550,
                  height: 550,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/admin_page.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 370,
                top: 20,
                child: Container(
                  width: 51,
                  height: 53,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("https://via.placeholder.com/51x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 75,
                top: 607,
                child: SizedBox(
                  width: 291,
                  height: 80,
                  child: Text(
                    'Revenue Collected rs 50,439',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 72,
                top: 710,
                child: SizedBox(
                  width: 286,
                  height: 70,
                  child: Text(
                    'submitted reports \nNo: 4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 69,
                top: 803,
                child: Container(
                  width: 291,
                  height: 65,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5860C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      const BoxShadow(
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
                left: 75,
                top: 803,
                child: SizedBox(
                  width: 291,
                  height: 65,
                  child: Text(
                    'Parking Operations',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 46,
                top: 17,
                child: SizedBox(
                  width: 287,
                  height: 57,
                  child: Text(
                    'Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 399,
                child: Container(
                  width: 372,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF4E03),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      const BoxShadow(
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
                left: 33,
                top: 514,
                child: Container(
                  width: 372,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF4E03),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      const BoxShadow(
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
                left: 33,
                top: 516,
                child: SizedBox(
                  width: 112,
                  height: 48,
                  child: Text(
                    'Upto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 163,
                top: 516,
                child: SizedBox(
                  width: 112,
                  height: 48,
                  child: Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 293,
                top: 516,
                child: SizedBox(
                  width: 112,
                  height: 48,
                  child: Text(
                    'Weekly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 31,
                top: 399,
                child: SizedBox(
                  width: 372,
                  height: 48,
                  child: Text(
                    'Reports',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 115,
                child: Container(
                  width: 350,
                  height: 216,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("https://via.placeholder.com/350x216"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 31,
                top: 331,
                child: SizedBox(
                  width: 372,
                  height: 48,
                  child: Text(
                    'Satara Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
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
