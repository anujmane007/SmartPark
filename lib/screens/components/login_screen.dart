import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/home_screen.dart';

// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:flutter_auth/Screens/Login/login_warrior.dart';
// import 'package:flutter_auth/Screens/Welcome/components/signup_citizen.dart';
// import 'package:flutter_auth/Screens/Welcome/components/signup_warrior.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class Login_screen extends StatelessWidget {
  const Login_screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body:Container(
    width: 430,
    height: 932,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: Colors.white),
    child: Stack(
        children: [
            Positioned(
                left: 30,
                top: 420,
                child: SizedBox(
                    width: 211,
                    height: 34,
                    child: Text(
                        'Username :',
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
                top: 565,
                child: SizedBox(
                    width: 211,
                    height: 34,
                    child: Text(
                        'Password:',
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
  left: 34,
  top: 600,
  child: Container(
    width: 340,
    height: 65,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          // strokeJoin: StrokeJoin.round, // Use strokeJoin for rounded corners
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'password', // Placeholder text
       hintStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w800 
        
       ),
      ),
    ),
  ),
),

            Positioned(
  left: 34,
  top: 455,
  child: Container(
    width: 340,
    height: 65,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          // strokeJoin: StrokeJoin.round, // Use strokeJoin for rounded corners
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Username', // Placeholder text
        hintStyle: TextStyle(
         fontSize:25,
         fontWeight: FontWeight.bold 

        ),
      ),
    ),
  ),
),

            Positioned(
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
                    height: 289,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("assets/images/login_page.png"),
                            fit: BoxFit.fill,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 32,
                top: 725,
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
                left: 40,
                top: 733,
                child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return home_screen();
                      },
                    ),
                  );
                },
                child: SizedBox(
                    width: 329,
                    height: 61,
                    child: Text(
                        'Log in',
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
        ],
    ),
)
    );
  }
}
