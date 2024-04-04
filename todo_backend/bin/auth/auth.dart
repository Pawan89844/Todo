import 'dart:convert';

import 'package:mysql_client/mysql_client.dart';

import '../db/db.config.dart';
import 'model/sign_up.dart';

class Auth {
  final DBConfig _config = DBConfig();
  final BigInt _num = BigInt.one;

  Future<bool> _signUpQuery(MySQLConnection conn) async {
    if (conn.connected) {
      SignUp user = SignUp();
      IResultSet query = await conn.execute(
          "INSERT into users (userid, email, fullname, password) VALUES (${user.id}, '${user.email}', '${user.fullname}', '${user.password}')");
      print('Query: ${query.affectedRows}');
      if (query.affectedRows >= _num) {
        return true;
      }
    }
    return false;
  }

  Future<bool> _signInQuery(MySQLConnection conn, int id) async {
    if (conn.connected) {
      final conId = {"id": id};
      IResultSet query =
          await conn.execute("SELECT * FROM users WHERE userid=:id", conId);
      print('Query: ${query.affectedRows}');
      if (query.affectedRows >= _num) {
        print('Query Success: ${query.rowsStream.map((event) => event)}');
        return true;
      }
    }
    return false;
  }

  Future<bool> signUpUser() async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _signUpQuery(conn);
  }

  Future<bool> signInUser() async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _signInQuery(conn, 1);
  }
}
