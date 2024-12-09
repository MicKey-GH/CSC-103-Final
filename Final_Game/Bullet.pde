class Bullet {
  // variables
  Animation BulletAnimation;
  PImage[] BulletImages = new PImage [6];
  int x; int y; int d;
  int speed;
  
  boolean shouldRemove;
  
  int left; int right; int top; int bottom;
  
  //constructor 
  Bullet (int startingX, int startingY){
    
    x = startingX; y = startingY;
    d = 15; speed = 15;
    
    shouldRemove = false;
    
    left = x -d/2; right = x + d/2;
    top = y - d/2; bottom = y + d/2;
    
     for (int index=0; index<BulletImages.length; index++) {
      BulletImages[index] = loadImage("Bullet"+index+".png");
      BulletImages[index].resize(d,d);
    }

    BulletAnimation = new Animation(BulletImages, 0.2, 2);
  }
  
  
  void render(){
    //circle(x,y,d);
     BulletAnimation.display(x, y);
     BulletAnimation.isAnimating = true;
  }
  
  void move(){
    x += speed;
    left = x -d/2; right = x + d/2;
    top = y - d/2; bottom = y + d/2;
  }


  void checkRemove(){
  if (x > width){ shouldRemove = true; }
  }
  
  void shootEnemy (Enemy anEnemy){
    if (top <= anEnemy.bottom && bottom >= anEnemy.top &&
        left <= anEnemy.right && right >= anEnemy.left){
          anEnemy.x = 1400; anEnemy.y = int(random(50,height - 100));
          shouldRemove = true;
          s1.updateScore(100);
           }
           
  } 
}
