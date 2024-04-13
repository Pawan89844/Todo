import 'package:mysql_client/mysql_client.dart';

import '../../db/db.config.dart';
import 'model/sign_up.dart';
import 'model/user.dart';

class Auth {
  final DBConfig _config = DBConfig();
  final BigInt _num = BigInt.one;

  Future<User?> _traverseUserDataFromDB(
      MySQLConnection conn, IResultSet query) async {
    for (var row in query.rows) {
      User user = User.fromDB(row.assoc());
      await conn.close();
      return user;
    }
    return null;
  }

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

  Future<User?> _signInQuery(MySQLConnection conn, int id) async {
    if (conn.connected) {
      var query = await conn.execute("SELECT * FROM users where userid = $id");
      print('Query: ${query.affectedRows}');
      return await _traverseUserDataFromDB(conn, query);
    }
    return null;
  }

  Future<bool> signUpUser() async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _signUpQuery(conn);
  }

  Future<User?> signInUser(int id) async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _signInQuery(conn, id);
  }
}
