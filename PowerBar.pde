public class PowerBar {
  int x, y;
  float w, h;
  color green, orange, red;
  
  PowerBar(int newX, int newY, float newW, float newH) {
    x= newX;
    y= newY;
    w= newW;
    h= newH;
    
    green = color(66, 106, 90);
    orange = color(255, 212, 50);
    red = color(232, 75, 38);
  }
  
  void display() {
    noStroke();
    
    //for(int i=0;i>=-200;i--) {
      if (h<=-150) {
        fill(red);
      }
      else if (h<=-100) {
        fill(orange);
      }
      else {
        fill(green);
      }
    rect(x, y, w, h);
  }
  
  void move(int hValue) {
    h= hValue;
  }
  
  void setGradient() {
    color c1 = color(66, 106, 90);
    color c2 = color(73,232,62);

    noFill();

    for (int i = y; i <= y-h; i++) {
      float inter = map(i, y, 200, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}