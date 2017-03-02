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

  void move() {
    
  }
}