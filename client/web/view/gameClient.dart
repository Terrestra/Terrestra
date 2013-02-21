part of terrestra;

class GameClient {
  
  void requestPlayer(){
    
  }
  
  void sendMove(int x, int y){
    sending(type.move, x, y);
  }
  
  void sendEndOfMove(int direction){
    
  }
  
  void revieveMove(){
    //player bewegen (x+/-, y+/+)
    //player.moving = true;
  }
  
  void recieveEndOfMove(){
    //player.moving = false;
  }
  
}

