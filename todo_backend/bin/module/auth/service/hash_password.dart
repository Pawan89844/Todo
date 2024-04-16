import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;

class HashPassword {
  String generateHashPassword(String password) {
    int salt = 18;
    String combine = salt.toString() + password;
    List<int> bytes = utf8.encode(combine);
    crypto.Digest digest = crypto.sha256.convert(bytes);
    return digest.toString();
  }
}
