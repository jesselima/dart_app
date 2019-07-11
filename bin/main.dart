import 'dart:async';
import 'dart:io';


main(List<String> arguments) {

  String path = Directory.current.path + "test.txt";
  print("Appending to ${path}");

  File file = File(path);

  // Future is a promise
  Future<RandomAccessFile> future = file.open(mode: FileMode.append);

  future.then((RandomAccessFile raf) {
    print("File has been opened!");

    raf.writeString("Hello World")
        .then((value) {
          print("File have been appended");
        })
        .catchError((onError) => {
          /*Do Something */
        })
        .whenComplete(() => {
          raf.close(),
          print("** The end - YES. It is.")
        });
  });

  print("** The end - BUT NOT");

}

