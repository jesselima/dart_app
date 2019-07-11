import 'dart:io';


int counter = 0; // Used in callback

main(List<String> arguments) {

  print("\n\n######################\nOS Variables:\n");
  // ##################### OS Variables #########################
  print("Os: ${Platform.operatingSystem} and version ${Platform.operatingSystemVersion}");

  // TODO Info ->  Important conditional to run platform specific code when required
  if(Platform.isWindows) {
    print("Bleerrrr again");
  } else if (Platform.isAndroid || Platform.isFuchsia || Platform.isIOS || Platform.isLinux || Platform.isMacOS) {
    print("VoVoV");
  }


  // TODO Info ->  Show the actual pth where the current file is running.
  print(Platform.script.path); // i.e output: /C:/android-projects/FLUTTER/dart_app/bin/main.dart

  print(Platform.executable); // i.e output: C:\Dart\dart-sdk\bin\dart.exe


  // TODO Info ->  ENVIRONMENTS VARIABLES
  print("\n\nEnvironment variables:\n");
  
  Platform.environment.keys.forEach((key) => {
    print("${key} ${Platform.environment[key]}")
  });



  // TODO FOR LINUX ONLY - List all files in a directory
//  Process.run("ls", ["-l"]).then((ProcessResult results) {
//    print(results.stdout);
//    print("Exit code: ${results.exitCode}"); // 0 is good!
//  });



  // TODO Info ->  Communicating with processes

  // LINUX ONLY
  
//  Process.start("cat", []).then((Process process) {
//
//    // Transform th out put
//    process.stdout.transform(utf8.decoder).listen((onData) {
//      print(onData);
//    });
//
//    // Send to the process
//    process.stdin.write("Hello Worl");
//    
//    // Stop the process
//    Process.killPid(process.pid); // Send a signal to shutdown the process. It can hurt some processes, so attention when using it!
//
//    // get the exit code
//    process.exitCode.then((int code) {
//      print("Exit code: ${code}");
//      //exit
//      exit(0);
//    });
//
//  });


} // CLOSES MAIN()



