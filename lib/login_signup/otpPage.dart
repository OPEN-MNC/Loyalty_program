import 'package:flutter/material.dart';
import 'package:loyalty_program/customer/design.dart';

import 'package:loyalty_program/customer/nav_bar.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;

  OTPPage({required this.phoneNumber});

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  late TextEditingController _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    // Simulate auto-fill OTP received via SMS
    _otpController.text = '123456'; // Change this value to your actual OTP
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    String enteredOTP = _otpController.text;
    // Verify OTP logic here
    if (enteredOTP == '123456') {
      print('OTP verification successful');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => nav_bar_routes(),
        ),
      );
    } else {
      print('Invalid OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          'Enter OTP',
          style: midheadline,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://img.freepik.com/free-vector/enter-otp-concept-illustration_114360-7897.jpg?w=2000",
                height: 200,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Enter OTP',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verifyOTP,
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPPage(phoneNumber: '1234567890'),
                  ),
                );
              },
              child: Text('Enter OTP Page'),
            ),
          ],
        ),
      ),
    );
  }
}
