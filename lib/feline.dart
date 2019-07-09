import 'mamal.dart';

class Feline extends Mamal {

  bool hasClaws = true;

  void grow() => print("grrrrrrr");

  @override
  void test() {
    //print("testing feline");
    super.test();
  }

}