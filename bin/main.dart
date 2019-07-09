

main(List<String> arguments) {

  List<int> numbers = List<int>();
  numbers.addAll([1,2,3,4,5]);
  print(numbers);

  List<String> strings = List<String>();
  strings.addAll(["a","b","c","d","e"]);
  print(strings);


    // DOES NOT WORK PROPERLY
//  add(2, 3); // Inference
//  add<int>(2, 3);
//  add<double>(2.0, 3.5);
//  add<String>("Hello", "World");

  // WORKS FINE BUT NOT FOR STRINGS BECAUSE IT EXTENDS "extends num"
  addNumbers(2, 3); // Inference
  addNumbers<int>(2, 3);
  addNumbers<double>(2.0, 3.5);
  //addNumbers<String>("Hello", "World");

}


// SIMPLE EXAMPLES

//void add<T>(T a, T b) {
//  print(a + b);
//}


// "T" will be any class that extends
void addNumbers<T extends num>(T a, T b) {
  print(a + b);
}



