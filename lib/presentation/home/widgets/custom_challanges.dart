import 'package:flutter/material.dart';
import 'package:rootaly_task/domain/chellanges/chellangeModel.dart';

class CustomeChallanges extends StatelessWidget {
   CustomeChallanges({
    required this.challengeModel
    ,super.key});
 ChallengeModel challengeModel;
  @override
  Widget build(BuildContext context) {
    // Getting screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        height: screenHeight * 0.2,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 181, 243, 183),
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left:screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${challengeModel.title}",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 29, 83, 31),
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Container(
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 29, 59, 30),
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.003),
                        child: Text(
                          "Push Up ${challengeModel.total}x",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.030,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(20),
                        minHeight: screenHeight * 0.015,
                        value: 10 / 20, // Progress value (10 out of 20)
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color.fromARGB(255, 231, 115, 154),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    "${challengeModel.count}/${challengeModel.total} Completed",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: screenWidth * 0.03,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: screenWidth * 0.5,
                child: Image.network(challengeModel.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
