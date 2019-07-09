import 'package:dart_app/monster.dart';


main(List<String> arguments) {

  Monster monster = Monster();


  // TODO Info ->  Info: To allow mixing inheritance, we use:
  // TODO Info ->  "Monster extends Feline with Dragon, Ghost"
  // TODO Info ->  Dragon and Ghost cannot extend anyone.


  // TODO Info ->  Monster nos can breathFire due to mixing with Dragon.
  monster.breathFire;

  // TODO Info ->  Monster nos can breathFire due to mixing with Dragon.
  monster.walkThroughWalls;

  monster.test();


}

