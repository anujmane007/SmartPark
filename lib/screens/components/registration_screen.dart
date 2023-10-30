import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/verification_screen.dart';

class registration_screen extends StatelessWidget {
  const registration_screen({super.key});

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
            left: 31,
            top: 416,
            child: Container(
              width: 340,
              height: 65,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
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
            left: 55,
            top: 380,
            child: SizedBox(
              width: 211,
              height: 34,
              child: Text(
                'Name :',
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
            left: 31,
            top: 540,
            child: Container(
              width: 340,
              height: 65,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
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
  left: 31,
  top: 660,
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
            left: 55,
            top: 630,
            child: SizedBox(
              width: 211,
              height: 34,
              child: Text(
                'Email:',
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
            left: 55,
            top: 505,
            child: SizedBox(
              width: 211,
              height: 34,
              child: Text(
                'Mobile No :',
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
            left: 32,
            top: 760,
            child: Container(
              width: 337,
              height: 61,
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
            left: 32,
            top: 770,
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return verification_screen();
                      },
                    ),
                  );
                },
            child: SizedBox(
              width: 339,
              height: 40,
              child: Text(
                'Send OTP',
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
          Positioned(
            left: 15,
            top: 100,
            child: Container(
              width: 370,
              height: 259,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("assets/images/registration_page.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 16,
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
    )
    );
  }
}
