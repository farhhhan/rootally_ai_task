import 'package:flutter/material.dart';
import 'package:rootaly_task/domain/assesment/assesment_model.dart';
import 'package:rootaly_task/presentation/assestment/assesment_screen.dart';
import 'package:rootaly_task/utils/color_theme.dart';

class CustomAssesment extends StatelessWidget {
  CustomAssesment({required this.assesmentList, super.key});

  final List<AssessmentModel> assesmentList;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    List colors = [
      ColorThemes.lightOrange(),
      ColorThemes.lightGreen(),
    ];
        List fits = [
     BoxFit.contain,
      BoxFit.cover,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenHeight * 0.01,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 227, 238, 241),
        ),
        height: screenHeight * 0.4, // Make height responsive
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              height: screenHeight * 0.34, // Make ListView height responsive
              child: ListView.builder(
                itemCount: assesmentList.length,
                itemBuilder: (context, index) {
                  return CustomAssesmentCard(
                    boxits: fits[index],
                    colors: colors[index % colors.length], // Handle color index
                    imageUrl: assesmentList[index].image,
                    content: assesmentList[index].content,
                    title: assesmentList[index].title,
                    paddings: screenWidth * 0.03,
                    val1: screenHeight * 0.01,
                    sizess: screenWidth * 0.040,
                    heroTag: 'health-risk-assessment', 
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.003),
            Container(
              width: screenWidth * 0.2, // Responsive width
              height: screenHeight * 0.03, // Responsive height
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 9, 33, 54),
                borderRadius: BorderRadius.circular(20),
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

class CustomAssesmentCard extends StatelessWidget {
  CustomAssesmentCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.paddings,
    required this.val1,
    required this.sizess,
    required this.heroTag,
    required this.colors,
    required this.boxits
  });
  final BoxFit boxits;
  final Color colors;
  final double paddings;
  final double val1;
  final double sizess;
  final String imageUrl;
  final String title;
  final String content;
  final String heroTag;
  
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenHeight * 0.005,
      ),
      child: Container(
        height: screenHeight * 0.16, // Make height responsive
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth * 0.34, // Make width responsive
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: colors,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20),
                    ),
                  ),
                  child: Hero(
                    tag: heroTag,
                    child: Image.network(
                      imageUrl,
                      fit:boxits, // Adjusted for responsiveness
                      width: screenWidth * 0.30,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: paddings, vertical: val1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: sizess,
                        color: const Color.fromARGB(255, 3, 49, 87),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Text(
                        '$content.',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                         if(title =="Health Risk Assesment"){
                          Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              AssestmentScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(opacity: animation, child: child);
                          },
                          transitionDuration: Duration(milliseconds: 1000),
                        ),
                      );
                         }
                      },
                      child: const Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "START",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
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
