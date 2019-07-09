import 'package:dart_app/counter.dart';

main(List<String> arguments) {

 Counter<double> doubles = Counter<double>();
 doubles.addAll([1.0,2.2,3.6]);
 doubles.total();

 Counter<int> ints = Counter<int>();
 ints.addAll([1,2,3]);
 ints.total();

}

