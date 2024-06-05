import 'package:flutter/material.dart';
import 'package:trogontask/model/course_model.dart';
import 'package:trogontask/model/user_model.dart';
import 'package:trogontask/services/api_service.dart';

class ApiServiceProvider extends ChangeNotifier{
  List<Course> coursesList = [];
  UserModel? user;

  Future<void> fetchData() async {
    try {
      user = await ApiService().fetchUser();
      coursesList = await ApiService().fetchCourses();
      notifyListeners();
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}