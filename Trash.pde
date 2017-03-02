public class Trash {
  boolean empty= true;
  PImage imgTrashEmpty, imgTrashFull;
  
  Trash() {
    imgTrashEmpty = loadImage("trash-empty.png");
    imgTrashFull = loadImage("trash-full.png");
  }
  
  void display() {
    if (empty) {
      image(imgTrashEmpty, width/2-75, 100);
    }
    else {
      image(imgTrashFull, width/2-75, 100);
    }
  }
}