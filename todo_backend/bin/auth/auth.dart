import 'package:mysql_client/mysql_client.dart';

import '../db/db.config.dart';
import 'model/sign_up.dart';

class Auth {
  final DBConfig _config = DBConfig();

  Future<bool> signUpUser() async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    if (conn.connected) {
      BigInt num = BigInt.one;
      SignUp user = SignUp();
      IResultSet query = await conn.execute(
          "INSERT into users (userid, email, fullname, password) VALUES (${user.id}, '${user.email}', '${user.fullname}', '${user.password}')");
      print('Query: ${query.affectedRows}');
      if (query.affectedRows >= num) {
        return true;
      }
    }
    return false;
  }
}
