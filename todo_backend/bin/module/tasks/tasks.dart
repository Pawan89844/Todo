import 'package:mysql_client/mysql_client.dart';
import '../../db/db.config.dart';

class Tasks<T> {
  final DBConfig _config = DBConfig();
  final BigInt _num = BigInt.one;
  Future<Tasks?> addTask(MySQLConnection conn) async {
    Tasks? task;
    if (conn.connected) {
      IResultSet query = await conn.execute('SELECT * FROM tasks');
    }
    return task;
  }
}
