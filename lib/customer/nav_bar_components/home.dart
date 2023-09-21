import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty_program/customer/nav_bar_components/notification.dart';
import 'package:loyalty_program/customer/nav_bar_components/profile.dart';
import '../design.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<String> imageUrls = [
    'https://img.freepik.com/premium-vector/online-food-promotion-special-menu-mobile-banner_257571-220.jpg',
    'https://img.freepik.com/premium-vector/food-online-special-menu-promotion-square-banner-template-social-media-post_257571-210.jpg',
    'https://img.freepik.com/premium-vector/online-food-special-menu-promotion-mobile-social-media-banner-template_257571-222.jpg',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-deal-offer-video-ad-design-template-7860739098a2ec5f0e4bbd802c6b9308_screen.jpg?ts=1629980182',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounds,
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
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
                                "https://static.fotor.com/app/features/img/aiface/advance/2.png"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProfilePage()));
                          },
                        ),
                        const Text(
                          'Amal..                                    ',
                          style: midheadline,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const NotificationCard()));
                            },
                            icon: const Icon(
                              LineIcons.gifts,
                              color: gray,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              // Header Section

              // Featured Offers

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200, // Adjust height as needed
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: imageUrls.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 200,
                              width: 500,
                              decoration: BoxDecoration(
                                // color: Colors.black26,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imageUrls[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageUrls.map((url) {
                            int index = imageUrls.indexOf(url);
                            return Container(
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index ? primary : white,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 600,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200, // Increased height
                      // width: 150, // Decreased width
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ), // Added side spacing
                      decoration: uniDesign,
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(9.0),
                            child: Column(
                              children: [
                                Text(
                                  "Flat 50 % Off",
                                  style: HeadlineStyle,
                                ),
                                Text(
                                  "buy Exclusive 3 & get 50% discount",
                                  style: generalStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/images/banner.png"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
