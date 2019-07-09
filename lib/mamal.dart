import 'animal.dart';

class Mamal extends Animal{

  bool hasHair = true;
  bool hasBackbone = true;
  bool isWarnBlooded = true;

  void walk() => print("walking");

  void test() {
    print("testing mamal");
    //super.test();
  }

}