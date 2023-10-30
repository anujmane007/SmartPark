import 'package:flutter/material.dart';

class verification_screen extends StatelessWidget {
  const verification_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 185,
              child: Container(
                width: 389,
                height: 273,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/registration_page.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 545,
              child: Container(
                width: 340,
                height: 65,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      // strokeJoin: StrokeJoin.miter,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    // hintText: 'Enter your text here',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 500,
              child: SizedBox(
                width: 333,
                height: 34,
                child: Text(
                  'Enter OTP:',
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
              left: 23,
              top: 700,
              child: Container(
                width: 350,
                height: 72,
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
              left: 23,
              top: 716,
              child: SizedBox(
                width: 350,
                height: 59,
                child: Text(
                  'Verify',
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
            Positioned(
              left: 23,
              top: 17,
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
          ],
        ),
      ),
    );
  }
}
