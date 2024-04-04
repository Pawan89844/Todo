import '../db/db.config.dart';
import 'model/sign_up.dart';
import 'model/user.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:convert/convert.dart';

class Auth {
  final DBConfig _config = DBConfig();

  Future<void> signUpUser() async {
    final conn = await _config.openDB();
    conn.connect();
    if (conn.connected) {}
    return;
  }
}
