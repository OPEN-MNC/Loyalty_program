import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty_program/manager/dashboard.dart';
import 'package:loyalty_program/manager/manager_profile.dart';
import 'package:loyalty_program/manager/offer_upload_changes.dart';

class nav_Bar_Manager_rout extends StatefulWidget {
  const nav_Bar_Manager_rout({super.key});
  static final List<Widget> _widgetOptions = <Widget>[
    const Dashboard_Page(),
    // const Text(
    //   'Offers',
    //   style: HeadlineStyle,
    // ),
    const offers_page(),
    ProfilePagemanager(),
  ];

  @override
  State<nav_Bar_Manager_rout> createState() => _nav_Bar_Manager_routState();
}

class _nav_Bar_Manager_routState extends State<nav_Bar_Manager_rout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: nav_Bar_Manager_rout._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: const Color.fromARGB(255, 129, 129, 129),
              tabs: const [
                GButton(
                  icon: Icons.auto_graph,
                  text: 'Dashboard',
                ),
                GButton(
                  icon: LineIcons.gift,
                  text: 'offers',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
