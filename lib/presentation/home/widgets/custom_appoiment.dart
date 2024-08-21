import 'package:flutter/material.dart';
import 'package:rootaly_task/domain/appoiment/appoimentModel.dart';

class CustomAppoment extends StatefulWidget {
  const CustomAppoment({super.key});

  @override
  State<CustomAppoment> createState() => _CustomAppomentState();
}

class _CustomAppomentState extends State<CustomAppoment> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      child: Container(
        height: screenHeight * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          color: const Color.fromARGB(255, 227, 238, 241),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.012),
            SizedBox(
              height: screenHeight * 0.337,
              child: GridView.builder(
                itemCount: appoimentList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   childAspectRatio: 1.25,
                  crossAxisSpacing: screenWidth * 0.01,
                  mainAxisSpacing: screenHeight * 0.005,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return CustomAppomentCard(
                    imageUrl: appoimentList[index].imageUrl,
                    title2: appoimentList[index].title2,
                    title1: appoimentList[index].title1,
                    colors: appoimentList[index].colors,
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.0043),
            Container(
              width: screenWidth * 0.2,
              height: screenHeight * 0.03,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 9, 33, 54),
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              child: const Center(
                child: Text(
                  "View All",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppomentCard extends StatelessWidget {
  CustomAppomentCard({
    super.key,
    required this.imageUrl,
    required this.title1,
    required this.title2,
    required this.colors,
  });

  final Color colors;
  final String imageUrl;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenHeight * 0.01,
      ),
      child: Container(
        height: screenHeight * 0.10,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: screenWidth * 0.06,
              child: ClipOval(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              title1,
              style: TextStyle(
                color: const Color.fromARGB(255, 8, 58, 99),
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              title2,
              style: TextStyle(
                color: const Color.fromARGB(255, 8, 58, 99),
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
