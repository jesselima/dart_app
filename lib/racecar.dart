import 'package:dart_app/car.dart';

class RaceCar extends Car {

  RaceCar() {
    this.hasHorn = true;
    this.hasWheels = true;
  }

  //void honk() => print("beep beep");
  void honk() {
    print("Honk in race carp");
    super.honk();
  }
}
