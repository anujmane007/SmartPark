import 'package:flutter/material.dart';
import 'screens/components/welcome_screen.dart';
// i am TheXzavier

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The street parking',
      home: welcome_screen(),
    );
  }
}
