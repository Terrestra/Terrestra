part of terrestra;

class Game {
  
  CanvasRenderingContext2D ctx;
  num canvasWidth;
  num canvasHeight;
  
  AssetManager assetManager;
  
  Game(AssetManager this.assetManager);
  
  void init(CanvasRenderingContext2D ctx){
    this.ctx = ctx;
    canvasWidth = ctx.canvas.width;
    canvasHeight = ctx.canvas.height;
    

  }
}

