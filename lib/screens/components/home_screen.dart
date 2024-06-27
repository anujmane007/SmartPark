import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/CardDetailsPage.dart';
import 'package:flutter_application_street_parking/screens/components/Report_page.dart';
import 'package:flutter_application_street_parking/screens/components/Tag_Installation.dart';
import 'package:flutter_application_street_parking/screens/components/globals.dart';
import 'package:flutter_application_street_parking/screens/components/parking_spaces.dart';
import 'package:flutter_application_street_parking/screens/components/vehicle_registration.dart';
import 'package:flutter_application_street_parking/screens/components/welcome_screen.dart';
import 'package:flutter_application_street_parking/screens/components/first_screen.dart';
import 'package:flutter_application_street_parking/screens/components/login_screen.dart';
import 'package:flutter_application_street_parking/screens/components/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class home_screen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home_screen> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String DynamicPrice = '0';
  double defaultBalance = 0.0;
  String Balance = '0';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Fetch default balance from Firestore when the page is loaded
    _fetchDefaultBalance();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      _fetchDefaultBalance();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _fetchDefaultBalance() {
    //print("Inside Fetch data balance");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userBalanceCollection =
        firestore.collection('userbalance');
    String? currentUserUid = GlobalData.currentUserUid;
    //print(currentUserUid);

    userBalanceCollection.doc(currentUserUid).get().then((snapshot) {
      if (snapshot.exists) {
        dynamic balance = snapshot['balance'];
        //print(balance);
        if (balance is num) {
          defaultBalance = balance.toDouble();
        } else {
          print('Error: Balance fetched from Firestore is not a number');
        }

        setState(() {
          Balance = defaultBalance.toString();
          //print(Balance);
        });
      }
    }).catchError((error) {
      print('Error fetching default balance: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _fApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something is wrong with firebase");
          } else if (snapshot.hasData) {
            return content();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget content() {
    DatabaseReference _dbRef = FirebaseDatabase.instance
        .ref()
        .child('RadhikaRoad')
        .child('Dynamic_Price');

    _dbRef.onValue.listen((event) {
      setState(() {
        DynamicPrice = event.snapshot.value.toString();
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage(
                'assets/images/Logout 1.png',
                // Replace with your image path
              ),
              color: Colors.black,
              size: 30, // Set the size of the image
            ),
            onPressed: () {
              logoutUser(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Text(
                'Hi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Welcome'),
              onTap: () {
                // Navigate to the home page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const first_screen()),
                ); // Closes the drawer
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login_screen()),
                ); // Closes the drawer
              },
            ),
            ListTile(
              title: const Text('Sign-up'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()),
                ); // Closes the drawer
              },
            ),
            ListTile(
              title: const Text('Report'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const report_page()),
                ); // Closes the drawer
              },
            ), // Add more ListTile widgets for additional pages
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 430,
          height: 850,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.21, -0.98),
              end: Alignment(-0.21, 0.98),
              colors: [
                Color(0xFF00D1FF),
                Color(0xFF000AFF),
              ],
            ),
          ),
          child: Stack(
            children: [
              //White Background
              Positioned(
                left: 12,
                top: 466,
                child: Container(
                  width: 370,
                  height: 340,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 0.35,
                      colors: [Color(0xFFE1E1E1), Colors.white],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
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
              //Dynamic Price
              Positioned(
                left: 30,
                top: 326,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Text.rich(
                    TextSpan(
                      text: 'Spot Rate',
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
                left: 25,
                top: 371,
                child: Container(
                  width: 160,
                  height: 70,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xFF00B2FF), Color(0xFF2603FF)]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 386,
                child: SizedBox(
                  width: 146,
                  height: 66,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$DynamicPrice",
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
              //Balance
              Positioned(
                left: 245,
                top: 326,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Text.rich(
                    TextSpan(
                      text: 'Balance',
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
                left: 210,
                top: 371,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CardDetailsPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 175,
                    height: 70,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [Color(0xFF00B2FF), Color(0xFF2603FF)]),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 386,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CardDetailsPage();
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Rs.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: "$Balance",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
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
              ),
              Positioned(
                left: 12,
                top: 290,
                child: SizedBox(
                  width: 392,
                  height: 21,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tap on the car for new tag installation. ',
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
                //89 top
                left: 10,
                top: 25,
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/home_page_background.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              //Park Fast
              Positioned(
                left: 30,
                top: 476,
                child: Container(
                    width: 340,
                    height: 90,
                    decoration: ShapeDecoration(
                      gradient: const RadialGradient(
                        center: Alignment(1, 0.50),
                        radius: 4,
                        colors: [Color(0xFF0F9274), Color(0xFF8FBF04)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    )),
              ),
              Positioned(
                left: 50,
                top: 481,
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
                  child: const SizedBox(
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
                left: 287,
                top: 461,
                child: Container(
                  width: 90,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/park_fast.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //Add Vehicle
              Positioned(
                left: 30,
                top: 591,
                child: Container(
                  width: 340,
                  height: 90,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 4,
                      colors: [Color(0xFF0F9274), Color(0xFF8FBF04)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
                left: 165,
                top: 606,
                child: GestureDetector(
                  onTap: () {
                    print(GlobalData.currentUserUid ?? 'User UID is null');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          // Pass the globalUserId to VehicleRegistration
                          return VehicleRegistration(
                              userUid: GlobalData.currentUserUid ?? '');
                        },
                      ),
                    );
                  },
                  child: const SizedBox(
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
                left: 24,
                top: 576,
                child: Container(
                  width: 140,
                  height: 110,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Add_vechicle.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              //Report
              Positioned(
                left: 25,
                top: 706,
                child: Container(
                  width: 343,
                  height: 77,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 4,
                      colors: [Color(0xFF0F9274), Color(0xFF8FBF04)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
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
                left: 47,
                top: 716,
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
                  child: const SizedBox(
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
                left: 254,
                top: 686,
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/report_vechicle.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              const Positioned(
                left: 287,
                top: 370,
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
            ],
          ),
        ),
      ),
    );
  }
}

void logoutUser(BuildContext context) {
  // Perform logout operations, clear user data, etc.
  // Redirect to the login screen using Navigator
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return welcome_screen(); // Assuming Login_screen is the login page
      },
    ),
  );
}
