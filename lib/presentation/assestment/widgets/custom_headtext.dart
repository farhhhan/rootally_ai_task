import 'package:flutter/material.dart';

class custom_headText extends StatelessWidget {
  custom_headText({
    super.key,
    required this.texts,
  });
  final String texts;

  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 18, 55, 85)),
    );
  }
}

