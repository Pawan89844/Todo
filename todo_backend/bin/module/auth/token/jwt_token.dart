import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'dart:math';
import 'package:crypto/crypto.dart' as crypto;

class JWTToken {
  // String SECRET_KEY = '';
  // void generateJWT(int userId, String fullName) {
  //   final Map<String, dynamic> userData = {
  //     'userid': userId,
  //     'fullName': fullName
  //   };
  //   final Map<String, dynamic> payload = {
  //     'iss': 'todo_server',
  //     'exp':
  //         DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch / 1000,
  //     ...userData
  //   };
  //   final Uint8List payloadBytes =
  //       utf8.encode(jsonEncode(payload)) as Uint8List;
  //   final String algorithm = 'HS256';
  //   final Map<String, dynamic> header = {'alg': algorithm, 'typ': 'JWT'};
  //   final Uint8List headerBytes = utf8.encode(jsonEncode(header)) as Uint8List;
  //   final Uint8List signingString =
  //       Uint8List.fromList(base64Url.encode(headerBytes).codeUnits) +
  //               Uint8List.fromList([46]) +
  //               Uint8List.fromList(base64Url.encode(payloadBytes).codeUnits)
  //           as Uint8List;

  //   final crypto.Hmac hmac = crypto.Hmac(crypto.sha256, signingString);
  //   final signature = hmac.convert(signingString);
  //   final String encodedSignature = base64Url.encode(signature.bytes);
  //   final String jwtToken = '$algorithm.$header$['type']$.$encodedSignature';
  // }
}
