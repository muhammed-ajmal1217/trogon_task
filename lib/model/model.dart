import 'dart:convert';

class Subject {
  final String id;
  final String title;
  final String courseId;
  final String levelId;
  final String order;
  final String thumbnail;
  final String background;
  final String icon;
  final String free;
  final String instructorId;

  Subject({
    required this.id,
    required this.title,
    required this.courseId,
    required this.levelId,
    required this.order,
    required this.thumbnail,
    required this.background,
    required this.icon,
    required this.free,
    required this.instructorId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      levelId: json['level_id'],
      order: json['order'],
      thumbnail: json['thumbnail'],
      background: json['background'],
      icon: json['icon'],
      free: json['free'],
      instructorId: json['instructor_id'],
    );
  }
}

List<Subject> parseSubjects(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
}
