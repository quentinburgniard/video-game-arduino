public class Ball {
  int x, y;
  PImage imgBall;
  //color blue;

  Ball(int newX, int newY) {
    imgBall = loadImage("ball-100.png");
    x= newX;
    y= newY;
  }

  void display() {
    image(imgBall, y, x);
  }

  void move() {
    x= x+xValue;
    y= y+yValue;
  }
}