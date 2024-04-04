import 'package:mysql_client/mysql_client.dart';

class DBConfig {
  final String _host = '127.0.0.1';
  final int _port = 3306;
  final String _username = 'root';
  final String _password = '9810253997Pa';
  // final int _maxConnection = 10;
  // final String dbName;

  DBConfig();

  Future<MySQLConnection> openDB() async {
    MySQLConnection connection = await MySQLConnection.createConnection(
        host: _host,
        port: _port,
        userName: _username,
        password: _password,
        secure: false,
        databaseName: 'users');
    return connection;
  }
}
