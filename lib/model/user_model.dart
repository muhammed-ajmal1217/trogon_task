class UserModel {
  final String firstName;
  final int coins;
  final String image;
  final String? courseName;

  UserModel({required this.firstName, required this.coins, required this.image,required this.courseName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'] ?? '',
      coins: json['coins'] ?? 0,
      image: json['image'] ?? '',
      courseName: json['course_name']??''
    );
  }
}
