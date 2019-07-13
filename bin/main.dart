import 'dart:io';

import 'package:archive/archive.dart';
import 'package:path/path.dart';

main(List<String> arguments) {


  // Testing...

  // Create a list of files to be added to the zip file:
  List<String> fileList = List<String>();
  Directory.current.listSync()
    .forEach((FileSystemEntity fileSystemEntity) {
      if(fileSystemEntity.statSync().type == FileSystemEntityType.file) {
        fileList.add(fileSystemEntity.path);
      }
    });

  String zippedFilePath = 'C:\\android-projects\\FLUTTER\\dart_app\\test.zip';

  zip(fileList, zippedFilePath);


} // close main()



void zip(List<String> fileList, String zippedFilePath) {

  Archive archive = Archive();

  fileList.forEach((String path) {
    // Add each file
    File currentFile = File(path);
    ArchiveFile fileToArchive = ArchiveFile(basename(path), currentFile.lengthSync(), currentFile.readAsBytesSync()); // path, length of bytes and the bytes itself.
    archive.addFile(fileToArchive);
  });

  ZipEncoder encoder = ZipEncoder();

  File finalZippedFile = File(zippedFilePath);
  finalZippedFile.writeAsBytesSync(encoder.encode(archive));

  print("Compressed!");



}


void unzip() {

}