import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';

main(List<String> arguments) {


  Digest digest = Digest("SHA-256");

  String textContent = "Hello -World";

  /*
   Integers stored in the list are truncated to their low eight bits,
   interpreted as an unsigned 8-bit integer with values in the range 0 to 255.
   */
  Uint8List data = Uint8List.fromList(utf8.encode(textContent));
  Uint8List hash = digest.process(data);

  // Testing
  // TODO Info ->   ATTENTION. Encoding is NOT encryption - Zero protection!. It's just a different data format.
  print("Testing...");
  print(hash);              // OUTPUT: [165, 145, 166, 212, 11, 244, 32, 64, 74, 1, 23, 51, 207, 183, 177, 144, 214, 44, 101, 191, 11, 205, 163, 43, 87, 178, 119, 217, 173, 159, 20, 110]
  print(base64Encode(hash));// OUTPUT: pZGm1Av0IEBKARczz7exkNYsZb8LzaMrV7J32a2fFG4=

  // TODO Info ->  What this hash is?
  /*
   The textContent is process by the digest method.
   Then if there is any change in textContent, the final hash (the [] of numbers will be totally different).
   If the content is back to what it was, also the hash will be.

   Hash for "Hello -World": [165, 145, 166, 212, 11, 244, 32, 64, 74, 1, 23, 51, 207, 183, 177, 144, 214, 44, 101, 191, 11, 205, 163, 43, 87, 178, 119, 217, 173, 159, 20, 110]
   Hash for "Hello World":  [45, 31, 121, 86, 105, 218, 3, 15, 64, 74, 153, 167, 158, 2, 8, 164, 12, 188, 245, 249, 138, 237, 124, 209, 103, 0, 129, 188, 180, 25, 163, 74]



   */





}

