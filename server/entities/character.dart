part of terrestra;

class Character extends Entity {
  int id;
  var type;
  var kind;
  int x;
  int y;
  int speed;

  int maxHitPoints;
  int hitPoints;

  int Orientation;

  /**
   * init new character with super constructor of entity
   */
  Character(int id, var type, var kind, int x, int y, int speed) : super(id,type,kind,x,y) {
    this.id = id;
    this.type = type;
    this.kind = kind;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  /**
   * sets health at maximum
   */
  int hasFullHealth() {
    this.hitPoints == this.maxHitPoints;
    return this.hitPoints;
  }

  /**
   * gets health of character
   */
  int health() {
    return this.hitPoints;
  }
}
