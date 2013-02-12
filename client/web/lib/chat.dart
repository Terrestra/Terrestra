part of terrestra;

/**
 *
 */
class Chat {

  List history = [];
  int maxHistory = 15;
  var chatInputField;
  var chatOutputField;
  WebSocket ws;

  /**
   *
   */
  Chat(WebSocket ws){
    this.chatInputField = query("#chatInput");
    this.chatOutputField = query('#chatOutput');
    this.ws = ws;


    //react on input
    chatInputField.onKeyDown.listen((a) {
      if(a.keyCode == 13){
        if(chatInputField.value == null || chatInputField.value.length <= 0){
          //chatInputField.text = "ehhh";
        }else {
          //TODO playerName sollte hier verfügbar sein
          print("send JSON");
          String sending = stringify({"messageType": Messages.CHAT, "chat": chatInputField.value});
          print(sending);
          this.ws.send(sending);
          print("JSON was sent");
          chatInputField.value = "";
        }
      }
    });

    if(chatInputField.value == null){
      //ws.send(" ");
    }else {
      //ws.send(chatInputField.value);
    }
  }
  
  /**
   * 
   */
  void addChatMessage(String message, String playerName){
    history.add(message);
    if(history.length >= maxHistory){
      history.first.remove();
    }
    //TODO Strings ausgeben
    //String line = "Player " + playerName + ": " + message;
    chatOutputField.text = message;
  }
}
