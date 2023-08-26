import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty_program/manager/component/bar_chart.dart';
import 'package:loyalty_program/manager/manager_profile.dart';
import 'package:loyalty_program/manager/notification.dart';

import '../customer/design.dart';

class Dashboard_Page extends StatefulWidget {
  const Dashboard_Page({Key? key}) : super(key: key);

  @override
  _Dashboard_PageState createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff161621),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 60,
                width: 500,
                decoration: uniDesign,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   width: 20,
                        // ),
                        InkWell(
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://image.cnbcfm.com/api/v1/image/107241090-1684160036619-gettyimages-1255019394-AFP_33F44YL.jpeg?v=1685596344"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProfilePagemanager()));
                          },
                        ),
                        const Text(
                          'Elon Musk                         ',
                          style: midheadline,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Notification_manager()));
                            },
                            icon: const Icon(
                              LineIcons.bell,
                              color: gray,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              // Header Section
              SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 165,
                    decoration: uniDesign,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Active User",
                            style: midheadline,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.person_outlined,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                "600k",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 165,
                    decoration: uniDesign,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "User discount day",
                            style: midheadline,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.groups_2_outlined,
                                color: primary,
                                size: 30,
                              ),
                              Text(
                                "25",
                                style: TextStyle(color: primary, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //----------------------------------------------------
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 165,
                    decoration: uniDesign,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Claim Coupon",
                            style: midheadline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                LineIcons.gifts,
                                color: Colors.orange,
                                size: 30,
                              ),
                              Text(
                                "158",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 165,
                    decoration: uniDesign,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Active coupons",
                            style: midheadline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                LineIcons.gifts,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                "44",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "  Your sells track (2023)",
                style: TextStyle(color: primary, fontSize: 20),
              ),

              bar_chart(),
            ],
          ),
        ),
      ),
    );
  }
}
