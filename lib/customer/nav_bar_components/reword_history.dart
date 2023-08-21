import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class RewardScratcherCard extends StatefulWidget {
  final String backgroundImageUrl;
  final VoidCallback onScratchComplete;

  RewardScratcherCard({
    required this.backgroundImageUrl,
    required this.onScratchComplete,
  });

  @override
  _RewardScratcherCardState createState() => _RewardScratcherCardState();
}

class _RewardScratcherCardState extends State<RewardScratcherCard> {
  bool _isRevealed = false;
  double _scratchAreaPercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scratcher(
      accuracy: ScratchAccuracy.low,
      threshold: 0.6, // Set the threshold to 60%
      brushSize: 50,
      onThreshold: () {
        setState(() {
          _isRevealed = true;
        });
        widget.onScratchComplete();
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Add rounded corners
          image: DecorationImage(
            image: NetworkImage(widget.backgroundImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: _isRevealed
            ? null
            : FractionallySizedBox(
                widthFactor: _scratchAreaPercent,
                heightFactor: 1.0,
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.yellow, // Change color to "yolo"
                ),
              ),
      ),
      onChange: (value) {
        setState(() {
          _scratchAreaPercent = value;
        });
      },
    );
  }
}

class RewardSection extends StatelessWidget {
  final List<String> rewardImageUrls = [
    'https://media.istockphoto.com/id/1351312392/vector/illustration-of-hand-playing-scratch-card-on-the-black-mobile-idea-for-online-gambling.jpg?s=612x612&w=0&k=20&c=q3Ssj3ohRfhGGtx6BTqdgjBqTZfAO2KXfOCYR2WEO5Q=',
    'https://4.imimg.com/data4/GV/RI/MY-1466179/snakker-scratch-card-500x500.jpg', // Add more reward image URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward Section'),
      ),
      body: ListView.builder(
        itemCount: rewardImageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RewardScratcherCard(
              backgroundImageUrl: rewardImageUrls[index],
              onScratchComplete: () {
// You can add a delay before showing the dialog
                Future.delayed(Duration(seconds: 3), () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You won a reward!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
