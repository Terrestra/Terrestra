part of terrestra;

class TerestraConnection {

  WebSocketConnection wsConnection;
  int id;
  WorldServer server;

  TerestraConnection(WebSocketConnection con, WorldServer serv){
    this.wsConnection = con;
    this.server = serv;
    if(serv.players.length <= 0) {
      this.id = 1;
    } else {
      this.id = serv.players.last.id + 1;
    }
  }
  
  /**
   * Sends a Message to all Players on one Worldserver
   */
  void broadcast(message){
    for(final Player p in server.players){
      p.send(message);
    }
  }
}