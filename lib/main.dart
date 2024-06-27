import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/firebase_options.dart';
import 'package:flutter_application_street_parking/screens/components/globals.dart';
import 'screens/components/welcome_screen.dart';
import 'screens/components/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GlobalData.loadUserUid();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The street parking',
      home: FutureBuilder(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                  // child: SpinKitFadingCube(
                  //   color: kPrimaryColor,
                  //   size: 50.0,
                  // ),
                  ),
            );
          } else {
            if (snapshot.hasData) {
              // User is already authenticated, navigate to home screen
              return home_screen();
            } else {
              // User is not authenticated, show welcome screen
              return const welcome_screen();
            }
          }
        },
      ),
    );
  }
}
