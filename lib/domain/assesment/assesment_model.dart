class AssessmentModel {
  final String title;
  final String content;
  final String uid;
  final String image;

  // Constructor
  AssessmentModel({
    required this.title,
    required this.content,
    required this.uid,
    required this.image,
  });

  // Factory constructor to create an instance from JSON
  factory AssessmentModel.fromJson(Map<String, dynamic> json) {
    return AssessmentModel(
      title: json['title'] as String,
      content: json['content'] as String,
      uid: json['uid'] as String,
      image: json['image'] as String,
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'uid': uid,
      'image': image,
    };
  }
}
