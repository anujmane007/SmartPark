import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/globals.dart';
import 'package:flutter_application_street_parking/screens/components/home_screen.dart';

// ignore: camel_case_types
class Login_screen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<String?> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      String? newUid = userCredential.user?.uid;

      // Check if the new UID is different from the current one
      if (GlobalData.currentUserUid != newUid) {
        GlobalData.currentUserUid = newUid;
        await GlobalData.saveUserUid(); // Save the UID to shared preferences
        print(GlobalData.currentUserUid);
      }

      if (userCredential.user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return home_screen();
            },
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred. Please try again later.'),
          ),
        );
      }
      return GlobalData.currentUserUid;
    } catch (e) {
      // Handle login error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password.'),
        ),
      );
      print("Login error: $e");
      return null;
    }
  }

  Login_screen({
    Key? key,
  }) : super(key: key);

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
              const Positioned(
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
                      side: const BorderSide(
                        width: 2,
                        // strokeJoin: StrokeJoin.round, // Use strokeJoin for rounded corners
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'password', // Placeholder text
                      hintStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
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
                      side: const BorderSide(
                        width: 2,
                        // strokeJoin: StrokeJoin.round, // Use strokeJoin for rounded corners
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username', // Placeholder text
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
                  height: 289,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/login_page.png"),
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
                left: 40,
                top: 733,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          _signInWithEmailAndPassword(context);
                          return Login_screen();
                        },
                      ),
                    );
                  },
                  child: const SizedBox(
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
        ),
      ),
    );
  }
}
