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

    this.tConnection.wsConnection.onClosed = (status, reason) {
      print("on closed");
      this.world.removePlayer(this);
    };

    /**
     *
     *
     */
    this.tConnection.wsConnection.onMessage = (message) {
      var messageJson = JSON.parse(message);
        switch(messageJson.messageType){
          case Messages.BATTLE:
            //Do Battle
            break;
          case Messages.MOVE:
            //Do Move
            this.movePlayer(messageJson.direction);
            break;
          case Messages.UPDATE_HP:
            //Do Update HP
            this.updateHp(messageJson.hpModifier);
            break;
          case Messages.CHAT:
            //Do Update HP
            this.world.sendChatMessage(message);
            break;
          default:
            break;
        }

    };
  }

  /**
   *
   * Send message
   *
   */
  void send(message){
    this.tConnection.wsConnection.send(message);
  }

  /**
   *
   *
   */
  void movePlayer(int direction){
      switch(direction){
        case 0:
          //Left
          this.x -= this.speed;
          break;
        case 1:
          //Right
          this.x += this.speed;
          break;
        case 2:
          //Up
          this.y -= this.speed;
          break;
        case 3:
          //Down
          this.y += this.speed;
          break;
      }
  }

  /**
   *
   */
  void updateHp(int hpModifier){

  }
}
