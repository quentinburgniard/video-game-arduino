public class Arrow {
  int x, y;
  float angleVision = 90;
  PImage imgArrow, imgBackground;

  Arrow(int newX, int newY) {
    imgArrow= loadImage("arrow.png");
    imgBackground= loadImage("background.png");
    x= newX;
    y= newY;
  }

  void display() {
    //translate(x, y);
    rotate(PI/3*0.0);
    image(imgArrow, x, y);
  }

  void move() {
    float angle= yPosition;
    angle= angle*angleVision/70;
    angle= angle*PI/180;
    rotate(angle);
  }
}