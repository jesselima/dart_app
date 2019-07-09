

main(List<String> arguments) {

  List<int> values = [1,2,3,4,5];

  print(add(10, values));

}


T add<T extends num>(T inputValue, List<T> items) {

  T returnValue = inputValue;

  items.forEach((valueFromAListPosition) {
    returnValue = returnValue + valueFromAListPosition;
  });

  return returnValue;

}



