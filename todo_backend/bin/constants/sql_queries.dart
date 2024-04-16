// ignore_for_file: constant_identifier_names

class SQLQueries {
  static const SELECT_FROM_TASK = 'SELECT * FROM tasks';
  static const SELECT_FROM_USER = 'SELECT * FROM users';
  static const INSERT_INTO_TASK =
      'INSERT INTO tasks(taskStatus, title, description, userid)';
  static const INSERT_INTO_USER =
      'INSERT into users (userid, email, fullname, password) VALUES ';

  static String checkEmailPass(Map<String, dynamic> body) {
    return "email = '${body['email']}' AND password = '${body['password']}'";
  }
}
