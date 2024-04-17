import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../module/auth/auth.dart';
import '../module/auth/model/sign_up.dart';
import '../module/auth/model/user.dart';
import '../module/auth/token/auth_token.dart';
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

  static Response _onSuccess(
      User user, Map<String, String> header, String token) {
    Map<String, dynamic> responseUser = {
      'name': user.name,
      'username': user.username
    };
    return Response.ok(
        JsonEncoder.withIndent('  ').convert({
          'message': 'Login successful',
          'token': token,
          'user': responseUser
        }),
        headers: header);
  }

  static Response _onSuccessFetchTasks(
      List<AddTaskModel> task, Map<String, String> header) {
    // List<Map<String, dynamic>> tasks = task[1].toUser();
    return Response.ok(
        JsonEncoder.withIndent('  ').convert({
          'message': 'success',
          'tasks': task.map((e) => e.toUser()).toList()
        }),
        headers: header);
  }

  static Future<Response> signIn(
      Map<String, String> header, Map<String, dynamic> body) async {
    final User? user = await _auth.signInUser(body);
    if (user != null) {
      String token = await AuthToken.generateJWT(user.id, user.name);
      return _onSuccess(user, header, token);
    } else {
      return Response.unauthorized('Invalid username or password',
          headers: header);
    }
  }

  static Future<Response> signUp(
      Map<String, String> header, Map<String, dynamic> body) async {
    SignUpModel? user = await _auth.signUpUser(body);
    var userList = {'fullname': user?.fullname, 'email': user?.email};
    if (user != null) {
      String token = await AuthToken.generateJWT(user.id as int, user.fullname);
      return Response.ok(
          JsonEncoder.withIndent('  ').convert({
            'message': 'Signup successful',
            'token': token,
            'user': userList
          }),
          headers: header);
    } else {
      return Response.unauthorized('Invalid username or password',
          headers: header);
    }
  }

  static Future<Response> tasks(Map<String, String> header) async {
    List<AddTaskModel>? taskModel = await _tasks.fetchTasksFromDB();
    if (taskModel != null) {
      String token = header['authorization']
          .toString()
          .split('Bearer')
          .join('')
          .toString();
      bool isValidated = await AuthToken.verifyJWT(token, 'Honest');
      if (isValidated) {
        return _onSuccessFetchTasks(taskModel, header);
      } else {
        return Response.unauthorized('error: invalid token', headers: header);
      }
    } else {
      return _notFound(header, 'Oops! no tasks found in your account');
    }
  }

  static Future<Response> addTask(
      Map<String, String> header, Map<String, dynamic> body) async {
    List<AddTaskModel>? taskModel = await _tasks.addTaskToDB(body);
    if (taskModel != null) {
      return _onSuccessFetchTasks(taskModel, header);
    } else {
      return _notFound(header, 'Something went wrong');
    }
  }
}
