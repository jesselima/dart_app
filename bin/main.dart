import 'package:dart_app/someclass.dart';

main(List<String> arguments) {

  SomeClass s = SomeClass();

  // ERROR HANDLING ============================================================
  print(s.printDivider() + "ERROR HANDLING:");

  // TODO Info ->  Error is a program failure
  // TODO Info ->  Exception can be handled

  // This expression will cause a error
    /*
        int age;
        int dogYears = 7;
        print(age * dogYears);
     */

  // Unhandled exception:
  // NoSuchMethodError: The method '*' was called on null.


  // TRY/CATCH
  print("\nTRY/CATCH:");

  // We will know there was an error but the application does no crash
  try {
    int age;
    int dogYears = 7;
    print(age * dogYears);
  } catch (e) {
    print("There was an error");
  } finally {
    print("Complete");
  }



  // THROWING EXCEPTIONS
  print("\nTHROWING EXCEPTIONS:");

  // TODO Info ->  NEVER LET A ERROR GO UnThrow

  try {
    int age2;
    int dogYears2 = 8;

    if(age2 == null) throw NullThrownError();
    if(age2 != 7) throw Exception("Age must be 7"); // TODO DOES NOT WORK

    print(age2 * dogYears2);
  }

  on NullThrownError {
    print("The value was null");
  }
  on NoSuchMethodError {
    print("Sorry. No such method.");
  }

  catch (e) {
    print("Unkown error");
  }
  finally {
    print("Complete");
  }




}

