import 'package:mysql_client/mysql_client.dart';
import '../../db/db.config.dart';
import 'model/sign_up.dart';
import 'model/user.dart';
import '../../constants/sql_queries.dart';
import 'token/auth_token.dart';

class Auth with AuthToken {
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

  Future<SignUpModel?> _signUpQuery(
      MySQLConnection conn, Map<String, dynamic> body) async {
    SignUpModel? user = SignUpModel.fromUser(body);
    if (!conn.connected) {
      return null;
    } else {
      IResultSet query = await conn.execute(
          "${SQLQueries.INSERT_INTO_USER}(${user.id}, '${user.email}', '${user.fullname}', '${user.password}')");
      print('Query: ${query.affectedRows}');
      // generateJWTToken(1);
      return query.affectedRows >= _num ? user : null;
    }
  }

  /// [_signInQuery] function makes a query to database conditionally with email and password.
  Future<User?> _signInQuery(
      MySQLConnection conn, Map<String, dynamic> body) async {
    if (conn.connected) {
      var query = await conn.execute(
          "${SQLQueries.SELECT_FROM_USER} where ${SQLQueries.checkEmailPass(body)}");
      print('Query: ${query.affectedRows}');
      return await _traverseUserDataFromDB(conn, query);
    }
    return null;
  }

  Future<SignUpModel?> signUpUser(Map<String, dynamic> body) async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _signUpQuery(conn, body);
  }

  Future<User?> signInUser(Map<String, dynamic> body) async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _signInQuery(conn, body);
  }
}
