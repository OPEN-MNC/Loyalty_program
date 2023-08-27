import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty_program/manager/component/bar_chart.dart';
import 'package:loyalty_program/manager/manager_profile.dart';
import 'package:loyalty_program/manager/notification_manager.dart';

import '../customer/design.dart';

class Dashboard_Page extends StatefulWidget {
  const Dashboard_Page({Key? key}) : super(key: key);

  @override
  _Dashboard_PageState createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {
  bool _showAll = false;
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
              //------------------------------------------------

              bar_chart(),

              //------------------------------------------------

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) {
                    return Container(
                      width: 400,
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'New Arrival',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Check out our latest collection of products',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '2h ago',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Just now',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              if (_showAll)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10, // Replace with the actual item count
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      // ... Your existing notification content ...
                    );
                  },
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showAll = !_showAll;
                  });
                },
                child: Text(_showAll ? 'See Less' : 'See More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
