class Obsticle{
  // variables
  int x; int y; int w; int h;
  
  int left; int right; int top; int bottom;
  
  int speed; 
  
  PImage obsticle;
  
  Obsticle(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    speed = -10;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
        
  }
  
  void render(){
    imageMode(CENTER);
    obsticle = loadImage("obsticle.png");
    image(obsticle,x,y,w,h);
    obsticle.resize(w, h);
    //rectMode(CENTER);
    //rect(x,y,w,h);
  }
  
    void move(){ x += speed;
    left = x -w/2; right = x + w/2;
    top = y - w/2; bottom = y + w/2;
  }

   void lose(Player aPlayer){ 
    if (top <= aPlayer.bottom && bottom >= aPlayer.top &&
        left <= aPlayer.right && right >= aPlayer.left){
          aPlayer.shouldRemove = true;
          state = 2;
          s1.isGoing = false;
           }
  } 
 void  offScreen() {    
    if (right <= 0) { 
    x = int(random(1400, 1800)); y = int(height - 25); w = 90; h = int(random(100,475));}
  }

}
