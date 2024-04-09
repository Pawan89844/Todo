import 'package:mysql_client/mysql_client.dart';
import '../../constants/sql_queries.dart';
import '../../db/db.config.dart';
import 'model/add_task_model.dart';

class Tasks {
  final DBConfig _config = DBConfig();

  Future<List<AddTaskModel>?> _traverseTasks(
      IResultSet query, MySQLConnection conn) async {
    List<AddTaskModel> model = <AddTaskModel>[];
    for (final row in query.rows) {
      model.add(AddTaskModel.fromDB(row.assoc()));
    }
    await conn.close();
    return model;
  }

  Future<List<AddTaskModel>?> _fetchTaskfromDB(MySQLConnection conn) async {
    if (conn.connected) {
      IResultSet query = await conn.execute(SQLQueries.SELECT_FROM_TASK);
      print('Query: ${query.affectedRows}');
      return await _traverseTasks(query, conn);
    }
    return null;
  }

  Future<List<AddTaskModel>?> _addTask(
      MySQLConnection conn, Map<String, dynamic> db) async {
    if (conn.connected) {
      AddTaskModel model = AddTaskModel.toDB(db);
      IResultSet query = await conn.execute(
          "${SQLQueries.INSERT_INTO_TASK} VALUES(${model.taskStatus}, '${model.title}', '${model.description}', 1)");
      print('Query: ${query.affectedRows}');
      return await fetchTasksFromDB();
    }
    return null;
  }

  Future<List<AddTaskModel>?> fetchTasksFromDB() async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _fetchTaskfromDB(conn);
  }

  Future<List<AddTaskModel>?> addTaskToDB(Map<String, dynamic> userData) async {
    final conn = await _config.openDB();
    await conn.connect();
    print('Status: ${conn.connected}');
    return await _addTask(conn, userData);
  }
}
