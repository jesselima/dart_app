import 'package:dart_app/employee.dart';

// TODO Info ->  The interface stands for a contract between toe classes
// TODO Info ->  When you implement a interface the compiler complains about
// TODO Info ->  the methods(functions) and getters and setters from the implemented class.

class Manager implements Employee {

  String name = "Bob";

  void test() {
    print("Test in Manager class");
    print(super.toString()); // Logs: Instance of 'Manager'

  }

  /*
  When we inherit, we get all the properties from the class I am inheriting.
  On the other hand, when implementing, we have to to all the implementation by
  ourselves. We have to build everything from the ground up.
   */

}