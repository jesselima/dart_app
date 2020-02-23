import 'dart:convert';
import 'dart:io';

main(List<String> arguments) {

  var gzip = testCompression(GZIP);
  var zlib = testCompression(ZLIB);

  print('GZIP: ${gzip}');
  print('ZLIB: ${zlib}');

}

String generateData() {
  var data = '';

  for(var i = 0; i < 5000; i++) {
    data = data + 'Hello World\r\n';
  }

  return data;
}

int testCompression(var codec) {

  var data = generateData();

  print('COMPRESSION $codec CODEC:');
  // Original data
  List original = utf8.encode(data);
  // Compressed data
  List compressed = codec.encode(original);
  // Decompressed data
  List decompress = codec.decode(compressed);

  print('Original: ${original.length}');
  print('Compressed: ${compressed.length}');
  print('Decompressed: ${decompress.length}');

  var decoded = utf8.decode(decompress);
  assert(data == decoded);

  return compressed.length;

}

