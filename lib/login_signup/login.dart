import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loyalty_program/customer/nav_bar.dart';
import 'package:loyalty_program/login_signup/otpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../customer/design.dart';
import '../splash_screens/splash_screen.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
//  This section is google verify section

  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: ['email'],
  //   serverClientId:
  //       '519946534626-322rv82tbj9dgpstd2lrpjurlmmgt4v0.apps.googleusercontent.com', // OAuth  client id
  // );

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // User successfully signed in, store user data and navigate
        await _storeUserData(googleUser);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => nav_bar_routes()),
        );
      } else {
        // User cancelled the sign-in process
        print('Google Sign-In Cancelled');
      }
    } catch (error) {
      print('Google Sign-In Error: $error');
    }
  }

  // In the _storeUserData function, handle the case when user.photoUrl is null:
  Future<void> _storeUserData(GoogleSignInAccount user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', user.displayName ?? '');
    prefs.setString('userEmail', user.email);
    prefs.setString('userPhotoUrl', user.photoUrl ?? ''); // Handle null case
    prefs.setBool('isLoggedIn', true);
  }

  // Here is log in with OTP section

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
                  Image.network(
                    "https://cdni.iconscout.com/illustration/premium/thumb/login-3305943-2757111.png",
                    height: 200,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(
                                  172, 134, 214, 1)), // Border color
                        ),
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
                      minimumSize: Size(400, 40),
                    ),
                    child: Text('Send OTP'),
                  ),

                  // this section is google signin authentication .

                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _handleSignIn,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Creamy white bright color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Border radius of 20
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: uniDesign,
                            child: Center(
                              child: Image.network(
                                'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png',
                                height: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
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
