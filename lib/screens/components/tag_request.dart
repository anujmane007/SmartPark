import 'dart:convert';
 import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;

class tag_request extends StatefulWidget {
  const tag_request({Key? key}) : super(key: key);

  @override
  State<tag_request> createState() => _tag_requestState();
}

class _tag_requestState extends State<tag_request> {
  String? selectedVehicleType;
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 120,
                child: Container(
                  width: 389,
                  height: 273,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/registration_page.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 445,
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
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 35,
                top: 410,
                child: SizedBox(
                  width: 333,
                  height: 34,
                  child: Text(
                    'Username:',
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
                left: 35,
                top: 560,
                child: SizedBox(
                  width: 211,
                  height: 34,
                  child: Text(
                    'Choose Request:',
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
                top: 595,
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
                  child: DropdownButton<String>(
                    hint: const Text(
                      "Select",
                      style: TextStyle(fontSize: 30),
                    ),
                    value: selectedVehicleType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedVehicleType = newValue;
                      });
                    },
                    items: ['Maintenance', 'New Installation'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 700,
                child: GestureDetector(
                  onTap: () {
                    sendRequestEmail();
                  },
                  child: Container(
                    width: 350,
                    height: 72,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3BB403),
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
                        'Send request',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 23,
                top: 17,
                child: SizedBox(
                  width: 343,
                  height: 122,
                  child: Text(
                    'SmartPark',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF00DE65),
                      fontSize: 64,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendRequestEmail() async {
    const apiKey = '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'; // Replace with your actual SendGrid API key
    final url = Uri.parse('https://api.sendgrid.com/v3/mail/send');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'personalizations': [
        {
          'to': [
            {'email': 'anujmane007@gmail.com'}, // Replace with your email
          ],
          'subject': 'Tag Request',
        },
      ],
      'from': {'email': 'vmane5785@gmail.com'}, // Replace with your SendGrid verified email
      'content': [
        {
          'type': 'text/plain',
          'value': 'Username: ${usernameController.text}\nRequest Type: $selectedVehicleType',
        },
      ],
    });

   try {
  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 202) {
    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Email sent successfully.'),
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

    // You can also perform additional actions or navigate to another screen here
  } else {
    // Show error dialog
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text('Failed to send email. Status code: ${response.statusCode}'),
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
    // Handle the error, show an error message, or navigate to an error screen
  }
} catch (e) {
  // Show error dialog for exceptions
  // ignore: use_build_context_synchronously
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text('Error sending email: $e'),
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
  // Handle the error, show an error message, or navigate to an error screen
}
  }
}