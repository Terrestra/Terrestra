part of terrestra;

class TerrestraSocket {
  WebSocket ws;
  
  /**
   * Makes a new WebSocket Connection to "ws://127.0.0.1:8080/ws"
   */
  TerrestraSocket() {
    this.ws = new WebSocket("ws://127.0.0.1:8080/ws");
    
    Chat chat = new Chat(ws);
    
    String sending = stringify({"messageType": Messages.CHAT, "chat": "test"});
    
    
    //onOpen event listener
    this.ws.onOpen.listen( (a) {
      
      //TODO implement onOpen handling
      //ws.send(JSON.stringify({"messageType": 3, "chat" : "Welcome to the Chat!"}));
      
    });
    
    
    //onError listener
    this.ws.onError.listen((a){

      //TODO implement error handling
      
    });
    
    //onClose listener
    this.ws.onClose.listen((a){
      
      print("closing connection");
      
    });
    
    //onMessage recieve listener
    this.ws.onMessage.listen( (message) {
      print("Message Recieved");
      Map messageJson = parse(message.data);
      print("Message Parsed");
      
      //TODO auslagern in message handling
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

}
