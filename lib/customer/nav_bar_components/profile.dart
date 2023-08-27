import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty_program/customer/design.dart';

import '../../login_signup/logout.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final double _profile_complete_process =
      100; // Change this to a value between 0 and 100
  final int _gift = 16;
  // ignore: unused_field
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                height: 220,
                width: 500,
                decoration: uniDesign,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://static.fotor.com/app/features/img/aiface/advance/2.png",
                        ),
                        radius: 40, // Increased radius
                      ),
                      const SizedBox(height: 10),
                      const Text("Sumon Malik",
                          style: TextStyle(color: primary, fontSize: 17)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                LineIcons.coins,
                                color: Colors.yellow,
                                size: 30,
                              ),
                              const SizedBox(height: 10),
                              Text("₹ ${_profile_complete_process.toString()}",
                                  style: midheadline),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                LineIcons.gift,
                                color: primary,
                                size: 30,
                              ),
                              const SizedBox(height: 10),
                              Text("${_gift.toString()}", style: midheadline),
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      value: _profile_complete_process / 100.0,
                                      strokeWidth: 3,
                                      backgroundColor: Colors.grey,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.green),
                                    ),
                                  ),
                                  Text(
                                    '${_profile_complete_process.toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text("Profile complete",
                                  style:
                                      TextStyle(color: primary, fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                      //---------------------------------
                    ],
                  ),
                ),
              ),
              //---------------------------------------------
              const SizedBox(height: 20),
              Container(
                width: 500,
                decoration: uniDesign,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  LineIcons.phone,
                                  color: gray,
                                  size: 25,
                                ),
                                SizedBox(width: 20),
                                Text("+91 6289641864", style: midheadline),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  LineIcons.calendar,
                                  color: gray,
                                  size: 25,
                                ),
                                // SizedBox(width: 20),
                                Text("DOB :    25/05/2023", style: midheadline),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  LineIcons.calendar,
                                  color: gray,
                                  size: 25,
                                ),
                                // SizedBox(width: 20),
                                Text("Anniversary:  05/10/2023",
                                    style: midheadline),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  LineIcons.mailBulk,
                                  color: gray,
                                  size: 25,
                                ),
                                // SizedBox(width: 20),
                                Text("  suman@gmail.com", style: midheadline),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Age : ", style: midheadline),
                                // SizedBox(width: 20),
                                Text("29", style: midheadline),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Gender : ", style: midheadline),
                                // SizedBox(width: 20),
                                Text("Male", style: midheadline),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 300),
                          child: IconButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => edit_details()),
                              // );
                              _showPopup(context);
                            },
                            icon: const Icon(
                              LineIcons.edit,
                              color: gray,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: uniDesign,
                child: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Row(children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Settings",
                      style: midheadline,
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: uniDesign,
                child: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Row(children: [
                    Icon(LineIcons.lock),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "lock",
                      style: midheadline,
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              LogoutButton(),

              /// ------- logout  button
            ],
          ),
        ),
      ),
    );
  }
}

// details edit page

void _showPopup(BuildContext context) {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _anniversaryController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? _selectedGender;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('Update Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _dobController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(172, 134, 214, 1)),
                    ),
                    prefixIcon: const Icon(
                      LineIcons.birthdayCake,
                      color: gray,
                      size: 25,
                    ),
                    labelText: 'Enter your DOB',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _anniversaryController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(172, 134, 214, 1)),
                    ),
                    prefixIcon: const Icon(
                      LineIcons.ring,
                      color: gray,
                      size: 25,
                    ),
                    labelText: 'Enter Anniversary date',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(172, 134, 214, 1)),
                    ),
                    prefixIcon: const Icon(
                      LineIcons.birthdayCake,
                      color: gray,
                      size: 25,
                    ),
                    labelText: 'Enter your age',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Select your Gender",
                  style: midheadline,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const Icon(Icons.male),
                    Radio<String>(
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const Icon(LineIcons.female),
                    Radio<String>(
                      value: 'Other',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const Text('Other'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                        minimumSize: const Size(70, 30),
                      ),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform update logic here
                        Navigator.of(context)
                            .pop(); // Close the popup after update
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                        minimumSize: const Size(70, 30),
                      ),
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => LogoutButton()),
// );
