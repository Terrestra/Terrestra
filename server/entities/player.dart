part of terrestra;

/**
 *
 *
 *
 */
class Player extends Character {

  WorldServer world;
  TerestraConnection tConnection;

  bool hasEnteredWorld = false;
  bool isDead = false;

  int id;

  /**
   * Construct
   */
  Player(TerestraConnection con, WorldServer world) : super(1, "Player", "Hero", con.id*10, con.id*10, 2){
    this.tConnection = con;
    this.world = world;

    this.id = con.id;

    this.tConnection.wsConnection.listen((event) {
      if (event is MessageEvent) {
        this.onMessage(event.data);
      } else if (event is CloseEvent) {
        print("Player with following ID is leaving:");
        print(this.id);
        this.world.removePlayer(this);
      }
    });
  }
  
  /**
  *
  *
   */
  void onMessage (message) {
    Map messageJson = parse(message);
    print("JSON arrived");
    switch(messageJson['messageType']){
      case Messages.BATTLE:
        //Do Battle
        break;
      case Messages.MOVE:
        //Do Move
        //this.movePlayer(messageJson.direction);
        break;
      case Messages.UPDATE_HP:
        //Do Update HP
        //this.updateHp(messageJson.hpModifier);
        break;
      case Messages.CHAT:
        //Do send Chatmessage
        print("JSON was Chat-Type");
        this.tConnection.broadcast(message);
        break;
      case Messages.UPDATE_ENTITY:
        //Do Update Entity
        //this.updateHp(messageJson.hpModifier);
        break;
      default:
        break;
    }
  }

  /**
   *
   * Send message
   *
   */
  void send(message){
    this.tConnection.wsConnection.send(message);
  }
}
