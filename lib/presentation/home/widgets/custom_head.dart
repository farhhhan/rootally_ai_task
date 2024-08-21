
import 'package:flutter/material.dart';

class CustomChallange extends StatelessWidget {
   CustomChallange({
    required this.title,
    super.key,
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child:    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(color: const Color.fromARGB(255, 7, 44, 75),fontWeight: FontWeight.w700,fontSize: 15),),
        const    Row(children: [
              Text("View All"),
              SizedBox(width: 10,),
              CircleAvatar(
                radius: 12,
                backgroundColor: Color.fromARGB(255, 4, 16, 43),
                child: Center(
                  child: Icon(Icons.arrow_forward,size: 14,color: Colors.white,),
                ),
              )
            ],)
          ],
         ),
    );
  }
}
