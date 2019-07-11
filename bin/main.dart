import 'dart:async';
import 'dart:io';

main(List<String> arguments) async {

  print("starting...");
  File file = await appendFile();
  print("Append to file ${file.path}");
  print("*** End.");

}

Future<File> appendFile() {
  File file = File(Directory.current.path + "/test.txt");
  DateTime dateTime = DateTime.now();
  return file.writeAsString(dateTime.toString() + '\r\n', mode: FileMode.append);
}

