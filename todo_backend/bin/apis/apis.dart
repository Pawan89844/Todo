import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../module/auth/auth.dart';
import 'api_imp.dart';

class Apis extends Auth {
  final Map<String, String> _header = {'content-type': 'application/json'};
  // AUTHENTICATION API
  Future<Response> signUp(Request req) async {
    try {
      return APIImp.signUp(_header);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest();
  }

  Future<Response> login(Request req) async {
    try {
      return APIImp.signIn(_header);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest();
  }

  Future<Response> getTasks(Request req) async {
    try {
      return APIImp.tasks(_header);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest();
  }

  Future<Response> addTask(Request req) async {
    try {
      final body = await req.readAsString();
      final data = jsonDecode(body) as Map<String, dynamic>;
      return APIImp.addTask(_header, data);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest();
  }
}
