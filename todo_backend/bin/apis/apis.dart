import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../auth/auth.dart';

class Apis extends Auth {
  final Map<String, String> _header = {'content-type': 'application/json'};
  // AUTHENTICATION API
  Future<Response> initRoute(Request req) async {
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

  Response echoHandler(Request request) {
    final message = request.params['message'];
    return Response.ok('$message\n');
  }
}
