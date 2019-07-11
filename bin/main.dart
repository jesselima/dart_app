import 'dart:async';

int counter = 0;

main(List<String> arguments) {

  // TESTING THE TIMER
  print("\n\n======= TIMER");
  Duration duration = Duration(seconds: 5);

  Timer timer1 = Timer.periodic(duration, timeout /*calling a function as object*/);
//  Timer timer2 = Timer.periodic(duration, timeoutTemp /*calling a function as object*/);

  print("Started: ${getTime()}");



} // CLOSES MAIN()


// CALLBACKS - Requires: import 'dart:async';

String getTime() {
  DateTime dateTime = DateTime.now();
  return dateTime.toString();
}


// Triggers forever for the given interval.
void timeout(Timer timer) {
  print("Timeout: ${getTime()}");
  counter++;
  if(counter >= 1) {
    counter = 0;
  }
}

// Repeats the number of repetitions, then cancel.
int repetitions = 5;
void timeoutTemp(Timer timer) {
  print("Timeout: ${getTime()}");
  counter++;
  if(counter >= repetitions) {
    timer.cancel();
  }

}

