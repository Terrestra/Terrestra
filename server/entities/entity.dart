part of terrestra;


/**
 *
 * Entity
 *
 */
class Entity {
  int id;
  var type;
  var kind;
  int x;
  int y;

  var baseState = [];

  /**
   * Init new entity
   *
   * @param int id
   * @param var type
   * @param var kind
   * @param int x
   * @param int y
   *
   * @return void
   */
  Entity(int id, var type, var kind, int x, int y) {
    this.id = id;
    this.type = type;
    this.kind = kind;
    this.x = x;
    this.y = y;
  }

  /**
   * Sets position of entity
   */
  void setPosition(int x, int y){
    this.x = x;
    this.y = y;
  }

  /**
   * returns baseState of entity(position, kind, id)
   *
   * @return array
   */
  getBaseState() {
    baseState['id'] = this.id;
    baseState['kind'] = this.kind;
    baseState['x'] = this.x;
    baseState['y'] = this.y;

    return baseState;
  }

}
