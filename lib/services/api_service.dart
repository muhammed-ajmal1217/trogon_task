import 'package:dio/dio.dart';
import 'package:trogontask/model/course_model.dart';
import 'package:trogontask/model/user_model.dart';

class ApiService {
  final String baseUrl = 'https://trogon.info/tutorpro/edspark/api/';
  final String authToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VyX2lkIjoiMiIsInJvbGVfaWQiOiIyIiwicm9sZV9sYWJlbCI6IlVzZXIiLCJwaG9uZSI6Ijk5NDY4MDExMDAifQ.BcHZkDQ_VPPQ-jnOtS4Tnwx_4GqQ9761q7BUOjPpML8';
  final Dio dio = Dio();

  Future<UserModel> fetchUser() async {
    try {
      final response =
          await dio.get('${baseUrl}my_course?auth_token=$authToken');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['data']['userdata']);
      } else {
        throw Exception(
            'Failed to fetch user data with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }

  Future<List<Course>> fetchCourses() async {
    try {
      final response =
          await dio.get('${baseUrl}my_course?auth_token=$authToken');
      if (response.statusCode == 200) {
        final List<Course> courses = (response.data['data']['subjects'] as List)
            .map((courseJson) => Course.fromJson(courseJson))
            .toList();
        return courses;
      } else {
        throw Exception('Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }

  Future<void> fetchLevelsByCourse(int courseId, int sectionId) async {
    try {
      final response = await dio
          .post('${baseUrl}levels_by_course?auth_token=$authToken', data: {
        'course_id': courseId.toString(),
        'section_id': sectionId.toString(),
      });
      if (response.statusCode == 200) {
        print('Levels data: ${response.data}');
      } else {
        print('Failed to load levels with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to load levels: $e');
    }
  }

  Future<void> fetchLessonVideos(int lessonId) async {
    try {
      final response = await dio
          .post('${baseUrl}get_lesson_videos?auth_token=$authToken', data: {
        'lesson_id': lessonId.toString(),
      });
      if (response.statusCode == 200) {
        print('Lesson videos data: ${response.data}');
      } else {
        print('Failed to load videos with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to load videos: $e');
    }
  }
}
