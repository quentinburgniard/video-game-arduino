import processing.net.*;
import processing.serial.*;

int xPosition, yPosition, xValue, yValue, longShot, shortShot, strenghtValue;
PImage imgOffice;

Serial port;
Ball myBall;
Arrow myArrow;
PowerBar myPowerBar;
Trash myTrash;

void setup() {
  surface.setTitle("Corbeille");
  size(500, 700); //fenêtre vierge 2D
  //println(Serial.list());   //Affiche console liste ports série disponibles
  port = new Serial(this, "/dev/tty.usbmodem1411", 9600);
  port.bufferUntil('\n'); //Attendre saut de ligne pour générer évènement série
  
  imgOffice = loadImage("office.jpg");
  
  myBall = new Ball(width/2-50, height-100);
  
  myArrow = new Arrow(-25, -25);
  
  myPowerBar = new PowerBar(width-60, height-30, 30, -200);
  
  myTrash = new Trash();
}

void draw() {
  image(imgOffice, 0, 0, width, height);
  
  myTrash.display();
  
  strenghtValue = strenght();
  myPowerBar.move(strenghtValue);
  myPowerBar.display();
  
  myBall.move();
  myBall.display();
  
  rotate(0);
  translate(width/2,height/2+180);
  myArrow.move();
  myArrow.display();
    
  delay(100);
}

void serialEvent(Serial port) {
  String serialStr = port.readStringUntil('\n');
  serialStr = trim(serialStr);

  int values[] = int(split(serialStr, ','));

  if ( values.length == 5 ) {

    xPosition= values[0]-346;
    yPosition= values[1]-344;
    
    xValue= calculate( values[0], 344 );
    yValue= calculate( values[1], 346 );
    
    longShot= values[3];
    shortShot= values[4];
  }
}

int calculate( int returnValue, int baseValue ) {
  int diff= (returnValue-baseValue)/10;
  return diff;
}

int strenght() {
    if (longShot == 1 && strenghtValue >= -200) {
      strenghtValue= strenghtValue-10;
    }
    else {
      strenghtValue= 0;
    }
    return strenghtValue;
  }