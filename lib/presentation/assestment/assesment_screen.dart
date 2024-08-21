import 'package:flutter/material.dart';
import 'package:rootaly_task/presentation/assestment/widgets/animated_hero.dart';
import 'package:rootaly_task/presentation/assestment/widgets/custom_circle.dart';
import 'package:rootaly_task/presentation/assestment/widgets/custom_graph.dart';
import 'package:rootaly_task/presentation/assestment/widgets/custom_headtext.dart';
import 'package:rootaly_task/presentation/assestment/widgets/custom_rowButton.dart';
import 'package:rootaly_task/presentation/assestment/widgets/linepoint.dart';
import 'dart:math' as math;

class AssestmentScreen extends StatefulWidget {
  const AssestmentScreen({Key? key}) : super(key: key);

  @override
  _AssestmentScreenState createState() => _AssestmentScreenState();
}

class _AssestmentScreenState extends State<AssestmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
   double containerWidth = screenWidth * 0.8; // 80% of screen width
    double containerHeight = screenHeight * 0.05; // Adjust height as needed
    double iconSize = screenWidth * 0.05; // Adjust icon size as needed
    double textSize = screenWidth * 0.02; // Adjust text size as needed
    double padding = screenWidth * 0.004; // Adjust padding as needed
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 97, 97),
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: screenHeight * 0.34,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 229, 255, 223),
                  Color.fromARGB(255, 154, 248, 157),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.08,
          left: screenWidth * 0.08,
          right: screenWidth * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                "Health Risk Assessment",
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  color: const Color.fromARGB(255, 7, 38, 63),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                width: screenWidth * 0.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer_outlined, size: 18),
                      SizedBox(width: screenWidth * 0.01),
                      const Text('4 min'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedHeroWidget(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: screenHeight *
                0.7, // Adjust this to control the container height
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Positioned(
                    bottom: screenHeight * 0.343,
                    right: screenWidth * 0.15,
                    child: CustomCircularProgressIndicator(
                      progress: 30 / 40,
                      backgroundColor: const Color.fromARGB(255, 219, 211, 211),
                      valueColor: const Color.fromARGB(255, 201, 233, 202),
                      strokeWidth: screenWidth * 0.029,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_headText(
                        texts: 'What do you get ?',
                      ),
                      SizedBox(height: screenHeight * 0.020),
                      buildHomeButtons(context),
                      SizedBox(height: screenHeight * 0.03),
                      custom_headText(
                        texts: 'How we do it?',
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 227, 238, 241),
                          ),
                          width: screenWidth,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              SizedBox(height: screenHeight * 0.15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.018),
                                      child: Container(
                                        width: containerWidth,
                                        height: containerHeight,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 197, 236, 197),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(padding),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.security,
                                                  color: const Color.fromARGB(
                                                      255, 84, 139, 86),
                                                  size: iconSize,
                                                ),
                                                SizedBox(
                                                    width: screenWidth *
                                                        0.02), // Adjust space between icon and text
                                                Text(
                                                  'We do not store or share your personal data',
                                                  style: TextStyle(
                                                    fontSize: textSize,
                                                    color: const Color.fromARGB(
                                                        255, 123, 124, 121),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              LinePoints(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.21,
          right: screenWidth * 0.10,
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/b603/3469/9057244d99ced357762157c36801f8c9?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hnsk52VUWsAYt4rrFXCQqSyA77xyWS0Q438idmk3H4a3YIFa~G8Okn8ujUMraX98~szD0DvoYDxjOWUflXu2UC4WYoT47NHSncKdSlC1qtwiSU94w90IylGMUqtK8jZeR96JrUbBL9gU3aUphpEBZDMr2EvlDaYCK~NEt0v7BxZaAJdm5YQASqD41bDSO7OgcqR0EbioEBT7JSaHwOvEZVeZIDgvZnhXGFFR5doD0DIphK0pzz3BHBzh-CIia68BQ881Xqyrp4eH0deo3vQuYOJD1iHGQMD2ah3c8C4tX27AAHH~uVXeMgwtjLz4jSV54Ul8N13kltQ3VkS8XfdR-g__',
            height: screenHeight * 0.28,
            width: screenWidth * 0.75,
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.31,
          right: screenWidth * 0.25,
          child: Transform.rotate(
            angle: 20 * math.pi / 180,
            child: Container(
              width: screenWidth * 0.5,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color.fromARGB(255, 187, 238, 189),
                    const Color.fromARGB(0, 235, 214, 214),
                  ],
                  stops: [0.0, 0.4],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.23,
          right: screenWidth * 0.10,
          child: Container(
            width: screenWidth * 0.75,
            height: screenHeight * 0.35,
            child: CustomPaint(
              painter: GraphPainter(),
            ),
          ),
        ),
      ]),
    );
  }
}
