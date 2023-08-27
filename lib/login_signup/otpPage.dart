import 'package:flutter/material.dart';
import 'package:loyalty_program/customer/design.dart';

import 'package:loyalty_program/customer/nav_bar.dart';

import '../manager/manager_nav_bar.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;

  const OTPPage({super.key, required this.phoneNumber});

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
          builder: (context) => const nav_bar_routes(),
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
        title: const Text(
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
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Enter OTP',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verifyOTP,
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class otpLogin_page extends StatelessWidget {
  const otpLogin_page({Key? key}) : super(key: key);

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
                    builder: (context) =>
                        const OTPPage(phoneNumber: '1234567890'),
                  ),
                );
              },
              child: const Text('Enter OTP Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPPagemanager extends StatefulWidget {
  final String phoneNumbermanager;

  const OTPPagemanager({required this.phoneNumbermanager});

  @override
  _OTPPagemanagerState createState() => _OTPPagemanagerState();
}

class _OTPPagemanagerState extends State<OTPPagemanager> {
  late TextEditingController _otpControllers;

  @override
  void initState() {
    super.initState();
    _otpControllers = TextEditingController();
    // Simulate auto-fill OTP received via SMS
    _otpControllers.text = '123456'; // Change this value to your actual OTP
  }

  @override
  void dispose() {
    _otpControllers.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    String enteredOTP = _otpControllers.text;
    // Verify OTP logic here
    if (enteredOTP == '123456') {
      print('OTP verification successful');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => nav_Bar_Manager_rout(),
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
        title: const Text(
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
                "https://cdni.iconscout.com/illustration/premium/thumb/otp-authentication-security-5053897-4206545.png",
                height: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _otpControllers,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Enter OTP',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verifyOTP,
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class otpLogin_pagemanager extends StatefulWidget {
  const otpLogin_pagemanager({Key? key}) : super(key: key);

  @override
  State<otpLogin_pagemanager> createState() => _otpLogin_pagemanagerState();
}

class _otpLogin_pagemanagerState extends State<otpLogin_pagemanager> {
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
                    builder: (context) =>
                        const OTPPagemanager(phoneNumbermanager: '1234567890'),
                  ),
                );
              },
              child: const Text('Enter OTP Page'),
            ),
          ],
        ),
      ),
    );
  }
}
