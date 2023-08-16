import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty_program/customer/design.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  double _profile_complete_process =
      43; // Change this to a value between 0 and 100
  int _gift = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 210,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white, // Change the color as needed
                borderRadius: BorderRadius.circular(15), // Add border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://static.fotor.com/app/features/img/aiface/advance/2.png",
                      ),
                      radius: 40, // Increased radius
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sumon Malik",
                      style: midheadline,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              LineIcons.coins,
                              color: gray,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "₹ ${_profile_complete_process.toString()}",
                              style: midheadline,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              LineIcons.gift,
                              color: gray,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${_gift.toString()}",
                              style: midheadline,
                            ),
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
                                        AlwaysStoppedAnimation<Color>(primary),
                                  ),
                                ),
                                Text(
                                  '${_profile_complete_process.toStringAsFixed(0)}%',
                                  style:
                                      TextStyle(color: primary, fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Profile complete",
                              style: generalStyle,
                            ),
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
          ],
        ),
      ),
    );
  }
}
