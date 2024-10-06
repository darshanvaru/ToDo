import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task_model.dart';

class TaskService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<List<Task>> loadTasks() async {
    String? savedTasks = _prefs.getString('tasks');
    if (savedTasks != null) {
      List<dynamic> jsonList = json.decode(savedTasks);
      return jsonList.map((json) => Task.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> updateTask(List<Task> tasks) async {
    List<Map<String, dynamic>> jsonList = tasks.map((task) => task.toJson()).toList();
    await _prefs.setString('tasks', json.encode(jsonList));
  }
}
