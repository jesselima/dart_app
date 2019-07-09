import 'dragon.dart';
import 'feline.dart';
import 'ghost.dart';


class Monster extends Feline with Ghost, Dragon {

  bool glowInDark = true;

  @override
  void test() {
    print("Test called in Moster");
    super.test();
  }
}
