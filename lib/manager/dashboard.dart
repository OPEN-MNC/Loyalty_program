import 'package:flutter/material.dart';
import 'package:loyalty_program/customer/design.dart';

class nav_Bar_Manager_rout extends StatelessWidget {
  const nav_Bar_Manager_rout({super.key});

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
