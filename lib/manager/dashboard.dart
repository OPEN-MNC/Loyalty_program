import 'package:flutter/material.dart';
import 'package:loyalty_program/customer/design.dart';

class dashboard_page extends StatelessWidget {
  const dashboard_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Dashboard",
          style: HeadlineStyle,
        ),
      ),
    );
  }
}
