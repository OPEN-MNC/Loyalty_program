import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loyalty_program/login_signup/otpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash_screens/splash_screen.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length != 10) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  void _sendOTP() async {
    if (_formKey.currentState!.validate()) {
      // Send OTP logic here
      print("Sending OTP to: ${_phoneNumberController.text}");

      // Simulate successful OTP sending
      await Future.delayed(Duration(seconds: 2));

      // Set login status to true in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      // Redirect to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OTPPage(phoneNumber: _phoneNumberController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'Mobile Phone Number',
                      ),
                      validator: _validatePhoneNumber,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _sendOTP,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 127, 187, 181),
                      onPrimary: Color.fromARGB(255, 37, 37, 37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(300, 40),
                    ),
                    child: Text('Send OTP'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







// Stack(
//         children: [
//           Positioned.fill(
//             child: CustomPaint(
//               painter: BackgroundPainter(),
//             ),
//           ),
//           Positioned.fill(
//             child: ClipRect(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
//                 child: Container(
//                   color: Colors.transparent,
//                 ),
//               ),
//             ),
//           ),