import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../module/auth/auth.dart';
import '../module/auth/model/user.dart';
import '../module/tasks/model/add_task_model.dart';
import '../module/tasks/tasks.dart';

class APIImp {
  static final Auth _auth = Auth();
  static final Tasks _tasks = Tasks();

  static Response _notFound(Map<String, String> header, String response) {
    return Response.notFound(
        JsonEncoder.withIndent('  ')
            .convert({'message': 'error', 'response': response}),
        headers: header);
  }

  static Response _onSuccess(User user, Map<String, String> header) {
    Map<String, dynamic> responseUser = {
      'name': user.name,
      'username': user.username
    };
    return Response.ok(
        JsonEncoder.withIndent('  ')
            .convert({'message': 'Login successful', 'user': responseUser}),
        headers: header);
  }

  static Response _onSuccessFetchTasks(
      AddTaskModel task, Map<String, String> header) {
    List<Map<String, dynamic>> tasks = task.toUser();
    return Response.ok(
        JsonEncoder.withIndent('  ')
            .convert({'message': 'success', 'tasks': tasks}),
        headers: header);
  }

  static Future<Response> signIn(Map<String, String> header) async {
    final User? user = await _auth.signInUser(1);
    if (user != null) {
      return _onSuccess(user, header);
    } else {
      return Response.unauthorized('Invalid username or password');
    }
  }

  static Future<Response> signUp(Map<String, String> header) async {
    final bool isAuthenticated = await _auth.signUpUser();
    if (isAuthenticated) {
      return Response.ok(
          JsonEncoder.withIndent('  ').convert({'message': 'Login successful'}),
          headers: header);
    } else {
      return Response.unauthorized('Invalid username or password');
    }
  }

  static Future<Response> tasks(Map<String, String> header) async {
    AddTaskModel? taskModel = await _tasks.fetchTasksFromDB();
    if (taskModel != null) {
      print('Tasks Model: ${taskModel.description}');
      return _onSuccessFetchTasks(taskModel, header);
    } else {
      return _notFound(header, 'Oops! no tasks found in your account');
    }
  }
}
