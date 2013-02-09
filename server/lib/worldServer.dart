part of terrestra;

class WorldServer {

  List players = [];
  int id;
  int maxPlayers;
  int playerCount;

  /*
   * new worldServer with id and maxPlayercount
   *
   */
  WorldServer(int id,int maxPlayers) {
    this.id = id;
    this.maxPlayers = maxPlayers;

    this.playerCount = 0;
  }

  /**
   * add player to world
   */
  void addPlayer(Player player){
    this.players.add(player);
    print("Adding Player with following ID:");
    print(player.id);
  }

  /**
   * removePlayer from world
   */
  void removePlayer(Player player) {

    //@todo
    //broadcast für despawn einbauen
    //remove aus der entities-list
    for (int i = 0; i < players.length; i++){
      if(players[i].id == player.id){
        players.removeAt(i);
      }
    }
  }

  /**
   *
   */
  void sendChatMessage(message){
    for(final Player p in players){
      p.send(message);
    }
  }
}
