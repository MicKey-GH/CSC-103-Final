class Score{
  
  int Timer;
  int startTime;
  int currentTime;
  int interval = 1000;
  int currentScore;
  int x; int y;
  
  boolean isGoing;
  
  Score(int sX, int sY){    
    startTime = millis();
    
    Timer = startTime;
    x = sX;
    y = sY;
    textSize (70);
    
    isGoing = false;

  }
  
  
  
  void render(){
 fill(0,0,255);
 currentTime = millis();
updateScore(1);
 text (currentScore, x,y);

}
  
 void updateScore(int num){
  if ((currentTime - startTime > interval) && isGoing == true){
    currentScore += num;}
    
 }
  
  
  
  
}
