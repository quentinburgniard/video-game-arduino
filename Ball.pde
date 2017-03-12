public class Ball {
  int x, y;
  PImage imgBall;

  Ball(int newX, int newY) {
    imgBall = loadImage("ball-100.png");
    x= newX;
    y= newY;
  }

  void display() {
    image(imgBall, x, y);
  }

  void move(int strenght) {
    y=(int)(y+strenght*2.5);
    x=(x+yOrientation*10);
    
    int deltaY=(y-(height-100));
    int deltaX=(x-(width/2-50));
    
    if(deltaY != 0 && deltaX !=0){
      int a=deltaY/deltaX;
      println (a);
    }
  }
}