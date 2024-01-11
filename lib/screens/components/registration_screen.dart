import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/globals.dart';
import 'package:flutter_application_street_parking/screens/components/vehicle_registration.dart';
import 'package:flutter_application_street_parking/screens/components/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<String?> _registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Registration successful, show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful!')),
      );

      return userCredential.user?.uid;
    } catch (e) {
      // Registration failed, show error message
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $e')),
      );
      return null;
    }
  }

  // Future<String?> _registerUser() async {
  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );

  //     // Registration successful, set global user ID
  //     GlobalData.currentUserUid = userCredential.user?.uid;
  //     print(GlobalData.currentUserUid);
  //     // Show success message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Registration successful!')),
  //     );

  //     // Return user ID
  //     return GlobalData.currentUserUid;
  //   } catch (e) {
  //     // Registration failed, show error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Registration failed: $e')),
  //     );
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var _mobileController;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Container(
            width: 430,
            height: 932,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                //  USERNAME VALIDATION
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
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const Positioned(
                  left: 55,
                  top: 380,
                  child: SizedBox(
                    width: 211,
                    height: 34,
                    child: Text(
                      'E-Mail :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
        
                // PASSWORD VALIDATION
                Positioned(
                  left: 31,
                  top: 540,
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
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        // hintText: 'Enter your text here',
        
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        }
                        if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Password must contain at least one special character';
                        }
        
                        return null;
                      },
                    ),
                  ),
                ),
                //  MOBILE VALIDATION
                Positioned(
                  left: 31,
                  top: 660,
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
                    child: TextFormField(
                      controller: _mobileController,
                      decoration: const InputDecoration(
                        // hintText: 'Enter your text here',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Contact Details';
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Invalid Contact Details';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const Positioned(
                  left: 55,
                  top: 630,
                  child: SizedBox(
                    width: 211,
                    height: 34,
                    child: Text(
                      'Mobile No:',
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
                  left: 55,
                  top: 505,
                  child: SizedBox(
                    width: 211,
                    height: 34,
                    child: Text(
                      'Password :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
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
                  top: 770,
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        String? userUid = await _registerUser();
        
                        if (userUid != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const verification_screen();
                              },
                            ),
                          );
                        }
                      }
                    },
                    child: const SizedBox(
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/registration_page.png"),
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
      ),
    );
  }
}
