import 'package:flutter/material.dart';
import 'package:rootaly_task/utils/color_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06, // 5% of screen width
            vertical: 4, // Consistent vertical padding
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Greeting Text
              Expanded(
                child: Text(
                  "Hello, Jane",
                  style: TextStyle(
                    color: ColorTheme.appTitleColor(),
                    fontSize: screenWidth * 0.07, // Font size based on screen width
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Profile Icon
              Container(
                margin: EdgeInsets.only(right: screenWidth * 0.05), // Right margin based on screen width
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.5, // Slightly thinner border for responsiveness
                  ),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.account_circle,
                    size: 40, // Fixed size for the icon
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.01), // Height based on screen width
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0); // Fixed height for the app bar
}
