import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design.dart';

class RewardCard extends StatelessWidget {
  RewardCard({super.key});
  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Text copied to clipboard')),
    );
  }

  final List<String> discountImages = [
    'https://media.istockphoto.com/id/1351312392/vector/illustration-of-hand-playing-scratch-card-on-the-black-mobile-idea-for-online-gambling.jpg?s=612x612&w=0&k=20&c=q3Ssj3ohRfhGGtx6BTqdgjBqTZfAO2KXfOCYR2WEO5Q=',
    'https://media.istockphoto.com/id/1351312392/vector/illustration-of-hand-playing-scratch-card-on-the-black-mobile-idea-for-online-gambling.jpg?s=612x612&w=0&k=20&c=q3Ssj3ohRfhGGtx6BTqdgjBqTZfAO2KXfOCYR2WEO5Q=',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQan5ymH_RIbm0xUgXlPtTgmmKvipqgetZGg&usqp=CAU',
    'https://4.imimg.com/data4/GV/RI/MY-1466179/snakker-scratch-card-500x500.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUh5LUfG0-km2H2ea4oeSax78g2gC6XlPXVA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIxbLZ5z_r-Q0zgCMaSIe1DNDNkgTiE-nvNQ&usqp=CAU',
    'https://4.imimg.com/data4/GV/RI/MY-1466179/snakker-scratch-card-500x500.jpg', // Add more reward image URLs
  ];

  final List<String> discountcopy = [
    "company name ",
    "samy one name ",
    "my mode name ",
    "rupa name ",
    "nimputi khanu ",
    "rahul sarma ",
    "surat mancom"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemCount: discountImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: uniDesign,
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "50% OFF",
                          style: HeadlineStyle,
                        ),
                        Container(
                          width: 101,
                          decoration: BoxDecoration(
                            color: lightgray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              discountcopy[index],
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    //--------------
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            discountImages[index],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Code to copy text
                            copyToClipboard(context, discountcopy[index]);
                          },
                          icon: Icon(Icons.copy),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
