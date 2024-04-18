class User {
  final int id;
  final String username;
  final String name;

  User(
    this.id,
    this.username,
    this.name,
  );

  factory User.fromDB(Map<String, dynamic> sql) {
    int id = int.parse(sql['userid'].toString());
    return User(id, sql['email'], sql['fullname']);
  }
}
