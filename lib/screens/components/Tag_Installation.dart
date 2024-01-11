import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/tag_request.dart';

class TagInstallation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _buildBackgroundContainer(),
        
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
  Widget _buildBackgroundContainer() {
    return Positioned(
      left: 30,
      top: 30,
      child: Container(
        width: 370,
        height: 70,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-1.00, 0.03),
            end: Alignment(1, -0.03),
            colors: [Color(0xFFFF6C03), Color(0xFFFFB700)],
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
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
    );
  }

  // Extracted widget for texts and images
  Widget _buildTextsAndImages(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          left: 41,
          top: 47,
          child: SizedBox(
            width: 348,
            height: 71,
            child: Text(
              'Smart Park Tag',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Positioned(
          left: -26,
          top: 129,
          child: Container(
            width: 361,
            height: 255,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/MarutiSuzuki.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          left: 14,
          top: 415,
          child: Container(
            width: 402,
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
          left: 37,
          top: 798,
          child: SizedBox(
            width: 356,
            height: 73,
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
          left: 40,
          top: 562,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => tag_request()),
              );
            },
            child: const SizedBox(
              width: 356,
              height: 73,
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
          left: 164,
          top: 687,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => tag_request()),
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
          left: 203.92,
          top: 198.52,
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
          top: 657,
          child: Container(
            width: 364,
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
          left: 164,
          top: 447,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => tag_request()),
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