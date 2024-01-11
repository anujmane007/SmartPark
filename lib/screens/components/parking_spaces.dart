// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ParkingSpaces extends StatefulWidget {
  @override
  _ParkingSpacesState createState() => _ParkingSpacesState();
}

class _ParkingSpacesState extends State<ParkingSpaces> {
  List<bool> isButtonDisabledListLeft = List.generate(11, (index) => false);
  List<bool> isButtonDisabledListRight = List.generate(11, (index) => false);
  
  get screenWidth => null;
  
  get screenHeight => null;

  void disableButtonLeft(int index) {
    setState(() {
      isButtonDisabledListLeft[index] = true;
    });
  }

  void disableButtonRight(int index) {
    setState(() {
      isButtonDisabledListRight[index] = true;
    });
  }

  int getEnabledButtonCount(List<bool> buttonList) {
    return buttonList.where((disabled) => !disabled).length;
  }

  @override
  Widget build(BuildContext context) {
    int enabledButtonCountLeft =
        getEnabledButtonCount(isButtonDisabledListLeft);
    int enabledButtonCountRight =
        getEnabledButtonCount(isButtonDisabledListRight);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.21, 0.98),
              end: Alignment(0.21, -0.98),
              colors: [Color(0xFF1C08FF), Color(0xFF3EFFFF)],
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
                        right: 40,
                        child: Container(
                          width: 350,
                          height: 50,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xFFFF6D03), Color(0xFFFFB800)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
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
                              'Your Location',
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
                      Positioned(
                        top: 80,
                        left: 60,
                        right: 60,
                        child: Container(
                          width: 430,
                          height: 35,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color.fromARGB(255, 233, 129, 56),
                                Color.fromARGB(255, 124, 240, 29)
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
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
                              'Raviwar Peth',
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
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color.fromARGB(255, 233, 129, 56),
                                          Color.fromARGB(255, 124, 240, 29)
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      shadows: [
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
                                        style: TextStyle(
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
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color.fromARGB(255, 233, 129, 56),
                                        Color.fromARGB(255, 124, 240, 29)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    shadows: [
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
                              Positioned(
                                  right: 40,
                                  child: Container(
                                    width: 60,
                                    height: 40,
                                    decoration: ShapeDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color.fromARGB(255, 233, 129, 56),
                                          Color.fromARGB(255, 124, 240, 29)
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      shadows: [
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
                                        style: TextStyle(
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
              Positioned(
                top: 175,
                left: -15,
                child: Container(
                  width: 430,
                  height: 600,
                  //color: Colors.orange.withOpacity(0.1),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 40,
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
                                            disableButtonLeft(index);
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          isButtonDisabledListLeft[index]
                                              ? Colors.grey
                                              : Colors.blue,
                                      minimumSize: Size(50, 50),
                                    ),
                                    child: Text((index + 1).toString()),
                                  ),
                                  SizedBox(height: 10), // Add spacing here
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
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
                                            disableButtonRight(index);
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          isButtonDisabledListRight[index]
                                              ? Colors.grey
                                              : Colors.blue,
                                      minimumSize: Size(50, 50),
                                    ),
                                    child: Text((index + 1).toString()),
                                  ),
                                  SizedBox(height: 10), // Add spacing here
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 95, // Adjust the left position based on your layout
                        top: 0, // Adjust the top position based on your layout
                        child: Container(
                          width: 250,
                          height: 600,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/park_fast2.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
