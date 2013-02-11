library terrestra;

import "dart:html";
import 'dart:json';

part 'lib/chat.dart';
part 'lib/messages.dart';

main() {
  //init the listener(s) for the startsite
  init();
}

/**
 * Starts the websocket connect and listeners
 * 
 */
startWebsocket() {
  WebSocket ws = new WebSocket("ws://127.0.0.1:8080/ws");
  
  Chat chat = new Chat(ws);
  
  String sending = stringify({"messageType": Messages.CHAT, "chat": "test"});
  
  
  ws.onOpen.listen( (a) {
    
  //ws.send(JSON.stringify({"messageType": 3, "chat" : "Welcome to the Chat!"}));
  
  });
  
  ws.onError.listen((a){
    print("F7U12");
    print(a.toString());
  });
  
  ws.onClose.listen((a){
    print("closing connection");
  });
  
  ws.onMessage.listen( (message) {
    print("Message Recieved");
    Map messageJson = parse(message.data);
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


/**
 * initialize page index
 * 
 */
init() {
  var playButton = query('#playButton');
  
  //on click show gamefield
  playButton.onClick.listen((event) => showGameField());
  
  var loginDiv = query('#login');
  
  //make login field invisible
  loginDiv.onClick.listen((event)=>loginDiv.attributes['style'] = 'display:none');
}

/**
 * set display style of canvas to true
 */
void showGameField() {
  //start websocket and
  startWebsocket();
  //display the field 
  query('#canvas_container').attributes['style'] = 'display:true';
}


