import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Import the file_picker package

class Report_page extends StatefulWidget {
  const Report_page({
    Key? key,
  }) : super(key: key);

  @override
  _Report_pageState createState() => _Report_pageState();
}

class _Report_pageState extends State<Report_page> {
  String? selectedVehicleType; // A variable to store the selected vehicle type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFB700), Color(0xFFFF8900)],
            // clipBehavior: Clip.antiAlias,
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              left: 30,
              top: 340,
              child: SizedBox(
                width: 211,
                height: 34,
                child: Text(
                  'Vehicle Number:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.0, // Adjust the height as needed
                  ),
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 270,
              child: Container(
                width: 337,
                height: 61,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 0, 240, 92),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
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
             Positioned(
              left: 49,
              top: 28,
              child: SizedBox(
                width: 231,
                height: 34,
                child: Text(
                  'Report',
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 245, 245),
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                     height: 0, // Adjust the height as needed
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 49,
              top: 280,
              child: SizedBox(
                width: 231,
                height: 34,
                child: Text(
                  'Invalid Parking Report',
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 245, 245),
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    // height: 1.0, // Adjust the height as needed
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 30,
              top: 450,
              child: SizedBox(
                width: 311,
                height: 34,
                child: Text(
                  'Upload Vehicle Photo',
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
              top: 495,
              child: Container(
                width: 340,
                height: 65,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25), // Set the border radius to 25
                    ),
                  ),
                  onPressed: () async {
                    // Open the file picker and handle the selected file
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      PlatformFile file = result.files.first;
                      // Handle the selected file, you can access it using file.path
                      print('Selected file: ${file.name}');
                    } else {
                      // User canceled the file picker
                      print('No file selected');
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons
                          .photo_camera), // You can change the icon to one representing file upload
                      SizedBox(width: 8),
                      Text("Choose a Photo"),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 375,
              child: Container(
                width: 340,
                height: 65,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Vehicle Number', // Placeholder text
                    hintStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 36,
              top: 60,
              child: Container(
                width: 333,
                height: 189,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/ReportPage_Vehicle.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 595,
              child: Container(
                width: 337,
                height: 61,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 240, 120, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
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
            Positioned(
              left: 32,
              top: 25,
              child: Container(
                width: 337,
                height: 61,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6C03), Color(0xFFFFB700)],
                    // clipBehavior: Clip.antiAlias,
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
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 30,
              top: 605,
              child: SizedBox(
                width: 329,
                height: 61,
                child: Text(
                  'Submit',
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
            const Positioned(
              left: 26,
              top: 704,
              child: SizedBox(
                width: 265,
                child: Text(
                  'Contact us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 23,
              top: 704,
              child: Container(
                width: 74,
                height: 76,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/phone.jpg"),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
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
              left: 23,
              top: 708,
              child: Container(
                width: 365,
                height: 61,
                decoration: ShapeDecoration(
                  gradient: const RadialGradient(
                    center: Alignment(1, 0.50),
                    radius: 0.35,
                    colors: [Color(0xFF3BB403), Color(0xFF00FF73)],
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
            const Positioned(
              left: 14,
              top: 794,
              child: SizedBox(
                width: 385,
                height: 20,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tap ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text:
                            'here to contact the authority of your respected area',
                        style: TextStyle(
                          color: Color.fromARGB(255, 7, 6, 6),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Report_page(),
    ),
  );
}
