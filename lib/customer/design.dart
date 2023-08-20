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
  color: Colors.white, // Change the color as needed
  borderRadius: BorderRadius.circular(20), // Add border radius
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 3),
    ),
  ],
);

//----  universial textbox decoration
InputDecoration _customInputDecoration(String labelText, IconData prefixIcon) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Color.fromRGBO(172, 134, 214, 1), // Border color
      ),
    ),
    prefixIcon: Icon(
      prefixIcon,
      color: gray,
      size: 25,
    ),
    labelText: labelText,
  );
}

// background section
