
import 'package:dart_app/someclass.dart';

main(List<String> arguments) {

  SomeClass s = SomeClass();


  // ANONYMOUS FUNCTION

  List people = ["Bob", "Marley", "Bill"];

  print("---ANONYMOUS FUNCTION 1---");
  () { print("hello"); };
  people.forEach(print);

  print("---ANONYMOUS FUNCTION 2---");
  people.forEach((name) {
    print(name);
  });

  /* Both above will print the same result */
  // What really happens under the hood? There is a hidden name. i.e "void myFunction"
  people.forEach(/* void myFunction */ (name) {
    print(name);
  });


  print("---ANONYMOUS FUNCTION 3---"); // // TODO Info ->  NOT WORKING
//  people.where((name) {
//    switch(name) {
//      case "Bob":
//        return true;
//      case "Jesse":
//        return false;
//      case "Jhon":
//        return true;
//    }
//  }).forEach(print);



  print("---ANONYMOUS FUNCTION 4---");

  // FUNCTIONS ====================================================================
  print(s.printDivider() + "FUNCTIONS:");


  test();

  greeting();
  greeting("Welcome");

  download("myFile.txt");
  download("myFile.txt", true);

  // Calling functions with named arguments.
  squareFeet(width: 10, length: 56); // The order does not matter.
  //squareFeet( 10,  56); // TODO Info ->  if names are not given leads to error

  // Named arguments and optional parameters
  downloadFile("myFile.txt");
  downloadFile("myFile.txt", port: 89);


  // Calling functions as objects // TODO Info ->  NOT WORKING!!!!!!!
  //var dogYears = calcYears();
  //print("Dog years ${dogYears(age: 43, multiplier: 7)}"); // TODO Info ->  NOT WORKING!!!!!!!


}


void test() {
  print("testing");
}

// Method with optional parameters. They must be after mandatory ones.

void greeting([String message = ""]) {
  if(message.isNotEmpty) message = message.padRight(message.length + 1);
  print(message);
}

void download(String file, [bool open = false]) {
  print("Downloading ${file}");
  if(open) print("Opening ${file}");
}


// NAMED ARGUMENTS

int squareFeet({ int width, int length}) {
  return width * length;
}

// Using optional named arguments
void downloadFile(String file, { int port = 80 }) {
  print("Downloading file ${file} on port ${port}");
}


// FUNCTIONS AS OBJECTS

int calcYears({int age, int multiplier}) {
  return age * multiplier;
}


// ANONYMOUS FUNCTION







