// import 'dart:io';

// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
// import 'package:path_provider/path_provider.dart';

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:cryptography/cryptography.dart';

mixin AuthToken {
  final String _SECRET_KEY = 'Honest';
  Future<String> generateJWT(int userId, String fullname) async {
    String algorithm = 'HS256';
    Map<String, dynamic> header = {'alg': algorithm, 'typ': 'JWT'};
    Map<String, dynamic> payload = {
      'iss': 'localhost',
      'exp':
          DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch / 1000,
      'id': userId,
      'fullname': fullname
    };
    String jsonEncodedHeader = jsonEncode(header);
    String jsonEncodedPayload = jsonEncode(payload);
    List<int> utf8Header = utf8.encode(jsonEncodedHeader);
    List<int> utf8Payload = utf8.encode(jsonEncodedPayload);
    String encodedHeader = base64Url.encode(utf8Header);
    String encodedPayload = base64Url.encode(utf8Payload);
    List<int> combinedUTF8 = utf8Header + utf8Payload;
    var hmac = Hmac.sha256();
    var p = await hmac.calculateMac(combinedUTF8,
        secretKey: SecretKey(_SECRET_KEY.codeUnits));
    var newP = await hmac.hashAlgorithm.hash(p.bytes);
    var encode = base64Url.encode(newP.bytes);
    String jwt = '$encodedHeader.$encodedPayload.$encode';
    return jwt;
  }

  void verifyJWT() {}
}
