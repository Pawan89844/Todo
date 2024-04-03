import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../auth/auth.dart';

class Apis extends Auth {
  // AUTHENTICATION API
  initRoute(Request req) async {
    try {
      final body = await req.readAsString();
      final loginData = jsonDecode(body);
      final username = loginData['username'] as String;
      final password = loginData['password'] as String;
      final isAuthenticated = await authenticate(req.headers);
      if (isAuthenticated) {
        return Response.ok(JsonEncoder.withIndent('  ')
            .convert({'message': 'Login successful'}));
      } else {
        return Response.unauthorized('Invalid username or password');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  Response echoHandler(Request request) {
    final message = request.params['message'];
    return Response.ok('$message\n');
  }
}
