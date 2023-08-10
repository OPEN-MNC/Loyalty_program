import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import '../login_signup/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Simulate a delay for loading purposes
  Future<void> fakeLoading() async {
    await Future.delayed(Duration(seconds: 5));
  }

  @override
  void initState() {
    super.initState();
    // Load your data or perform initial setup here
    fakeLoading().then((_) {
      // Navigate to the main screen after loading
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        // builder: (BuildContext context) => const nav_bar_routes(),
        builder: (BuildContext context) => login_page(),
      ));
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w600);

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
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/diamond-removebg-preview.png",
                    height: 150),

                SizedBox(height: 55),
                Text(
                  'Welcome to H&M',
                  style: optionStyle,
                ),
                // CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final paint = Paint();

    // Draw circles
    _drawCircle(canvas, Offset(100, 100), 70,
        Color.fromARGB(255, 255, 1, 213).withOpacity(0.4));
    _drawCircle(canvas, Offset(250, 200), 90,
        Color.fromARGB(255, 153, 0, 255).withOpacity(0.4));
    _drawCircle(canvas, Offset(350, 400), 120,
        Color.fromARGB(255, 255, 0, 0).withOpacity(0.4));

    // Draw triangles
    _drawTriangle(
      canvas,
      Offset(100, size.height - 50),
      Offset(200, size.height - 50),
      Offset(150, size.height - 150),
      const Color.fromARGB(255, 217, 0, 255).withOpacity(0.4),
    );
    _drawTriangle(
      canvas,
      Offset(size.width - 100, size.height - 100),
      Offset(size.width - 200, size.height - 150),
      Offset(size.width - 150, size.height - 250),
      Color.fromARGB(255, 0, 255, 234).withOpacity(0.4),
    );
  }

  void _drawCircle(Canvas canvas, Offset center, double radius, Color color) {
    final paint = Paint()..color = color;
    canvas.drawCircle(center, radius, paint);
  }

  void _drawTriangle(
      Canvas canvas, Offset p1, Offset p2, Offset p3, Color color) {
    final path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..close();
    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
