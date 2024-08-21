import 'package:flutter/material.dart';
import 'package:rootaly_task/presentation/home/widgets/skell_structure/custom_skell.dart';

class HomeSkell extends StatelessWidget {
  const HomeSkell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 216, 216, 216),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          custom_skel(height: 60, width: 370),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 175, 175),
                borderRadius: BorderRadius.circular(20)),
            width: 370,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                custom_skel(height: 150, width: 350),
                custom_skel(height: 150, width: 350)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custom_skel(height: 30, width: 100),
                custom_skel(height: 30, width: 100),
              ],
            ),
          ),
          custom_skel(height: 170, width: 370),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custom_skel(height: 30, width: 100),
                custom_skel(height: 30, width: 100),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  custom_skel(height: 200, width: 300),
                  custom_skel(height: 130, width: 200)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
