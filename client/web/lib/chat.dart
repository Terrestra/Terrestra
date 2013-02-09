part of terrestra;

/**
 *
 */
class Chat {

  var chatInputField;
  var chatOutputField;

  /**
   *
   */
  Chat(WebSocket ws){
    this.chatInputField = query("#chatInput");
    this.chatOutputField = query('#chatOutput');


    //react on input
    chatInputField.on.input.add((a) {

      if(chatInputField.value == null){
        chatInputField.text = "ehhh";
      }else {
        ws.send(JSON.stringify({'messageType': Messages.CHAT, 'chat' : chatInputField.value}));
      }

    });

    if(chatInputField.value == null){
      ws.send(" ");
    }else {
      ws.send(chatInputField.value);
    }
  }

}
