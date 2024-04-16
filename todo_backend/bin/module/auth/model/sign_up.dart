import '../service/hash_password.dart';

class SignUpModel {
  int? id;
  String fullname;
  String email;
  String password;

  SignUpModel(
      {this.id,
      required this.fullname,
      required this.email,
      required this.password});

  factory SignUpModel.fromUser(Map<String, dynamic> body) {
    HashPassword hashPassword = HashPassword();
    String password = hashPassword.generateHashPassword(body['password']);
    return SignUpModel(
        fullname: body['fullname'], email: body['email'], password: password);
  }
}
