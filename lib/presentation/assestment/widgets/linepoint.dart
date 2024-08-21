import 'package:flutter/material.dart';

class LinePoints extends StatelessWidget {
  const LinePoints({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    // Determine padding, font size, and spacing based on screen size
    final double horizontalPadding = screenWidth * 0.02; // 6% of screen width
    final double verticalPadding = screenHeight * 0.02; // 2% of screen height
    final double fontSize = screenWidth * 0.0314; // 4% of screen width
    final double lineSpacing = screenHeight * 0.01; // 1% of screen height

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. Ensure that you are in a well-lit space',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
          SizedBox(height: lineSpacing),
          Text(
            '2. Allow camera access and place your device',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
          Text(
            '   against a stable object or wall',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
          SizedBox(height: lineSpacing),
          Text(
            '3. Avoid wearing baggy clothes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
          SizedBox(height: lineSpacing),
          Text(
            '4. Make sure you exercise as per instruction',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
          Text(
            '  provided by the trainer',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
