library terrestra;

import "dart:html";
import 'dart:json';

part 'lib/chat.dart';
part 'lib/messages.dart';

main() {
  WebSocket ws = new WebSocket("ws://192.168.2.103:8080/ws");

  Chat chat = new Chat(ws);

  var text = query("#clientInput");

  ws.on.open.add( (a) {

    ws.send("Welcome to the Chat!");

  });

  ws.on.error.add((a){
   print("F7U12");
   print(a.toString());
  });

  ws.on.close.add((a){
    print("closing connection");
  });

  ws.on.message.add( (message) {
    var messageData = JSON.parse(message.data);
    print(messageData["message"]);


    query("#text").text = messageData["message"];
  });

}
