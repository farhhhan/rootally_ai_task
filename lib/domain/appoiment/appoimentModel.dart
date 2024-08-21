import 'package:flutter/material.dart';

class AppoimentModel {
  String imageUrl;
  String title1;
  String title2;
  Color colors;
  AppoimentModel(
      {required this.colors,
      required this.imageUrl,
      required this.title1,
      required this.title2});
}

List<AppoimentModel> appoimentList = [
  AppoimentModel(
      imageUrl: 'images/cancer.png',
      title2: 'Opinion',
      title1: 'Cancer 2nd',
      colors: Color.fromARGB(255, 152, 195, 230)),
  AppoimentModel(
      imageUrl: 'images/atack.png',
      title2: 'Appointment',
      title1: 'Physiotherapy ',
      colors: Color.fromARGB(255, 220, 167, 233)),
  AppoimentModel(
      imageUrl: 'images/weight.png',
      title2: 'Appointment',
      title1: 'Fitness  ',
      colors: Color.fromARGB(255, 253, 194, 194)),
];
