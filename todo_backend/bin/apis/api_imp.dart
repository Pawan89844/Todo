import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../module/auth/auth.dart';
import '../module/auth/model/user.dart';

class APIImp {
  static final Auth _auth = Auth();
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
}
