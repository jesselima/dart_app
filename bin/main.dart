import 'dart:io';

main(List<String> arguments) {


  print("\n\n######################\nCheck if a directory exists:\n");
  // ##################### Check if a directory exists #########################

  String path = "C:\\";

  Directory directory = Directory(path);

  // existsSync ? Things will happen one at the time. Like people in a line in a bank.
  if(directory.existsSync()) {
    print("exists");
  } else {
    print("not fount");
  }



  print("\n\n######################\nCreates and delete temp directory:\n");
  // ##################### Creates and delete temp directory #########################

  Directory dir = Directory.systemTemp.createTempSync("Dart_App_"); // // TODO Info ->  prefix is not mandatory

  if(dir.existsSync()) {
    print("Exist: ${dir.path}");
    print("Removing ${dir.path}");
    dir.deleteSync();
  } else {
    print("Could not find ${dir.path}");
  }



  print("\n\n######################\nListing Directories:\n");
  // ##################### Listing Directories #########################


  Directory direct = Directory.current;
  print("Current: ${direct.path}");
  print("\n");

  List<FileSystemEntity> list = direct.listSync(recursive: true);
  print("Entries in list ${list.length}");

  list.forEach((FileSystemEntity fileSystemEntity) {

      FileStat stat = fileSystemEntity.statSync();

      print("Path:      ${fileSystemEntity.path}");
      print("Type:      ${stat.type}");
      print("Changes:   ${stat.changed}");
      print("Modified:  ${stat.modified}");
      print("Accesed:   ${stat.accessed}");
      print("Mode:      ${stat.mode}");
      print("Size:      ${stat.size}");

      print("\n");

      // TODO Info ->  Playground with file system.
      // We can do many more operations with fileSystemEntity object
      /*
      fileSystemEntity.existsSync();
      fileSystemEntity.watch(); // Watch for events
      fileSystemEntity.deleteSync();
      fileSystemEntity.delete();
      fileSystemEntity.renameSync("newPath");
      fileSystemEntity.rename("newPath");
       */
  });



  print("\n\n######################\nAccessing files:\n");
  // ##################### Accessing files #########################

  Directory directoryReadWrite = Directory.current;
  print(directoryReadWrite.path);

  File file = File(directoryReadWrite.path + "/myFile.txt");

  writeFile(file);

  readFile(file);

}


void writeFile(File file) {
  // Whe writing we can Append or Write
  // Append - Complete erase the file and start over.

  //RandomAccessFile randomAccessFile = file.openSync(mode: FileMode.append);
  RandomAccessFile randomAccessFile = file.openSync(mode: FileMode.write);
  randomAccessFile.writeStringSync("\nHello World!\r\nHow Are you today?");
  randomAccessFile.flushSync(); // flush also close() in the background.
  randomAccessFile.closeSync();
}


void readFile(File file) {

    if(!file.existsSync()) {
      print("File not found");
      return;
    }

    print("Reading string...");

    print(file.readAsStringSync());

    print("Reading bytes...");
    List values = file.readAsBytesSync();
    values.forEach((value) => print(value));

}



