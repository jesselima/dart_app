import 'package:http/http.dart' as http;

main(List<String> arguments) async {

  var url = "https://www.iaaf.org/records/toplists/sprints/100-metres/outdoor/men/senior/2019";

  var response = await http.get(url);
  print("Response status code: ${response.statusCode}");
  print("Response body: \n${response.body}");

}

