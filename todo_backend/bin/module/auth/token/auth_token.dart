// import 'dart:io';

// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
// import 'package:path_provider/path_provider.dart';

mixin AuthToken {
  /// This method generates JWT RS256 Token for athenticating apis.
  // void generateJWTToken(int id) async {
  //   String token;
  //   final directory = await getApplicationCacheDirectory();
  //   var payload = {'id': id, 'exp': DateTime.now().add(Duration(minutes: 60))};
  //   final jwt = JWT(payload);
  //   final pem = File('${directory.path}rsa_private.pem').readAsStringSync();
  //   final key = RSAPrivateKey(pem);
  //   token = jwt.sign(key, algorithm: JWTAlgorithm.RS256);
  //   print('Signed Token: $token');
  // }
}
