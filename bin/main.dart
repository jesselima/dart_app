import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:collection';
import 'package:pointycastle/pointycastle.dart';

main(List<String> arguments) {



}

// SECURE RANDOM NUMBERS
Uint8List randomBytes(int length) {

  final rnd = SecureRandom("AES/CTR/AUTO-SEED-PRNG");
  final key = Uint8List(16);
  final keyParam = KeyParameter(key);
  final params = ParametersWithIV(keyParam, Uint8List(16));

  rnd.seed(params);

  var random = Random();

  for(int i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }
  
  var bytes = rnd.nextBytes(length);
  return bytes;

}

// DERIVING KEYS
Uint8List createUintListFromString(String value) => Uint8List.fromList(utf8.encode(value));

// Logging for test:
void displayUint8List(String title, Uint8List value) {
  print("${title}");
  print("${value}");
  print("\nValue base64Encode:\n${base64Encode(value)}");
  print("-------------------");
}