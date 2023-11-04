import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class report_page extends StatefulWidget {
  const report_page({super.key});

  @override
  State<report_page> createState() => _report_pageState();
}

class _report_pageState extends State<report_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.21, -0.98),
            end: Alignment(-0.21, 0.98),
            colors: [Color(0xFFFFB700), Color(0xFFFF8900)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 340,
              child: Container(
                width: 363,
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
                  shadows: [
                    const BoxShadow(
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
              left: 15,
              top: 30,
              child: Container(
                width: 370,
                height: 60,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-1.00, 0.03),
                    end: Alignment(1, -0.03),
                    colors: [Color(0xFFFF1E00), Color(0xFFDE8500)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: [
                    const BoxShadow(
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
              left: 115,
              top: 40,
              child: SizedBox(
                width: 175,
                height: 60,
                child: Text(
                  'Report',
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
            Positioned(
              left: 17,
              top: 760,
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
                  shadows: [
                    const BoxShadow(
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
              left: 70,
              top: 770,
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
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 760,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage("assets/images/phone.jpg"),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape
                      .rectangle, // Use BoxShape.rectangle for a rectangular shape
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 585,
              child: Container(
                width: 369,
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

            const Positioned(
              left: 29,
              top: 440,
              child: SizedBox(
                width: 283,
                height: 34,
                child: Text(
                  'Vehicle Number:',
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
              left: 30,
              top: 555,
              child: SizedBox(
                width: 333,
                height: 34,
                child: Text(
                  'Upload Vehicle Photo:',
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
              left: 27,
              top: 350,
              child: SizedBox(
                width: 363,
                child: Text(
                  'Invalid Parking Report',
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
            Positioned(
              left: 17,
              top: 670,
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
                  shadows: [
                    const BoxShadow(
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
              left: 140,
              top: 680,
              child: SizedBox(
                width: 399,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 71,
              child: Container(
                width: 400,
                height: 242,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/images/ReportPage_Vehicle.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // vechicle number container
            Positioned(
              left: 15,
              top: 470,
              child: Container(
                width: 368,
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
          ],
        ),
      ),
    );
  }
}
