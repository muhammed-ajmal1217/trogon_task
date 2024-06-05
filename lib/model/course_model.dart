class Course {
  String? firstName;
  int? coins;
  String? id;
  String? name;
  String? type;

  Course({
    this.firstName,
    this.coins,
    this.id,
    this.name,
    this.type,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['title'],
      type: json['course_type'],
      firstName: json['first_name'],
      coins: json['coins'],
    );
  }
}
