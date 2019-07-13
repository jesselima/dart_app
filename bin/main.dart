import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';

main(List<String> arguments) {

  String password = "password";

  var uIntListFromString = createUintListFromString("salt"); // When this value is changed, the final result does no change. It's like a "key for the key" or initializer.
  var keyDerivator = KeyDerivator("SHA-1/HMAC/PBKDF2");

  var params = Pbkdf2Parameters(uIntListFromString, 100, 16 ); // Important to use 16 due to block structure. Otherwise it may lead to error.

  // Initialize the algorithms with the given parameters.
  keyDerivator.init(params);

  Uint8List key = createUintListFromString(password);

  display("Key Value: ", key);

}


Uint8List createUintListFromString(String value) => Uint8List.fromList(utf8.encode(value));

// Logging for test:
void display(String title, Uint8List value) {
  print("${title}");
  print("${value}");
  print("\nValue base64Encode:\n${base64Encode(value)}");
  print("");
}