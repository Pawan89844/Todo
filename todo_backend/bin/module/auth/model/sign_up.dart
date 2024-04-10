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
    return SignUpModel(
        fullname: body['fullname'],
        email: body['email'],
        password: body['password']);
  }
}
