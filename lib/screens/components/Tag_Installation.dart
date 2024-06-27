import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/Report_page.dart';
import 'package:flutter_application_street_parking/screens/components/first_screen.dart';
import 'package:flutter_application_street_parking/screens/components/home_screen.dart';
import 'package:flutter_application_street_parking/screens/components/login_screen.dart';
import 'package:flutter_application_street_parking/screens/components/registration_screen.dart';
import 'package:flutter_application_street_parking/screens/components/tag_request.dart';

class TagInstallation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Tag"),
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
              begin: Alignment(-0.21, 0.98),
              end: Alignment(0.21, -0.98),
              colors: [Color(0xFF1C08FF), Color(0xFF3EFFFF)],
            ),
          ),
          child: Stack(
            children: [
              // Background Container
              // _buildBackgroundContainer(),

              // Texts and Images
              _buildTextsAndImages(context),

              // Borders
              _buildBorders(context),
            ],
          ),
        ),
      ),
    );
  }

  // Extracted widget for the background container

  // Extracted widget for texts and images
  Widget _buildTextsAndImages(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -10,
          top: 30,
          child: Container(
            width: 355,
            height: 255,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/MarutiSuzuki.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        // WHITE BOX
        Positioned(
          left: 14,
          top: 300,
          child: Container(
            width: 362,
            height: 482,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          left: 17,
          top: 688,
          child: SizedBox(
            width: 356,
            height: 79,
            child: Text(
              'Maintenance \nRequest',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 452,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tag_request()),
              );
            },
            child: const SizedBox(
              width: 356,
              height: 78,
              child: Text(
                'Place Tag \nInstallation request',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 144,
          top: 580,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tag_request()),
              );
            },
            child: Container(
              width: 101,
              height: 101,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/RedRFID.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 200,
          top: 118.52,
          child: Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0)
              ..rotateZ(-0.05),
            child: Container(
              width: 222.32,
              height: 174.51,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Splender.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Extracted widget for borders
  Widget _buildBorders(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 33,
          top: 557,
          child: Container(
            width: 334,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                width: 4,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        Positioned(
          left: 144,
          top: 327,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tag_request()),
              );
            },
            child: Container(
              width: 101,
              height: 101,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/BlueRFID.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
