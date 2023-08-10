import 'package:flutter/material.dart';
import 'package:loyalty_program/customer/nav_bar.dart';

import 'package:shared_preferences/shared_preferences.dart';

// Replace with your actual home page widget
import 'splash_screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // Your theme data here
          ),
      home: isLoggedIn ? nav_bar_routes() : SplashScreen(),
    );
  }
}
