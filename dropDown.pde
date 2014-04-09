
menu zoneMenu;
int[] zoneNumbers = new int[5];

void setup(){
 size(600, 400);
 background(0, 0, 0);
 zoneMenu = new menu(100, 200);
 
 //ASSIGN VALUES TO zoneNumbers ARRAY
 zoneNumbers[0] = 0;
 zoneNumbers[1] = 1;
 zoneNumbers[2] = 2;
 zoneNumbers[3] = 3;
 zoneNumbers[4] = 4;


}

void draw(){

 zoneMenu.display();
 zoneMenu.mouseOver();
 println(zoneNumbers);  

  
}
class menu {

  int xPos;
  int yPos;
  int boxWidth = 200;
  int boxHeight = 25;
  int tx1;
  int ty1;
  int tx2;
  int ty2;
  int tx3;
  int ty3;
  color boxFill = color(0, 0, 0);
  color triFill = color(255, 255, 255);
  
  menu(int tempX, int tempY) {
    
    xPos = tempX;
    yPos = tempY;
    
    //TRANGULATE!
    tx1 = ( xPos + boxWidth - 20);
    tx2 = ( xPos + boxWidth - 10);
    tx3 = ( xPos + boxWidth - 15);
    ty1 = ( yPos + (boxHeight / 2) - 3);
    ty2 = ( yPos + (boxHeight / 2) - 3);
    ty3 = ( yPos + (boxHeight / 2) + 2);
    
  }
  
  void display(){
   
   fill(boxFill); 
   stroke(255, 255, 255);
   rect(xPos, yPos, boxWidth, boxHeight);
   noStroke();
   fill(triFill);
   triangle(tx1, ty1, tx2, ty2, tx3, ty3);
    
  }
  
  void mouseOver() {
   
   if( mouseX > xPos && mouseX < (xPos + boxWidth) && mouseY > yPos && mouseY < (yPos + boxHeight) ){
   
       boxFill = color(255, 255, 255);
       triFill = color(0, 0, 0);
     
   } else {
    
      boxFill = color(0, 0, 0);
      triFill = color(255, 255, 255);
     
   }
    
  }
  
}



