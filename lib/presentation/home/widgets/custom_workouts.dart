import 'package:flutter/material.dart';
import 'package:rootaly_task/domain/rouins/routinsModel.dart';

class CustomWorkOutes extends StatelessWidget {
  CustomWorkOutes({
    required this.routinList,
    super.key,
  });

  final List<RoutinsModel> routinList;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            child: ListView.builder(
              itemCount: routinList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomWorkCard(
                  content: routinList[index].weight,
                  dific: routinList[index].difficulty,
                  imageUrl: routinList[index].image,
                  title: routinList[index].title,
                  type: routinList[index].type,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomWorkCard extends StatelessWidget {
  const CustomWorkCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.dific,
    required this.type,
  });

  final String imageUrl;
  final String title;
  final String content;
  final String type;
  final String dific;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 6),
      child: Container(
        width: screenWidth * 0.8, // Responsive width
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.3, // Responsive width for image
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 235, 176),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitHeight, // Change to cover to fill the image area
                  width: screenWidth * 0.3, // Make sure the image width fits the container
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.02), // Responsive spacing
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        color: const Color.fromARGB(255, 3, 49, 87),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      type,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03, // Responsive font size
                        color: const Color.fromARGB(255, 3, 49, 87),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                      width: screenWidth * 0.25, // Responsive width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          content,
                          style: TextStyle(fontSize: screenWidth * 0.03), // Responsive font size
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Difficulty: ',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03, // Responsive font size
                            color: const Color.fromARGB(255, 3, 49, 87),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          dific,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03, // Responsive font size
                            color: const Color.fromARGB(255, 182, 114, 13),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
