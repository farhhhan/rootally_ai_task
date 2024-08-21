class ChallengeModel {
  final String title;
  final int count;
  final String total;
  final String uid;
  final String image;

  ChallengeModel({
    required this.title,
    required this.count,
    required this.total,
    required this.uid,
    required this.image,
  });

  // Factory constructor for creating an instance from a map
  factory ChallengeModel.fromMap(Map<String, dynamic> map) {
    return ChallengeModel(
      title: map['title'] ?? '',
      count: map['count'] ?? 0,
      total: map['total'] ?? '',
      uid: map['uid'] ?? '',
      image: map['image'] ?? '',
    );
  }

  // Method for converting the instance to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'count': count,
      'total': total,
      'uid': uid,
      'image': image,
    };
  }
}
