
menu zoneMenu;
String[] zoneNumbers = new String[5];

void setup(){
 size(600, 400);

 zoneMenu = new menu(100, 50, zoneNumbers);
 
 //ASSIGN VALUES TO zoneNumbers ARRAY
 zoneNumbers[0] = "Pacific";
 zoneNumbers[1] = "Mountian";
 zoneNumbers[2] = "Central";
 zoneNumbers[3] = "Eastern";
 zoneNumbers[4] = "Zulu";
 


}

void draw(){

 background(0, 0, 0);
 zoneMenu.display();
 zoneMenu.mouseOver();
// println(mousePressed);  

  
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
  String[] menuItems;
   
     boolean canOpenMenu = false;
     boolean openMenu = false;
     boolean mouseOut = true;
     menuList openMenuList;
     
  
  menu(int tempX, int tempY, String[] tempMenuItems) {
    
    xPos = tempX;
    yPos = tempY;
    menuItems = tempMenuItems;
    
    openMenuList = new menuList(xPos, yPos, boxWidth, boxHeight, menuItems);
    
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
   

   
   if (mouseOut == true) {
    
      boxFill = color(0, 0, 0);
      triFill = color(255, 255, 255);
      openMenu = false;
      canOpenMenu = false;
      mouseOut = openMenuList.mousePos();
      
   }
    
   if( mouseX > xPos && mouseX < (xPos + boxWidth) && mouseY > yPos && mouseY < (yPos + boxHeight) ){
   
       boxFill = color(255, 255, 255);
       triFill = color(0, 0, 0);
       canOpenMenu = true;
       mouseOut = false;
   }
   
       if (mousePressed == true && canOpenMenu == true) {
         boxFill = color(180, 180, 180);
         mouseOut = false;
         openMenu = true;
       }
       
       if (openMenu == true) {
         
         openMenuList.display();
         mouseOut = openMenuList.mousePos();
         
       }
     

 
    
  }
  
}

class menuList {
 
  int menuItemsCount;
  int menuHeight;
  int menuX;
  int menuY;
  int menuWidth;
  int menuLineHeight;


  
 menuList(int tempMenuX, int tempMenuY, int tempMenuWidth, int tempLineHeight, String[] tempItemList) {
   
  menuX = tempMenuX;
  menuY = tempMenuY;
  menuWidth = tempMenuWidth;
  menuItemsCount = tempItemList.length;
  menuLineHeight = tempLineHeight;

  
  menuHeight = (menuLineHeight * menuItemsCount);
   
 }
 
 void display(){
  
    fill(255, 255, 255);
    rect(menuX, menuY, menuWidth, menuHeight);
 }
 
 
 //HAS THE MOUSE LEFT THE HOUSE?? REPORT THAT SHIT!
 boolean mousePos(){
   
   if ( ( mouseX < menuX )|| (mouseX > ( menuX + menuWidth ) ) ) {
      return true;
   }
   if ( ( mouseY < menuY )|| (mouseY > ( menuY + menuHeight) ) ) {
      return true; 
   }
   else { 
     return false;
   }
  
   
   
 }
  
}

