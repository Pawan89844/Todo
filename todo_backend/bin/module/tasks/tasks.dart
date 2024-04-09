import 'package:mysql_client/mysql_client.dart';
import '../../constants/sql_queries.dart';
import '../../db/db.config.dart';
import 'model/add_task_model.dart';

class Tasks {
  final DBConfig _config = DBConfig();
  // final BigInt _num = BigInt.one;

  AddTaskModel? _traverseTasks(IResultSet query, MySQLConnection conn) {
    for (var row in query.rows) {
      AddTaskModel model = AddTaskModel.fromDB(row.assoc());
      conn.close();
      return model;
    }
    return null;
  }

  Future<AddTaskModel?> _fetchTaskfromDB(MySQLConnection conn) async {
    if (conn.connected) {
      IResultSet query = await conn.execute(SQLQueries.SELECT_FROM_TASK);
      print('Query: ${query.affectedRows}');
      return _traverseTasks(query, conn);
    }
    return null;
  }

  Future<AddTaskModel?> fetchTasksFromDB() async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _fetchTaskfromDB(conn);
  }

  // Future<Tasks?> addTask(MySQLConnection conn) async {
  //   Tasks? task;
  //   if (conn.connected) {
  //     IResultSet query = await conn.execute('SELECT * FROM tasks');
  //   }
  //   return task;
  // }
}
