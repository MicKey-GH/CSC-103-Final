class Player { 
  //variables
  Animation JetAnimation;
  PImage[] JetImages = new PImage [4];
  int x; int y; int w; int h;
  
  boolean isMovingLeft;
  boolean isMovingRight;  
  boolean isJumping;
  boolean isFalling;
  
  boolean shouldRemove;
  
  int speed;
  int jumpHeight;
  int jY;
  
  int left; int right; int top; int bottom;
  
  // constructor
  
  Player(int sX, int sY, int sW, int sH){
    x = sX; y = sY; w = sW; h = sH;
    
    isMovingLeft = false;
    isMovingRight = false;
    
    speed = 15;
    
    left = x - w/2; right = x + w/2;
    top = y - h/2; bottom = y + h/2;
    
    isJumping = false;
    isFalling = false;
    
    jumpHeight = 600;
    jY = y - jumpHeight;
    
    shouldRemove = false;
      for (int index=0; index<JetImages.length; index++) {
      JetImages[index] = loadImage("Jet"+index+".png");
      JetImages[index].resize(w, h);
    }

    JetAnimation = new Animation(JetImages, 0.2, 5);
  }
  
  // function
  void render(){ 
   // rect(x,y,w,h); rectMode(CENTER);
    JetAnimation.display(x, y);
    JetAnimation.isAnimating = true;
       left = x -w/2; right = x + w/2; top = y - w/2; bottom = y + w/2;}  

  void jumping(){ if (isJumping == true){ y -= speed; } 
                                         }
 
  void falling(){ if (isFalling == true){ y += speed; } } 
  
  //void topOfJump(){  if (y <= jY){ isJumping = false; isFalling = true; } }
  
  void land(){ if (y >= height - h/2) {isFalling = false;  y = height - h/2;} }
  void sky(){ if (y <= 0 + h/2) {isJumping = false;  y = 0 + h/2;} }

}
