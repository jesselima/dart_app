import 'dart:collection';

import 'package:dart_app/someclass.dart';


enum colors { red, green, blue }

main(List<String> arguments) {

  SomeClass s = SomeClass();


  // ENUM ======================================================================
  print( s.printDivider() + "ENUM");
  // TODO Info ->  Enum are declared outside of the main(). It MUST be there!

  print(colors.values); // [colors.red, colors.green, colors.blue]
  print(colors.red); // colors.red


  // LIST ======================================================================
  print(s.printDivider() + "LIST:");

  List list = [1,2,3,4];
  print("List size: ${list.length}");
  print("List first item: ${list[0]}");
  print("Element at the index 3: ${list.elementAt(3)}"); // If the index does not exist leads an error "out of range".


  List things = List();
  things.add(1);
  things.add("cats");
  things.add(true);
  things.add(10.5);

  print("List of things: ${things}"); // [1, cats, true, 10.5]

  List<int> numbers = List<int>();
  numbers.add(1);
  numbers.add(2);
  numbers.add(3);
  // numbers.add("dogs"); // Leads to error


  // SET =======================================================================
  print(s.printDivider() + "SET:");

  // TODO Info ->  set DO NOT contains DUPLICATES
  // TODO Info ->  set is Unordered

  Set<int> setOfNumbers = Set<int>();

  setOfNumbers.add(1);
  setOfNumbers.add(2);
  setOfNumbers.add(3);
  setOfNumbers.add(1); // Added twice here. But its not going to be added in the Set of setOfNumbers object.

  print(setOfNumbers); // {1, 2, 3}



  // QUEUE =====================================================================
  print(s.printDivider() + "QUEUE:");

  // TODO Info ->  ORDERED. NO INDEX.
  // TODO Info ->  Add and Remove items from start and end. You can not add or remove from the middle.


  Queue items = Queue();

  items.add(1);
  items.add(3);
  items.add(2);
  items.add(4);

  items.removeFirst();
  items.removeLast();

  print("Items from the Queue: ${items}");


  // MAP =======================================================================
  print(s.printDivider() + "MAP:");

  // TODO Info ->  Map is a key value pair.

  // Whe can use this syntax:

  // Map mapItems = {"dad" : "Guga", "brother" : "Joca"};

  // or:

  Map<String, String> mapItems = Map<String, String>();
  mapItems.putIfAbsent("dad", () => "Guga");
  mapItems.putIfAbsent("brother", () => "Joca");

  print("Map: ${mapItems}"); // {dad: Guga, brother: Joca}
  print("Map keys: ${mapItems.keys}"); // (dad, brother)
  print("Map values: ${mapItems.values}"); // (Guga, Joca)
  print("Dad is: ${mapItems["dad"]}"); // Dad is: Guga
  print("Brother is: ${mapItems["brother"]}"); // Brother is: Joca
  print("Son is (must be null): ${mapItems["son"]}"); // null


}

