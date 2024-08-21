import 'package:cloud_firestore/cloud_firestore.dart';

class RoutinsModel {
  final String title;
  final String weight;
  final String difficulty;
  final String image;
  final String uid;
  final String type;

  RoutinsModel({
    required this.title,
    required this.weight,
    required this.difficulty,
    required this.image,
    required this.uid,
    required this.type,
  });

  // Convert a RoutinsModel into a Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'weight': weight,
      'difficulty': difficulty,
      'image': image,
      'uid': uid,
      'type': type,
    };
  }

  // Create a RoutinsModel from a Map
  factory RoutinsModel.fromJson(Map<String, dynamic> json) {
    return RoutinsModel(
      title: json['title'] as String,
      weight: json['weight'] as String ,
      difficulty: json['dificulty'] as String,
      image: json['image'] as String,
      uid: json['uid'] as String,
      type: json['type'] as String,
    );
  }

  // Create a RoutinsModel from Firestore document
  factory RoutinsModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RoutinsModel(
      title: data['title'] as String,
      weight: (data['weight'] ),
      difficulty: data['dificulty'] as String,
      image: data['image'] as String,
      uid: data['uid'] as String,
      type: data['type'] as String,
    );
  }
}
