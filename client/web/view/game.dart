part of terrestra;

class Game {
  
  CanvasRenderingContext2D ctx;
  num canvasWidth;
  num canvasHeight;
  
  AssetManager assetManager;
  
  Player player;
  GameClient gameClient;
  
  Game(AssetManager this.assetManager);
  
  void init(CanvasRenderingContext2D ctx){
    this.ctx = ctx;
    canvasWidth = ctx.canvas.width;
    canvasHeight = ctx.canvas.height;
    gameClient.requestPlayer();
    this.gameClient = new GameClient();
  }
  
  void onKeyDown(KeyboardEvent key){
    switch(key.keyCode){
      case 37: //left
        gameClient.sendMove(player.x - player.speed, player.y);
        break;
      case 39: //right
        gameClient.sendMove(player.x - player.speed, player.y);
        break;
      case 38: //up
        gameClient.sendMove(player.x - player.speed, player.y);
        break;
      case 40: //down
        gameClient.sendMove(player.x - player.speed, player.y);
        break;
      default:
        print('${key.keyCode}');
        break;
    }
  }
  
  void onKeyReleased(KeyboardEvent key){
    switch(key.keyCode){
      case 37: //left
        gameClient.sendEndOfMove(Types.MOVE_LEFT);
        break;
      case 39: //right
        gameClient.sendEndOfMove(Types.MOVE_RIGHT);
        break;
      case 38: //up
        gameClient.sendEndOfMove(Types.MOVE_UP);
        break;
      case 40: //down
        gameClient.sendEndOfMove(Types.MOVE_DOWN);
        break;
      default:
        print('${key.keyCode}');
        break;
    }
  }
}

