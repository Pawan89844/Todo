// import 'dart:io';

// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
// import 'package:path_provider/path_provider.dart';

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

mixin AuthToken {
  static Map<String, dynamic> _userData = {};

  Map<String, dynamic> get jwtpayload => _userData;
  static final String _SECRET_KEY = 'Honest';

  static Future<String> generateJWT(int userId, String fullname) async {
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

  static Future<bool> verifyJWT(String token, String secretKey) async {
    if (token.isNotEmpty && token != 'null') {
      List<String> splitToken = token.split('.');
      String encodedHeader = splitToken[0].trim();
      String encodedPayload = splitToken[1].trim();
      String encodedSignature = splitToken[2].trim();
      Uint8List decodedHeader = base64Url.decode(encodedHeader);
      Uint8List decodedPayload = base64Url.decode(encodedPayload);
      // Uint8List decodedSignature = base64Url.decode(encodedSignature);
      // String utf8Header = utf8.decode(decodedHeader);
      String utf8Payload = utf8.decode(decodedPayload);
      Map<String, dynamic> payload = json.decode(utf8Payload);
      _userData = payload;
      List<int> combinedUTF8 = decodedHeader + decodedPayload;
      var hmac = Hmac.sha256();
      var p = await hmac.calculateMac(combinedUTF8,
          secretKey: SecretKey(secretKey.codeUnits));
      var newP = await hmac.hashAlgorithm.hash(p.bytes);
      var encode = base64Url.encode(newP.bytes);
      return encode == encodedSignature;
    } else {
      return false;
    }
  }
}
