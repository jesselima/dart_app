import 'package:dart_app/someclass.dart';

main(List<String> arguments) {

  SomeClass s = SomeClass();


  // ASSERT ====================================================================
  print(s.printDivider() + "ASSERT:");

  print("starting...");
  int age = 43; // Nothing happens
  //int age = 20;  // Throw an error:  Failed assertion: line 14 pos 10: 'age == 43': is not true.
  assert(age == 43);
  print("finished...");



  // IF/ELSE ====================================================================
  print(s.printDivider() + "ASSEIF/ELSERT:");

  int personAge = 103;

  if(personAge == 43) print("It's 43");
  if(personAge != 43) print("It's not 43");

  if(personAge < 18) {
    print("It's under 18");
    if(personAge < 13) print("It's teenager");
  }

  if(personAge > 65) {
    print("It's a senior");
    if(personAge > 100) print("WOW! More then 100");
  }

  if(personAge == 21) {
    print("It's a special year");
  } else {
    print("It's a normal year");
    if(personAge < 21) {
      print("You are a minor");
    } else {
      print("You are a adult");
    }
  }


  // SWITCH ====================================================================
  print(s.printDivider() + "SWITCH:");

  int userAge = 18;

  switch(userAge) {
    case 18:
      print("You are a minor");
      break;
    case 21:
      print("You are a adult");
      break;
    case 65:
      print("You are a serion");
      break;
    default:
      break;
  }



  // LOOPS ====================================================================
  print(s.printDivider() + "LOOPS:");

  // Do While

  int value;
  int initial = 1;
  int max = 5;

  value = initial;

  do {
    print(value);
    value++;
  } while (value <= max);
  print("Done Do/While loop");


  value = initial;

  while (value <= max) {
    print(value);
    value++;
  }
  print("Done While loop");


  // Breaking a infinity loop
  value = initial;
  do {
    print("Value: ${value}");
    value++;

    if(value == 3) {
      print("Value is 3");
      continue;
    }

    if(value > 5) {
      print("Value is greater than 5");
      break; // This will break the infinity loop
    }
  } while (true);
  print("Finished");




  // forEach

  List persons = [ "Brayan", "Cris", "Jhon" ];

  for(int i =0; i < persons.length; i++) {
    print("Person at ${[i]} is ${persons[i]}");
  }

  persons.forEach((person) {
    print(person);
  });


}

