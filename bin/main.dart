import 'dart:io';

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


  // ENVIRONMENTS VARIABLE
  print("\n\nEnvironment variables:\n");
  
  Platform.environment.keys.forEach((key) => {
    print("${key} ${Platform.environment[key]}")
  });

}

