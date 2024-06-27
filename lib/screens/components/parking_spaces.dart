// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_street_parking/screens/components/Report_page.dart';
// import 'package:flutter_application_street_parking/screens/components/Tag_Installation.dart';
// import 'package:flutter_application_street_parking/screens/components/first_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/globals.dart';
// import 'package:flutter_application_street_parking/screens/components/home_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/login_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/registration_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/tag_request.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// class ParkingSpaces extends StatefulWidget {
//   @override
//   _ParkingSpacesState createState() => _ParkingSpacesState();
// }

// class _ParkingSpacesState extends State<ParkingSpaces> {
//   late Timer _timer;
//   var validIds = [];
//   List<bool> isButtonDisabledListLeft = List.generate(10, (index) => false);
//   List<bool> isButtonDisabledListRight = List.generate(10, (index) => false);

//   @override
//   void initState() {
//     super.initState();
//     // Fetch data initially
//     fetchIdsData();
//     _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       fetchIdsData();
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   get screenWidth => null;

//   get screenHeight => null;

//   void disableButtonLeft(int index) {
//     if (mounted) {
//       setState(() {
//         isButtonDisabledListLeft[index] = true;
//       });
//     }
//   }

//   void disableButtonRight(int index) {
//     if (mounted) {
//       setState(() {
//         isButtonDisabledListRight[index] = true;
//       });
//     }
//   }

//   int getEnabledButtonCount(List<bool> buttonList) {
//     return buttonList.where((disabled) => !disabled).length;
//   }

//   Future<void> fetchIdsData() async {
//     final response = await http.get(Uri.parse(
//         'https://adcetsmartpark-default-rtdb.firebaseio.com/RadhikaRoad/.json'));

//     if (response.statusCode == 200) {
//       print("Starting");
//       final data = json.decode(response.body);
//       if (data is Map) {
//         validIds.clear(); // Clear existing data before updating
//         data.forEach((id, idData) {
//           if (id != 'Dynamic_Price' &&
//               idData['Presence'] == 1 &&
//               idData['RFID'] != "") {
//             //print('ID: $id, Data: $idData');
//             validIds.add(int.parse(id.substring(2)) - 1);
//             // // Check and deduct 10 rupees if RFID matches in Firestore
//             // _checkAndDeductBalance(idData['RFID']);
//           }
//         });
//       }
//       print("Total Occupied Spots : ${validIds.length}");
//     } else {
//       print('Failed to fetch data: ${response.statusCode}');
//     }

//     changeButtons();
//     if (mounted) setState(() {});
//   }

//   void changeButtons() {
//     //resetting the left and right buttons
//     for (var j = 0; j < 10; j++) {
//       isButtonDisabledListLeft[j] = false;
//       isButtonDisabledListRight[j] = false;
//     }
//     //changing the buttons according to IDs
//     for (var i = 0; i < validIds.length; i++) {
//       var curr_id = validIds[i];
//       print(curr_id);
//       if (curr_id <= 9) {
//         disableButtonLeft(curr_id);
//         //if id is greater than 10 than just go to the right side of the road used mod 10 cuz of that
//       } else {
//         disableButtonRight(curr_id % 10);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     int enabledButtonCountLeft =
//         getEnabledButtonCount(isButtonDisabledListLeft);
//     int enabledButtonCountRight =
//         getEnabledButtonCount(isButtonDisabledListRight);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Location"),
//         centerTitle: true,
//         backgroundColor: Colors.orangeAccent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//               child: Text(
//                 'Hi',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text('Welcome'),
//               onTap: () {
//                 // Navigate to the home page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const first_screen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Home'),
//               onTap: () {
//                 // Navigate to the home page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => home_screen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Login'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Login_screen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Sign-up'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const RegistrationScreen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Report'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const report_page()),
//                 ); // Closes the drawer
//               },
//             ), // Add more ListTile widgets for additional pages
//             ListTile(
//               title: const Text('Install Tag'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TagInstallation()),
//                 ); // Closes the drawer
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           width: 430,
//           height: 932,
//           clipBehavior: Clip.antiAlias,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment(0.21, -0.98),
//               end: Alignment(-0.21, 0.98),
//               colors: [
//                 Color(0xFF00D1FF),
//                 Color(0xFF000AFF),
//               ],
//             ),
//           ),
//           alignment: Alignment.center,
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 0,
//                 child: Container(
//                   width: 430,
//                   height: 170,
//                   color: Colors.transparent,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         top: 20,
//                         left: 40,
//                         right: 60,
//                         child: Container(
//                           width: 430,
//                           height: 35,
//                           decoration: ShapeDecoration(
//                             gradient: const LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.topRight,
//                                 colors: [Color(0xFF2603FF), Color(0xFF00B2FF)]),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             shadows: const [
//                               BoxShadow(
//                                 color: Color(0x3F000000),
//                                 blurRadius: 4,
//                                 offset: Offset(0, 4),
//                                 spreadRadius: 0,
//                               )
//                             ],
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Khanali Road',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w800,
//                                 height: 0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           top: 70,
//                           left: 115,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               print("");
//                             },
//                             style: ElevatedButton.styleFrom(
//                               primary: const Color(
//                                   0xFF2603FF), // Set the button color here
//                             ),
//                             child: const Text(
//                               '',
//                               // Set the font size here
//                             ),
//                           )),
//                       const Positioned(
//                         top: 75,
//                         left: 20,
//                         child: Text(
//                           'Available : ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           top: 70,
//                           left: 310,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               print("");
//                             },
//                             child: const Text(
//                               '',
//                               // Set the font size here
//                             ),
//                           )),
//                       const Positioned(
//                         top: 75,
//                         left: 210,
//                         child: Text(
//                           'Occupied : ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       //  LEFT 10
//                       Positioned(
//                         top: 125,
//                         left: -15,
//                         child: Container(
//                           width: 430,
//                           height: 40,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                   left: 40,
//                                   child: Container(
//                                     width: 60,
//                                     height: 40,
//                                     decoration: ShapeDecoration(
//                                       gradient: const LinearGradient(
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.topRight,
//                                         colors: [
//                                           Color(0xFF2603FF),
//                                           Color(0xFF00B2FF)
//                                         ],
//                                       ),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                       shadows: const [
//                                         BoxShadow(
//                                           color: Color(0x3F000000),
//                                           blurRadius: 4,
//                                           offset: Offset(0, 4),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         '$enabledButtonCountLeft',
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 24,
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w800,
//                                           height: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                               Center(
//                                 child: Container(
//                                   width: 200,
//                                   height: 40,
//                                   decoration: ShapeDecoration(
//                                     gradient: const LinearGradient(
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.topRight,
//                                       colors: [
//                                         Color(0xFF2603FF),
//                                         Color(0xFF00B2FF)
//                                       ],
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(16),
//                                     ),
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: Color(0x3F000000),
//                                         blurRadius: 4,
//                                         offset: Offset(0, 4),
//                                         spreadRadius: 0,
//                                       )
//                                     ],
//                                   ),
//                                   child: const Center(
//                                     child: Text(
//                                       'Available',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 24,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w800,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               //  RIGHT 10
//                               Positioned(
//                                   right: 40,
//                                   child: Container(
//                                     width: 60,
//                                     height: 40,
//                                     decoration: ShapeDecoration(
//                                       gradient: const LinearGradient(
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.topRight,
//                                         colors: [
//                                           Color(0xFF2603FF),
//                                           Color(0xFF00B2FF)
//                                         ],
//                                       ),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                       shadows: const [
//                                         BoxShadow(
//                                           color: Color(0x3F000000),
//                                           blurRadius: 4,
//                                           offset: Offset(0, 4),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         '$enabledButtonCountRight',
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 24,
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w800,
//                                           height: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // LEFT CONTAINER
//               Positioned(
//                 top: 180,
//                 left: -15,
//                 child: Container(
//                   width: 430,
//                   height: 600,
//                   //color: Colors.orange.withOpacity(1),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 30,
//                         top: 0,
//                         bottom: 0,
//                         width: 60,
//                         child: Container(
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: List.generate(
//                                 isButtonDisabledListLeft.length, (index) {
//                               return Column(
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: isButtonDisabledListLeft[index]
//                                         ? null
//                                         : () {
//                                             // disableButtonLeft(index);
//                                           },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor:
//                                           isButtonDisabledListLeft[index]
//                                               ? Colors.grey
//                                               : const Color(0xFF2603FF),
//                                       minimumSize: const Size(50, 50),
//                                     ),
//                                     child: Text.rich(
//                                       TextSpan(
//                                         text: (index + 1).toString(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 15,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                       height: 10), // Add spacing here
//                                 ],
//                               );
//                             }),
//                           ),
//                         ),
//                       ),
//                       //  RIGHT CONTANIER
//                       Positioned(
//                         right: 25,
//                         top: 0,
//                         bottom: 0,
//                         width: 60,
//                         child: Container(
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: List.generate(
//                                 isButtonDisabledListRight.length, (index) {
//                               return Column(
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: isButtonDisabledListRight[index]
//                                         ? null
//                                         : () {
//                                             // disableButtonRight(index);
//                                           },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor:
//                                           isButtonDisabledListRight[index]
//                                               ? Colors.grey
//                                               : const Color(0xFF2603FF),
//                                       minimumSize: const Size(50, 50),
//                                     ),
//                                     child: Text.rich(
//                                       TextSpan(
//                                         text: (index + 1).toString(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 15,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                       height: 10), // Add spacing here
//                                 ],
//                               );
//                             }),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left:
//                             95, // Adjust the left position based on your layout
//                         top: 0, // Adjust the top position based on your layout
//                         child: Container(
//                           width: 250,
//                           height: 600,
//                           decoration: const BoxDecoration(
//                             image: DecorationImage(
//                               image:
//                                   AssetImage("assets/images/park_fast2.jpeg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_street_parking/screens/components/Report_page.dart';
// import 'package:flutter_application_street_parking/screens/components/Tag_Installation.dart';
// import 'package:flutter_application_street_parking/screens/components/first_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/globals.dart';
// import 'package:flutter_application_street_parking/screens/components/home_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/login_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/registration_screen.dart';
// import 'package:flutter_application_street_parking/screens/components/tag_request.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// class ParkingSpaces extends StatefulWidget {
//   @override
//   _ParkingSpacesState createState() => _ParkingSpacesState();
// }

// class _ParkingSpacesState extends State<ParkingSpaces> {
//   late Timer _timer;
//   var validIds = [];
//   List<bool> isButtonDisabledListLeft = List.generate(10, (index) => false);
//   List<bool> isButtonDisabledListRight = List.generate(10, (index) => false);
//   late TextEditingController _waitingMinuteController;
//   int _waitingTimeInSeconds = 0;

//   @override
//   void initState() {
//     super.initState();
//     _waitingMinuteController = TextEditingController();
//     // Fetch data initially
//     fetchIdsData();
//     fetchWaitingTime();
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_waitingTimeInSeconds > 0) {
//         setState(() {
//           fetchIdsData();
//           _waitingTimeInSeconds -=
//               1; // Decrement by 60 seconds for every minute
//           if (_waitingTimeInSeconds < 0) {
//             _waitingTimeInSeconds = 0; // Ensure waiting time doesn't go below 0
//           }
//           changeWaitingTime(_waitingTimeInSeconds);
//           fetchWaitingTime();

//           if (_waitingTimeInSeconds == 0) {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   // title: const Text('Success'),
//                   content: const Text('Your Waiting Time is Expired!'),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('OK'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _waitingMinuteController.dispose();

//     super.dispose();
//   }

//   void changeWaitingTime(int wt) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference waitingCollection = firestore.collection('waitingtime');
//     String? currentUserUid = GlobalData.currentUserUid;

//     waitingCollection.doc(currentUserUid).set({
//       'waiting_minute': (wt / 60),
//     }).then((value) => null);
//   }

//   get screenWidth => null;

//   get screenHeight => null;

//   Future<void> fetchWaitingTime() async {
//     final DocumentSnapshot<Map<String, dynamic>> snapshot =
//         await FirebaseFirestore.instance
//             .collection('waitingtime')
//             .doc(GlobalData.currentUserUid)
//             .get();

//     setState(() {
//       _waitingTimeInSeconds = (snapshot.data()?['waiting_minute'] ?? 0) *
//           60; // Convert minutes to seconds
//     });
//   }

//   void disableButtonLeft(int index) {
//     if (mounted) {
//       setState(() {
//         isButtonDisabledListLeft[index] = true;
//       });
//     }
//   }

//   void disableButtonRight(int index) {
//     if (mounted) {
//       setState(() {
//         isButtonDisabledListRight[index] = true;
//       });
//     }
//   }

//   int getEnabledButtonCount(List<bool> buttonList) {
//     return buttonList.where((disabled) => !disabled).length;
//   }

//   Future<void> fetchIdsData() async {
//     final response = await http.get(Uri.parse(
//         'https://adcetsmartpark-default-rtdb.firebaseio.com/RadhikaRoad/.json'));

//     if (response.statusCode == 200) {
//       print("Starting");
//       final data = json.decode(response.body);
//       if (data is Map) {
//         validIds.clear(); // Clear existing data before updating
//         data.forEach((id, idData) {
//           if (id != 'Dynamic_Price' &&
//               idData['Presence'] == 1 &&
//               idData['RFID'] != "") {
//             // print('ID: $id, Data: $idData');
//             validIds.add(int.parse(id.substring(2)) - 1);
//             // // Check and deduct 10 rupees if RFID matches in Firestore
//             // _checkAndDeductBalance(idData['RFID']);
//           }
//         });
//       }
//       print("Total Occupied Spots : ${validIds.length}");
//     } else {
//       print('Failed to fetch data: ${response.statusCode}');
//     }

//     changeButtons();
//     if (mounted) setState(() {});
//   }

//   void changeButtons() {
//     //resetting the left and right buttons
//     for (var j = 0; j < 10; j++) {
//       isButtonDisabledListLeft[j] = false;
//       isButtonDisabledListRight[j] = false;
//     }
//     //changing the buttons according to IDs
//     for (var i = 0; i < validIds.length; i++) {
//       var curr_id = validIds[i];
//       print(curr_id);
//       if (curr_id <= 9) {
//         disableButtonLeft(curr_id);
//         //if id is greater than 10 than just go to the right side of the road used mod 10 cuz of that
//       } else {
//         disableButtonRight(curr_id % 10);
//       }
//     }
//   }

//   void submitWaitingMinute() async {
//     int waitingMinute = int.tryParse(_waitingMinuteController.text) ?? 0;

//     if (waitingMinute > 0) {
//       // Store waiting minute in Firestore
//       await FirebaseFirestore.instance
//           .collection('waitingtime')
//           .doc(GlobalData.currentUserUid)
//           .set({'waiting_minute': waitingMinute});

//       // Optionally, you can also provide feedback to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Waiting minute submitted: $waitingMinute'),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Invalid waiting minute'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     int enabledButtonCountLeft =
//         getEnabledButtonCount(isButtonDisabledListLeft);
//     int enabledButtonCountRight =
//         getEnabledButtonCount(isButtonDisabledListRight);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Location"),
//         centerTitle: true,
//         backgroundColor: Colors.orangeAccent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//               child: Text(
//                 'Hi',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text('Welcome'),
//               onTap: () {
//                 // Navigate to the home page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const first_screen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Home'),
//               onTap: () {
//                 // Navigate to the home page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => home_screen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Login'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Login_screen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Sign-up'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const RegistrationScreen()),
//                 ); // Closes the drawer
//               },
//             ),
//             ListTile(
//               title: const Text('Report'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const report_page()),
//                 ); // Closes the drawer
//               },
//             ), // Add more ListTile widgets for additional pages
//             ListTile(
//               title: const Text('Install Tag'),
//               onTap: () {
//                 // Navigate to the profile page or perform any action
//                 Navigator.pop(context); // Closes the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TagInstallation()),
//                 ); // Closes the drawer
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           width: 430,
//           height: 932,
//           clipBehavior: Clip.antiAlias,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment(0.21, -0.98),
//               end: Alignment(-0.21, 0.98),
//               colors: [
//                 Color(0xFF00D1FF),
//                 Color(0xFF000AFF),
//               ],
//             ),
//           ),
//           alignment: Alignment.center,
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 0,
//                 child: Container(
//                   width: 430,
//                   height: 170,
//                   color: Colors.transparent,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         top: 20,
//                         left: 40,
//                         right: 60,
//                         child: Container(
//                           width: 430,
//                           height: 35,
//                           decoration: ShapeDecoration(
//                             gradient: const LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.topRight,
//                                 colors: [Color(0xFF2603FF), Color(0xFF00B2FF)]),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             shadows: const [
//                               BoxShadow(
//                                 color: Color(0x3F000000),
//                                 blurRadius: 4,
//                                 offset: Offset(0, 4),
//                                 spreadRadius: 0,
//                               )
//                             ],
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Khanali Road',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w800,
//                                 height: 0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           top: 70,
//                           left: 115,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               print("");
//                             },
//                             style: ElevatedButton.styleFrom(
//                               primary: const Color(
//                                   0xFF2603FF), // Set the button color here
//                             ),
//                             child: const Text(
//                               '',
//                               // Set the font size here
//                             ),
//                           )),
//                       const Positioned(
//                         top: 75,
//                         left: 20,
//                         child: Text(
//                           'Available : ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           top: 70,
//                           left: 310,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               print("");
//                             },
//                             child: const Text(
//                               '',
//                               // Set the font size here
//                             ),
//                           )),
//                       const Positioned(
//                         top: 75,
//                         left: 210,
//                         child: Text(
//                           'Occupied : ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       //  LEFT 10
//                       Positioned(
//                         top: 125,
//                         left: -15,
//                         child: Container(
//                           width: 430,
//                           height: 40,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                   left: 40,
//                                   child: Container(
//                                     width: 60,
//                                     height: 40,
//                                     decoration: ShapeDecoration(
//                                       gradient: const LinearGradient(
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.topRight,
//                                         colors: [
//                                           Color(0xFF2603FF),
//                                           Color(0xFF00B2FF)
//                                         ],
//                                       ),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                       shadows: const [
//                                         BoxShadow(
//                                           color: Color(0x3F000000),
//                                           blurRadius: 4,
//                                           offset: Offset(0, 4),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         '$enabledButtonCountLeft',
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 24,
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w800,
//                                           height: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                               Center(
//                                 child: Container(
//                                   width: 200,
//                                   height: 40,
//                                   decoration: ShapeDecoration(
//                                     gradient: const LinearGradient(
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.topRight,
//                                       colors: [
//                                         Color(0xFF2603FF),
//                                         Color(0xFF00B2FF)
//                                       ],
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(16),
//                                     ),
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: Color(0x3F000000),
//                                         blurRadius: 4,
//                                         offset: Offset(0, 4),
//                                         spreadRadius: 0,
//                                       )
//                                     ],
//                                   ),
//                                   child: const Center(
//                                     child: Text(
//                                       'Available',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 24,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w800,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               //  RIGHT 10
//                               Positioned(
//                                   right: 40,
//                                   child: Container(
//                                     width: 60,
//                                     height: 40,
//                                     decoration: ShapeDecoration(
//                                       gradient: const LinearGradient(
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.topRight,
//                                         colors: [
//                                           Color(0xFF2603FF),
//                                           Color(0xFF00B2FF)
//                                         ],
//                                       ),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                       shadows: const [
//                                         BoxShadow(
//                                           color: Color(0x3F000000),
//                                           blurRadius: 4,
//                                           offset: Offset(0, 4),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         '$enabledButtonCountRight',
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 24,
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w800,
//                                           height: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // LEFT CONTAINER
//               Positioned(
//                 top: 180,
//                 left: -15,
//                 child: Container(
//                   width: 430,
//                   height: 600,
//                   //color: Colors.orange.withOpacity(1),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 30,
//                         top: 0,
//                         bottom: 0,
//                         width: 60,
//                         child: Container(
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: List.generate(
//                                 isButtonDisabledListLeft.length, (index) {
//                               return Column(
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: isButtonDisabledListLeft[index]
//                                         ? null
//                                         : () {
//                                             // disableButtonLeft(index);
//                                           },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor:
//                                           isButtonDisabledListLeft[index]
//                                               ? Colors.grey
//                                               : const Color(0xFF2603FF),
//                                       minimumSize: const Size(50, 50),
//                                     ),
//                                     child: Text.rich(
//                                       TextSpan(
//                                         text: (index + 1).toString(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 15,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                       height: 10), // Add spacing here
//                                 ],
//                               );
//                             }),
//                           ),
//                         ),
//                       ),
//                       //  RIGHT CONTANIER
//                       Positioned(
//                         right: 25,
//                         top: 0,
//                         bottom: 0,
//                         width: 60,
//                         child: Container(
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: List.generate(
//                                 isButtonDisabledListRight.length, (index) {
//                               return Column(
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: isButtonDisabledListRight[index]
//                                         ? null
//                                         : () {
//                                             // disableButtonRight(index);
//                                           },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor:
//                                           isButtonDisabledListRight[index]
//                                               ? Colors.grey
//                                               : const Color(0xFF2603FF),
//                                       minimumSize: const Size(50, 50),
//                                     ),
//                                     child: Text.rich(
//                                       TextSpan(
//                                         text: (index + 1).toString(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 15,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                       height: 10), // Add spacing here
//                                 ],
//                               );
//                             }),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left:
//                             95, // Adjust the left position based on your layout
//                         top: 0, // Adjust the top position based on your layout
//                         child: Container(
//                           width: 250,
//                           height: 500,
//                           decoration: const BoxDecoration(
//                             image: DecorationImage(
//                               image:
//                                   AssetImage("assets/images/park_fast2.jpeg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 10,
//                         right: 110,
//                         child: Container(
//                           width: 200,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Min. Wait Time: ${(_waitingTimeInSeconds / 60).floor()} m',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 510,
//                         right: 110,
//                         child: Container(
//                           width: 200,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: TextField(
//                             controller: _waitingMinuteController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: 'Enter Waiting Minute',
//                               contentPadding: EdgeInsets.all(10),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Add Submit Button
//                       Positioned(
//                         top: 570,
//                         right: 170,
//                         child: ElevatedButton(
//                           onPressed: submitWaitingMinute,
//                           child: Text('Submit'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/Report_page.dart';
import 'package:flutter_application_street_parking/screens/components/Tag_Installation.dart';
import 'package:flutter_application_street_parking/screens/components/first_screen.dart';
import 'package:flutter_application_street_parking/screens/components/globals.dart';
import 'package:flutter_application_street_parking/screens/components/home_screen.dart';
import 'package:flutter_application_street_parking/screens/components/login_screen.dart';
import 'package:flutter_application_street_parking/screens/components/registration_screen.dart';
import 'package:flutter_application_street_parking/screens/components/tag_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ParkingSpaces extends StatefulWidget {
  @override
  _ParkingSpacesState createState() => _ParkingSpacesState();
}

class _ParkingSpacesState extends State<ParkingSpaces> {
  late Timer _timer;
  var validIds = [];
  List<bool> isButtonDisabledListLeft = List.generate(10, (index) => false);
  List<bool> isButtonDisabledListRight = List.generate(10, (index) => false);
  late TextEditingController _waitingMinuteController;
  int _waitingTimeInSeconds = 0;

  @override
  void initState() {
    super.initState();
    _waitingMinuteController = TextEditingController();
    // Fetch data initially
    fetchIdsData();
    fetchWaitingTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      fetchIdsData();

      if (_waitingTimeInSeconds > 0) {
        setState(() {
          _waitingTimeInSeconds -=
              1; // Decrement by 60 seconds for every minute
          if (_waitingTimeInSeconds < 0) {
            _waitingTimeInSeconds = 0; // Ensure waiting time doesn't go below 0
          }
          changeWaitingTime(_waitingTimeInSeconds);
          fetchWaitingTime();

          if (_waitingTimeInSeconds == 0) {
            sendSMS();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  // title: const Text('Success'),
                  content: const Text('Your Waiting Time is Expired!'),
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
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _waitingMinuteController.dispose();

    super.dispose();
  }

  void sendSMS() async {
    print('Running');
    final accountSid = 'AC279228918253ea987ad27ac3b6c29875';
    final authToken = 'b1e5a2a88e05b9f756c999b9d2cce6c6';
    final twilioNumber = '+14125153628'; // Twilio phone number
    final recipientNumber = '+917499978854'; // Recipient phone number
    final messageBody =
        'Your Parking Waiting is Expired Please Check your ride in 5 minutes or Parking price will be debited acccording to current spot rate. ';

    final url = Uri.parse(
        'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
      },
      body: {
        'To': recipientNumber,
        'From': twilioNumber,
        'Body': messageBody,
      },
    );

    if (response.statusCode == 201) {
      print('SMS sent successfully');
    } else {
      print('Failed to send SMS: ${response.body}');
    }
  }

  void changeWaitingTime(int wt) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference waitingCollection = firestore.collection('waitingtime');
    String? currentUserUid = GlobalData.currentUserUid;

    waitingCollection.doc(currentUserUid).set({
      'waiting_minute': (wt / 60),
    }).then((value) => null);
  }

  get screenWidth => null;

  get screenHeight => null;

  Future<void> fetchWaitingTime() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('waitingtime')
            .doc(GlobalData.currentUserUid)
            .get();

    setState(() {
      _waitingTimeInSeconds = (snapshot.data()?['waiting_minute'] ?? 0) *
          60; // Convert minutes to seconds
    });
  }

  void disableButtonLeft(int index) {
    if (mounted) {
      setState(() {
        isButtonDisabledListLeft[index] = true;
      });
    }
  }

  void disableButtonRight(int index) {
    if (mounted) {
      setState(() {
        isButtonDisabledListRight[index] = true;
      });
    }
  }

  int getEnabledButtonCount(List<bool> buttonList) {
    return buttonList.where((disabled) => !disabled).length;
  }

  Future<void> fetchIdsData() async {
    final response = await http.get(Uri.parse(
        'https://dipex-ba431-default-rtdb.firebaseio.com/RadhikaRoad/.json'));

    if (response.statusCode == 200) {
      print("Starting");
      final data = json.decode(response.body);
      if (data is Map) {
        validIds.clear(); // Clear existing data before updating
        data.forEach((id, idData) {
          if (id != 'Dynamic_Price' &&
              idData['Presence'] == 1 &&
              idData['RFID'] != "") {
            // print('ID: $id, Data: $idData');
            validIds.add(int.parse(id.substring(2)) - 1);
            // // Check and deduct 10 rupees if RFID matches in Firestore
            // _checkAndDeductBalance(idData['RFID']);
          }
        });
      }
      print("Total Occupied Spots : ${validIds.length}");
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }

    changeButtons();
    if (mounted) setState(() {});
  }

  void changeButtons() {
    //resetting the left and right buttons
    for (var j = 0; j < 10; j++) {
      isButtonDisabledListLeft[j] = false;
      isButtonDisabledListRight[j] = false;
    }
    //changing the buttons according to IDs
    for (var i = 0; i < validIds.length; i++) {
      var curr_id = validIds[i];
      print(curr_id);
      if (curr_id <= 9) {
        disableButtonLeft(curr_id);
        //if id is greater than 10 than just go to the right side of the road used mod 10 cuz of that
      } else {
        disableButtonRight(curr_id % 10);
      }
    }
  }

  void submitWaitingMinute() async {
    int waitingMinute = int.tryParse(_waitingMinuteController.text) ?? 0;

    if (waitingMinute > 0) {
      // Store waiting minute in Firestore
      await FirebaseFirestore.instance
          .collection('waitingtime')
          .doc(GlobalData.currentUserUid)
          .set({'waiting_minute': waitingMinute});

      // Optionally, you can also provide feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Waiting minute submitted: $waitingMinute'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid waiting minute'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int enabledButtonCountLeft =
        getEnabledButtonCount(isButtonDisabledListLeft);
    int enabledButtonCountRight =
        getEnabledButtonCount(isButtonDisabledListRight);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Location"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
              title: const Text('Home'),
              onTap: () {
                // Navigate to the home page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home_screen()),
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
            ListTile(
              title: const Text('Install Tag'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TagInstallation()),
                ); // Closes the drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 430,
          height: 932,
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
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: 430,
                  height: 170,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 40,
                        right: 60,
                        child: Container(
                          width: 430,
                          height: 35,
                          decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [Color(0xFF2603FF), Color(0xFF00B2FF)]),
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
                          child: const Center(
                            child: Text(
                              'Khanali Road',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 70,
                          left: 115,
                          child: ElevatedButton(
                            onPressed: () {
                              print("");
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(
                                  0xFF2603FF), // Set the button color here
                            ),
                            child: const Text(
                              '',
                              // Set the font size here
                            ),
                          )),
                      const Positioned(
                        top: 75,
                        left: 20,
                        child: Text(
                          'Available : ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 70,
                          left: 310,
                          child: ElevatedButton(
                            onPressed: () {
                              print("");
                            },
                            child: const Text(
                              '',
                              // Set the font size here
                            ),
                          )),
                      const Positioned(
                        top: 75,
                        left: 210,
                        child: Text(
                          'Occupied : ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      //  LEFT 10
                      Positioned(
                        top: 125,
                        left: -15,
                        child: Container(
                          width: 430,
                          height: 40,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 40,
                                  child: Container(
                                    width: 60,
                                    height: 40,
                                    decoration: ShapeDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color(0xFF2603FF),
                                          Color(0xFF00B2FF)
                                        ],
                                      ),
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
                                    child: Center(
                                      child: Text(
                                        '$enabledButtonCountLeft',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w800,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  )),
                              Center(
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color(0xFF2603FF),
                                        Color(0xFF00B2FF)
                                      ],
                                    ),
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
                                  child: const Center(
                                    child: Text(
                                      'Available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w800,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //  RIGHT 10
                              Positioned(
                                  right: 40,
                                  child: Container(
                                    width: 60,
                                    height: 40,
                                    decoration: ShapeDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color(0xFF2603FF),
                                          Color(0xFF00B2FF)
                                        ],
                                      ),
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
                                    child: Center(
                                      child: Text(
                                        '$enabledButtonCountRight',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w800,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // LEFT CONTAINER
              Positioned(
                top: 180,
                left: -15,
                child: Container(
                  width: 430,
                  height: 600,
                  //color: Colors.orange.withOpacity(1),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        top: 0,
                        bottom: 0,
                        width: 60,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                                isButtonDisabledListLeft.length, (index) {
                              return Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: isButtonDisabledListLeft[index]
                                        ? null
                                        : () {
                                            // disableButtonLeft(index);
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          isButtonDisabledListLeft[index]
                                              ? Colors.grey
                                              : const Color(0xFF2603FF),
                                      minimumSize: const Size(50, 50),
                                    ),
                                    child: Text.rich(
                                      TextSpan(
                                        text: (index + 1).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: 10), // Add spacing here
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      //  RIGHT CONTANIER
                      Positioned(
                        right: 25,
                        top: 0,
                        bottom: 0,
                        width: 60,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                                isButtonDisabledListRight.length, (index) {
                              return Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: isButtonDisabledListRight[index]
                                        ? null
                                        : () {
                                            // disableButtonRight(index);
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          isButtonDisabledListRight[index]
                                              ? Colors.grey
                                              : const Color(0xFF2603FF),
                                      minimumSize: const Size(50, 50),
                                    ),
                                    child: Text.rich(
                                      TextSpan(
                                        text: (index + 1).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: 10), // Add spacing here
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      Positioned(
                        left:
                            95, // Adjust the left position based on your layout
                        top: 0, // Adjust the top position based on your layout
                        child: Container(
                          width: 250,
                          height: 600,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/park_fast2.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 10,
                      //   right: 110,
                      //   child: Container(
                      //     width: 200,
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         'Min. Wait Time: ${(_waitingTimeInSeconds / 60).floor()} m',
                      //         style: TextStyle(fontSize: 16),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   top: 490,
                      //   right: 110,
                      //   child: Container(
                      //     width: 200,
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: TextField(
                      //       controller: _waitingMinuteController,
                      //       keyboardType: TextInputType.number,
                      //       decoration: InputDecoration(
                      //         hintText: 'Enter Waiting Minute',
                      //         contentPadding: EdgeInsets.all(10),
                      //         border: InputBorder.none,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Add Submit Button
                      // Positioned(
                      //   top: 550,
                      //   right: 170,
                      //   child: ElevatedButton(
                      //     onPressed: submitWaitingMinute,
                      //     child: Text('Submit'),
                      //   ),
                      // ),
                    ],
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
