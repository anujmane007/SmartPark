import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/admin_as_login.dart';

class admin_screen extends StatelessWidget {
  admin_screen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                left: 55,
                top: 370,
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
                left: 31,
                top: 416,
                child: Container(
                  width: 340,
                  height: 65,
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
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      // hintText: 'Enter your text here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 570,
                child: Container(
                  width: 340,
                  height: 65,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        // strokeJoin: StrokeJoin.miter,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true, // to hide the password
                    decoration: const InputDecoration(
                      // hintText: 'Enter your text here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 55,
                top: 535,
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
                left: 32,
                top: 700,
                child: Container(
                  width: 337,
                  height: 61,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5860C),
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
                left: 32,
                top: 715,
                child: GestureDetector(
                  onTap: () {
                    // Check if username and password match the specified values
                    if (usernameController.text == 'Sataraadmin' &&
                        passwordController.text == '1111') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const admin_as_login();
                          },
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Invalid username or password'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const SizedBox(
                    width: 339,
                    height: 40,
                    child: Text(
                      'Admin Login',
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/registration_page.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Positioned(
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
        ),
      ),
    );
  }
}
