import 'package:flutter/material.dart';
import 'package:flutter_application_street_parking/screens/components/first_screen.dart';

class admin_as_login extends StatelessWidget {
  const admin_as_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("City Admin"),
        centerTitle: true,
        backgroundColor: Colors.amber,
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
                Positioned(
                  left: 17,
                  top: 380,
                  // WHITE BOX
                  child: Container(
                    width: 360,
                    height: 390,
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
                //     left: 370,
                //     top: 20,
                //     child: Container(
                //         width: 51,
                //         height: 53,
                //         decoration: const BoxDecoration(
                //             image: DecorationImage(
                //                 image: NetworkImage("https://via.placeholder.com/51x53"),
                //                 fit: BoxFit.cover,
                //             ),
                //         ),
                //     ),
                // ),
                Positioned(
                  left: 25,
                  top: 465,
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
                    child: const Center(
                      child: Text(
                        'Revenue Collected rs 50,439',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 560,
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
                    child: const Center(
                      child: Text(
                        'submitted reports \n No: 4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 25,
                  top: 660,
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
                    child: const Center(
                      child: Text(
                        'Parking Opearations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                // REPORT
                Positioned(
                  left: 25,
                  top: 300,
                  child: Container(
                    width: 352,
                    height: 53,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF032BFF),
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
                // UPTO WEEKLY
                Positioned(
                  left: 30,
                  top: 400,
                  child: Container(
                    width: 340,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF032BFF),
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
                const Positioned(
                  left: 33,
                  top: 410,
                  child: SizedBox(
                    width: 112,
                    height: 55,
                    child: Text(
                      'Upto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 140,
                  top: 390,
                  child: SizedBox(
                    width: 112,
                    height: 55,
                    child: Text(
                      '-',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 253,
                  top: 410,
                  child: SizedBox(
                    width: 112,
                    height: 55,
                    child: Text(
                      'Weekly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 23,
                  top: 308,
                  child: SizedBox(
                    width: 372,
                    height: 48,
                    child: Text(
                      'Reports',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 34,
                  top: 40,
                  child: Container(
                    width: 340,
                    height: 240,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Admin_panel.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

void logoutUser(BuildContext context) {
  // Perform logout operations, clear user data, etc.
  // Redirect to the login screen using Navigator
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return const first_screen(); // Assuming Login_screen is the login page
      },
    ),
  );
}
