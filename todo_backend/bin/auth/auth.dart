import 'model/user.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:convert/convert.dart';

class Auth {
  List<User> users = [];

  void addUser(User user) {
    users.add(user);
  }

  User? getUserByUsername(String username) {
    return users.firstWhere((user) => user.username == username);
  }

  Future<String> hashPassword(String password) async {
    final String round = '12';
    return BCrypt.hashpw(password, round);
  }

  Future<bool> authenticate(Map<String, String> headers) async {
    String? authorizationHeader = headers['authorization'];
    // _authHeaderNull(authorizationHeader);
    // final user = getUserByUsername(username);
    // _userSearch(user);
    // bool isValidPassword = await _comparePassword(plainPassword, hashedPassword)
    // return isValidPassword;
  }

  // void _authHeaderNull(String? authorizationHeader) {
  //   if (authorizationHeader == null ||
  //       !authorizationHeader.startsWith('Basic')) {
  //     return false;
  //   }
  // }

  Future<bool> _comparePassword(
      String plainPassword, String hashedPassword) async {
    return BCrypt.checkpw(plainPassword, hashedPassword);
  }

  bool _userSearch(User? user) {
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }
}
