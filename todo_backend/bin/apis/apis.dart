import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../auth/auth.dart';

class Apis extends Auth {
  final Map<String, String> _header = {'content-type': 'application/json'};
  // AUTHENTICATION API
  Future<Response> signUp(Request req) async {
    try {
      final bool isAuthenticated = await signUpUser();
      if (isAuthenticated) {
        return Response.ok(
            JsonEncoder.withIndent('  ')
                .convert({'message': 'Login successful'}),
            headers: _header);
      } else {
        return Response.unauthorized('Invalid username or password');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest();
  }

  Future<Response> login(Request req) async {
    try {
      final bool isAuthenticated = await signInUser();
      if (isAuthenticated) {
        return Response.ok(
            JsonEncoder.withIndent('  ')
                .convert({'message': 'Login successful'}),
            headers: _header);
      } else {
        return Response.unauthorized('Invalid username or password');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest();
  }
}
