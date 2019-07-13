import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

main(List<String> arguments) async {

  var data = "Hello World";

  List<int> dataToSend = utf8.encode(data);

  int port = 3000;

  // Server - This server will listen for data.
  await RawDatagramSocket.bind(InternetAddress.loopbackIPv4, port).then((RawDatagramSocket udpSocket) {

      udpSocket.listen((RawSocketEvent event) {
        if(event == RawSocketEvent.read) {
          Datagram datagram = udpSocket.receive();
          print(utf8.decode(datagram.data));
        }
      });
      
      // Client
      udpSocket.send(dataToSend, InternetAddress.loopbackIPv4, port);
      print("Data Sent!");
  });


}

