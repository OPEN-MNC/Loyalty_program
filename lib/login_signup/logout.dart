import 'package:flutter/material.dart';
import 'package:loyalty_program/login_signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import your login page here

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLoggedIn', false);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => login_page(),
                ),
              );
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}
