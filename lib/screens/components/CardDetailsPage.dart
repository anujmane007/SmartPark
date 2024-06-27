// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_street_parking/screens/components/globals.dart';

// class CardDetailsPage extends StatefulWidget {
//   @override
//   _CardDetailsPageState createState() => _CardDetailsPageState();
// }

// class _CardDetailsPageState extends State<CardDetailsPage> {
//   final TextEditingController cardNumberController = TextEditingController();
//   final TextEditingController cvvController = TextEditingController();
//   final TextEditingController balanceController = TextEditingController();
//   final TextEditingController rfidController = TextEditingController();

//   String appBarTitle = 'Card Details';
//   double defaultBalance = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     // Fetch default balance from Firestore when the page is loaded
//     _fetchDefaultBalance();
//   }

//   void _fetchDefaultBalance() {
//     // Assuming you have a Firebase instance initialized
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Replace 'userbalance' with your Firestore collection name
//     CollectionReference userBalanceCollection =
//         firestore.collection('userbalance');

//     // Get the current user UID from GlobalData
//     String? currentUserUid = GlobalData.currentUserUid;

//     // Fetch the user's balance from Firestore
//     userBalanceCollection.doc(currentUserUid).get().then((snapshot) {
//       if (snapshot.exists) {
//         dynamic balance = snapshot['balance'];
//         if (balance is String) {
//           // Convert balance from String to double
//           defaultBalance = double.tryParse(balance) ?? 0.0;
//         } else if (balance is num) {
//           // If it's already a number, use it directly
//           defaultBalance = balance.toDouble();
//         } else {
//           print(
//               'Error: Balance fetched from Firestore is not a number or string');
//         }

//         setState(() {
//           appBarTitle = 'Card Details - Balance: ₹${defaultBalance.toString()}';
//         });
//       }
//     }).catchError((error) {
//       print('Error fetching default balance: $error');
//     });
//   }

//   void _submitData() {
//     // Assuming you have a Firebase instance initialized
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Replace 'userbalance' with your Firestore collection name
//     CollectionReference userBalanceCollection =
//         firestore.collection('userbalance');

//     // Get the current user UID from GlobalData
//     String? currentUserUid = GlobalData.currentUserUid;

//     userBalanceCollection.doc(currentUserUid).set({
//       'cardNumber': cardNumberController.text,
//       'cvv': cvvController.text,
//       'balance': balanceController.text, // Store balance as a string
//       'rfid': rfidController.text,
//     }).then((value) {
//       // Data submitted successfully
//       print('Data submitted to Firestore');
//       // Update the displayed balance after submission
//       _fetchDefaultBalance();
//     }).catchError((error) {
//       // Handle error
//       print('Error submitting data: $error');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(appBarTitle),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: cardNumberController,
//               keyboardType: TextInputType.number,
//               decoration:
//                   const InputDecoration(labelText: 'Card Number (16 digits)'),
//             ),
//             TextField(
//               controller: cvvController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(labelText: 'CVV'),
//             ),
//             TextField(
//               controller: balanceController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(labelText: 'Balance'),
//             ),
//             TextField(
//               controller: rfidController,
//               decoration: const InputDecoration(labelText: 'RFID'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _submitData,
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: CardDetailsPage(),
//   ));
// }

//import 'dart:ffi';
// @override
// void initState() {
//   super.initState();
//   // Fetch default balance from Firestore when the page is loaded
//   //_fetchDefaultBalance();
//   //checkDatabase();
// }

// bool checkDatabase() {
//   bool valid = false;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   CollectionReference userBalanceCollection =
//           firestore.collection('userbalance');
//   String? currentUserUid = GlobalData.currentUserUid;
//   print(currentUserUid);

//   userBalanceCollection.doc(currentUserUid).get().then((snapshot) {
//     if (snapshot.exists) {
//       valid = true;
//     }
//   }).catchError((error) {
//     print('Error fetching userdata: $error');
//   });
//   return valid;
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_street_parking/screens/components/globals.dart';

class CardDetailsPage extends StatefulWidget {
  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController rfidController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String appBarTitle = 'Card Details';
  double defaultBalance = 0.0;

  Future<bool> checkDatabase() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? currentUserUid = GlobalData.currentUserUid;

    try {
      DocumentSnapshot snapshot =
          await firestore.collection('userbalance').doc(currentUserUid).get();

      return snapshot.exists;
    } catch (error) {
      print('Error checking user data: $error');
      return false;
    }
  }

  void _submitDataNewUser() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userBalanceCollection =
        firestore.collection('userbalance');
    String? currentUserUid = GlobalData.currentUserUid;

    userBalanceCollection.doc(currentUserUid).set({
      'cardNumber': cardNumberController.text,
      'cvv': cvvController.text,
      'balance':
          double.parse(balanceController.text), // Store balance as a double
      'rfid': rfidController.text,
    }).then((value) {
      print('Data submitted to Firestore');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Submitted'),
          backgroundColor: Colors.red,
        ),
      );
    }).catchError((error) {
      print('Error submitting data: $error');
    });
  }

  double existingBalance = 0;

  Future<void> getExistingBalance() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userBalanceCollection =
        firestore.collection('userbalance');
    String? currentUserUid = GlobalData.currentUserUid;
    var snapshot = await userBalanceCollection.doc(currentUserUid).get();
    if (snapshot.exists) {
      dynamic balance = snapshot['balance'];
      existingBalance = balance.toDouble();
    }
  }

  void _submitDataOldUser() async {
    await getExistingBalance();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userBalanceCollection =
        firestore.collection('userbalance');
    String? currentUserUid = GlobalData.currentUserUid;

    double balanceToAdd = double.parse(balanceController.text);

    existingBalance += balanceToAdd;

    userBalanceCollection.doc(currentUserUid).update({
      'balance': existingBalance, // Store balance as a double
    }).then((value) {
      print('Data submitted to Firestore');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Submitted'),
          backgroundColor: Colors.red,
        ),
      );
    }).catchError((error) {
      print('Error submitting data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkDatabase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show loading indicator while waiting for the result
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data == true) {
            //print("Old User");
            return olduser();
          } else {
            return newuser();
          }
        },
      ),
    );
  }

  Widget olduser() {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: balanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Add Balance'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitDataOldUser,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Widget newuser() {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Card Number (16 digits)'),
            ),
            TextField(
              controller: cvvController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'CVV'),
            ),
            TextField(
              controller: balanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Balance'),
            ),
            TextField(
              controller: rfidController,
              decoration: const InputDecoration(labelText: 'RFID'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitDataNewUser,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CardDetailsPage(),
  ));
}
