import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loyalty_program/login_signup/login.dart'; // Import your login page here
import 'package:shared_preferences/shared_preferences.dart';

import '../customer/design.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _handleSignOut(context); // Call the sign out function
      },
      style: ElevatedButton.styleFrom(
        primary: white, // Set background color to white
        onPrimary: Colors.black, // Set text color to black
        minimumSize: Size(70, 30),
        shape: RoundedRectangleBorder(
          // Add rounded border
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Row(
          children: [
            Text(
              "Log out",
              style: midheadline,
            ),
            SizedBox(width: 20),
            Icon(Icons.logout_outlined),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignOut(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    // After signing out, navigate to the login page or any other page as needed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => login_page(),
      ),
    );
  }
}



// return ElevatedButton(
    //   onPressed: () async {
    //     SharedPreferences prefs = await SharedPreferences.getInstance();
    //     prefs.setBool('isLoggedIn', false);

    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => login_page(),
    //       ),
    //     );
    //   },
    //   style: ElevatedButton.styleFrom(
    //     primary: white, // Set background color to white
    //     onPrimary: Colors.black, // Set text color to black
    //     minimumSize: Size(70, 30),
    //     shape: RoundedRectangleBorder(
    //       // Add rounded border
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(11.0),
    //     child: Row(
    //       children: [
    //         Text(
    //           "Log out",
    //           style: midheadline,
    //         ),
    //         SizedBox(width: 20),
    //         Icon(Icons.logout_outlined),
    //       ],
    //     ),
    //   ),
    // );