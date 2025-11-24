class Brik{
  int posX, posY;
  int farve;
  int size;
  
  
  Brik(int posX, int posY, int size, int farve){
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.farve = farve;
  }
  
  
  void display(){
    fillSpillerFarve(farve);
    stroke(0);
    strokeWeight(2);
    triangle(posX-size/2, posY+(size*1), posX+size/2, posY+(size*1), posX, posY-(size*0.95));
    circle(posX, posY-(size*0.5), size);
  }
  
  void flytTil(int newX, int newY){
    
  }
  
  boolean musErPå(){
    return false;
  }
}
