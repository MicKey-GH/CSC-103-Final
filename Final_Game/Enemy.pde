class Enemy {
  // variables
  //PImage Missile;
  Animation RocketAnimation;
  PImage[] RocketImages = new PImage [6];
  int x;
  int y;
  int w;
  int h;

  int left;
  int right;
  int top;
  int bottom;

  int speed;

  boolean shouldRemove;
  boolean reset;

  Enemy(int startingX, int startingY, int startingW, int startingH) {
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

    speed = -15;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;

    shouldRemove = false;

    for (int index=0; index<RocketImages.length; index++) {
      RocketImages[index] = loadImage("Rocket"+index+".png");
      RocketImages[index].resize(w, h);
    }

    RocketAnimation = new Animation(RocketImages, 0.2, 3);
  }

  void render() {
    imageMode(CENTER);
    // Missile = loadImage("Missile.png");
    //image(Missile,x,y,w,h);
    // Missile.resize(w, h);
    RocketAnimation.display(x, y);
    RocketAnimation.isAnimating = true;


    //rectMode(CENTER);
    //rect(x,y,w,h);
  }

  void move() {
    x += speed;
    left = x -w/2;
    right = x + w/2;
    top = y - w/2;
    bottom = y + w/2;
  }

  void lose(Player aPlayer) {
    if (top <= aPlayer.bottom &&
      bottom >= aPlayer.top &&
      left <= aPlayer.right &&
      right >= aPlayer.left) {
      aPlayer.shouldRemove = true;
      state = 2;
      s1.isGoing = false;
    }
  }
  void  offScreen() {
    if (right <= 0) {
      x = int(random(1400, 1800));
      y = int(random(50, height - 50));
    }
  }
}
