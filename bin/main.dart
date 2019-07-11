import 'dart:convert';
import 'dart:io';

main(List<String> arguments) {

  int gzip = testCompression(GZIP);
  int zlib = testCompression(ZLIB);

  print("GZIP: ${gzip}");
  print("ZLIB: ${zlib}");

}

String generateData() {
  String data = "";

  for(int i = 0; i < 500; i++) {
    data = data + "Hello World\r\n";
  }

  return data;
}

int testCompression(var codec) {

  String data = generateData();

  // Original data
  List original = utf8.encode(data);
  // Compressed data
  List compressed = codec.encode(original);
  // Decompressed data
  List decompress = codec.decode(compressed);

  print("Original: ${original.length}");
  print("Compressed: ${compressed.length}");
  print("Decompressed: ${decompress.length}");

  print("");

  String decoded = utf8.decode(decompress);
  assert(data == decoded);

  return compressed.length;

}

