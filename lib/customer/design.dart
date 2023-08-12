import 'package:flutter/material.dart';

const Color gray = Color.fromARGB(255, 160, 160, 160);
const Color white = Colors.white;
const Color primary = Color.fromARGB(255, 160, 44, 255);

const TextStyle HeadlineStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w400);
const TextStyle generalStyle =
    TextStyle(fontSize: 11, fontWeight: FontWeight.w400);
const TextStyle midheadline =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

const Color backgrounds = Colors.white12;
// Universal design variable sectionor design function
final BoxDecoration uniDesign = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: white, // Bright white creamy color
  boxShadow: [
    BoxShadow(
      color:
          Color.fromARGB(255, 160, 160, 160).withOpacity(0.3), // Shadow color
      spreadRadius: 3,
      blurRadius: 10,
      offset: Offset(0, 3), // Offset in the x and y direction
    ),
  ],
  // Add other properties like color, boxShadow, etc. here
);



// background section 


