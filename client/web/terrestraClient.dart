library terrestra;

import "dart:html";
import 'dart:json';

part 'lib/chat.dart';
part 'lib/messages.dart';

main() {
  WebSocket ws = new WebSocket("ws://192.168.2.111:8080/ws");

  Chat chat = new Chat(ws);
  
  String sending = JSON.stringify({"messageType": Messages.CHAT, "chat": "test"});
    
  ws.on.open.add( (a) {

    //ws.send(JSON.stringify({"messageType": 3, "chat" : "Welcome to the Chat!"}));

  });

  ws.on.error.add((a){
   print("F7U12");
   print(a.toString());
  });

  ws.on.close.add((a){
    print("closing connection");
  });

  ws.on.message.add( (message) {
    print("Message Recieved");
    Map messageJson = JSON.parse(message.data);
    print("Message Parsed");
        switch(messageJson['messageType']){
          case Messages.BATTLE:
            //Do Battle
            break;
          case Messages.CHAT:
            //Add Chat Message to History
            //print(messageJson.chat);
            chat.addChatMessage(messageJson['chat'], "TODO");
            break;
          default:
            break;
        }
  });
}
