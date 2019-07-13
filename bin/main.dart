import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:collection';
import 'package:pointycastle/pointycastle.dart';

// AES - It's the best standard by now. It's reaches the military grade
main(List<String> arguments) {

  final key = randomBytes(16); // 16 is the block size. Keep it 16 length
  final params = KeyParameter(key);

  // Instead a stream of data, it expects a block of data.
  BlockCipher blockCipher = BlockCipher("AES");
  blockCipher.init(true, params);

  //  TODO Info -> Declare (or get) data to be encrypted
  String plainText = "Hello World";

  // TODO Info ->  Encode data (NOT encryption).
  // PAD - The best way here would be to use a cryptographic padding.
  // Read more about the padding - check documentation.
  Uint8List plain_data = createUintListFromString(plainText.padRight(blockCipher.blockSize));

  // TODO Info ->  Encrypting
  Uint8List encrypted_data = blockCipher.process(plain_data);

  // TODO Info ->  Decrypting
  blockCipher.reset();
  blockCipher.init(false, params);
  Uint8List decrypted_data = blockCipher.process(encrypted_data);

  displayUint8List("Plain text: ", plain_data);
  displayUint8List("Encrypted: ", encrypted_data);
  displayUint8List("Decrypted: ", decrypted_data);

  print(utf8.decode(decrypted_data).trim());

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
  print("\n___________________");
  print("-------------------\n");
}