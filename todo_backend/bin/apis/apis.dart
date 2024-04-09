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
}
