import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
class Md5Util{
  static String generateMD5(String data) {
    Uint8List content = new Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return digest.toString();
  }
}