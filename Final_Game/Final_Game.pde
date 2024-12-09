PImage Road;
PImage Gameover;
PImage Missile;
Animation CityAnimation;
PImage[] CityImages = new PImage [10];
PImage CityScape;
//import gifAnimation.*;

import processing.sound.*;


//declaring vars
Player p1;
Enemy e1;
Obsticle o1;
Score s1;

ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;
//Player Sounds (from 101soundboards.COM)
SoundFile Shoot; SoundFile Driving;
SoundFile Jump; SoundFile Land;
SoundFile Impact;
// music (from Pixabay.com)
SoundFile Music;
SoundFile End;

int state = 0;
void setup(){
  size(1200,850);
  imageMode(CENTER);
   CityScape = loadImage("CityScape.jpg");
   CityScape.resize(width,height);
   
  //Road = loadImage("Road.jpg");
  
  //Road.resize(width, height);
  
  for (int index=0; index<CityImages.length; index++){
    CityImages[index] = loadImage("City"+index+".png");
  }
  
  CityAnimation = new Animation(CityImages, 0.2,4);
  
  p1 = new Player(200, height - 25, 50,50);
  e1 = new Enemy(1400,500,100,100);
  o1 = new Obsticle (1800, height - 25, 50,350);
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  s1 = new Score(1000, 50);

  enemyList.add(e1);
  
  //initilize sound variables
  Shoot = new SoundFile(this, "Shoot.mp3");
  Driving = new SoundFile(this, "Driving.mp3");
  Jump = new SoundFile(this, "Jump.mp3");
  Land = new SoundFile(this, "Land.mp3");
  Impact = new SoundFile(this, "Impact.mp3");
  Music = new SoundFile(this, "Music.mp3");
  End = new SoundFile(this, "End.mp3");
  
  // load all images for my animation
}


void draw(){
  //background(42);
  println(state);
  switch (state){
    case 0:
image(CityScape, width/2,height/2);
textSize(125);
fill(225,125,12);
text("Joy Ride", width/4, 400);

text("Press R to Start", width/6, 600);
    
    break;
    case 1:
    
      CityAnimation.display(width/10, height/10);
      CityAnimation.isAnimating = true;
 //image(Road, width/2, height/2);
  
  if(Music.isPlaying() == false){Music.play();}
    if(End.isPlaying() == true){End.stop();}
  p1.render(); p1.jumping(); p1.falling(); 
  //p1.topOfJump(); 
  p1.land();
  p1.sky();
 // p1.lose();
  o1.render();
  e1.lose(p1);
  o1.lose(p1);
  
  e1.move();
  o1.move();
  e1.offScreen();
  o1.offScreen();
  s1.render();
  for (Enemy aEnemy : enemyList){ aEnemy.render(); }
  
  // for loop for all bullets
  for (Bullet aBullet : bulletList){ aBullet.render(); aBullet.move(); aBullet.checkRemove();
      for (Enemy aEnemy : enemyList){ aBullet.shootEnemy(aEnemy); }
                                   }
  // for-loop that removes unwanted bullets
    for (int i = bulletList.size()-1; i >= 0; i -=1){ Bullet aBullet = bulletList.get(i);
        if (aBullet.shouldRemove == true){ bulletList.remove(aBullet); }
         }
      // removes unwanted enemies
    for (int i = enemyList.size()-1; i >= 0; i -=1 ){ Enemy aEnemy = enemyList.get(i);
        if (aEnemy.shouldRemove == true){ enemyList.remove(aEnemy); }
         }
    if (p1.shouldRemove == true){println("Game Over");} 
  break;
  case 2:
  if(Music.isPlaying() == true){Music.stop();}
  
  if(End.isPlaying() == false){End.play();}
  Gameover = loadImage("Gameover.jpg");
  Gameover.resize(width, height);
  background (Gameover);
  s1.render();
  
  fill(255,255,0);
  text("Press R to play again", 100, 700);

  break;
  
  }
}


  void keyPressed(){
    if (key == 'w' && p1.isJumping == false /*&& p1.isFalling == false*/)
    { p1.isJumping = true; p1.isFalling = false; /*p1.jY = p1.y - p1.jumpHeight;*/  Jump.play(); }
    
    if (key =='a'){ state+=1; s1.isGoing = false;}
    
    if (key =='r'){ state = 1; s1.currentScore = 0; e1.x = 1500; e1.y = int(random(100, height - 50)); o1.x = 1500; s1.isGoing = true; }
  }

  void keyReleased(){
    if (key == ' '){ bulletList.add(new Bullet(p1.x,p1.y) );  
    Shoot.play();}

    if (key == 'w'){ {p1.isJumping = false; p1.isFalling = true;} }
  }
