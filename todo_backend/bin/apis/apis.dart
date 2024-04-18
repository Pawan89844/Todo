import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../module/auth/auth.dart';
import 'api_imp.dart';

class Apis extends Auth {
  final Map<String, String> _header = {'content-type': 'application/json'};
  // AUTHENTICATION API

  /// API FUNCTIONS -->> signUp -->> signUpUser -->> _signUpQuery -->> return true or false;
  ///
  /// signup: Implemenation of responses such as Success or failed, it also returns the user data.
  ///
  /// signUpUser: Opens DB Connection and connects to Databse.
  ///
  /// _signUpQuery: A Private implementation which query from database and add the user's provided data into database.
  Future<Response> signUp(Request req) async {
    try {
      final body = await req.readAsString();
      final data = jsonDecode(body) as Map<String, dynamic>;
      return APIImp.signUp(_header, data);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest(headers: _header);
  }

  /// login API FUNCTIONS : signIn -->> signInUser -->> _signInQuery -->> _traverseUserDataFromDB -->> returns User data.
  ///                                     FUNCTIONS EXPLAINATION
  /// SIGN IN : Implemenation of responses such as Success or failed, it also returns the user data.
  ///
  /// SIGNINUSER : Opens DB Connection and connects to Databse.
  ///
  /// _SIGNINQUERY : Initiate query from DB and fetch the user.
  ///
  /// _traverseUserDataFromDB : Once Query done it Parse the query result into User model and returns it to the user.

  Future<Response> login(Request req) async {
    try {
      final body = await req.readAsString();
      final data = jsonDecode(body) as Map<String, dynamic>;
      return APIImp.signIn(_header, data);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest(headers: _header);
  }

  Future<Response> getTasks(Request req) async {
    try {
      Map<String, String> header = {
        'content-type': 'application/json',
        'authorization': req.headers['authorization'].toString()
      };
      return APIImp.tasks(header);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest(headers: _header);
  }

  Future<Response> addTask(Request req) async {
    try {
      final body = await req.readAsString();
      final data = jsonDecode(body) as Map<String, dynamic>;
      Map<String, String> header = {
        'content-type': 'application/json',
        'authorization': req.headers['authorization'].toString()
      };
      return APIImp.addTask(header, data);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return Response.badRequest(headers: _header);
  }
}
