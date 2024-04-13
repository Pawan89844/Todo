class User {
  final String username;
  final String name;

  User(this.username, this.name);

  factory User.fromDB(Map<String, dynamic> sql) {
    return User(sql['email'], sql['fullname']);
  }
}
