import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:collection';
import 'package:pointycastle/pointycastle.dart';

main(List<String> arguments) {

  // Key parameter
  final keyBytes = randomBytes(16);
  final key = KeyParameter(keyBytes);

  // Initialization vector
  final vectorParams = randomBytes(8);
  final params = ParametersWithIV(key, vectorParams);

  // The Stream cipher takes the data as it comes as a stream (like water, but in this case just "data"
  StreamCipher cipher = StreamCipher("Salsa20");
  cipher.init(true, params);

  // Encrypt data
  String plainText = "Hello World";
  Uint8List plain_data = createUintListFromString(plainText);
  Uint8List encrypted_data = cipher.process(plain_data);

  // Decrypt data
  cipher.reset();
  cipher.init(true, params); // This encryption method is called symmetric because um use the same "params" to encrypt and decrypt
  Uint8List decrypted_data = cipher.process(encrypted_data);

  // Logging for test test
  displayUint8List("Testing === Plain text: ", plain_data);                 // Log original data
  displayUint8List("Testing === Plain text - Encrypted: ", encrypted_data); // Log encrypted data
  displayUint8List("Testing === Plain text - Decrypted: ", decrypted_data); // Log original data after decrypted

  print("");
  print(utf8.decode(decrypted_data));


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