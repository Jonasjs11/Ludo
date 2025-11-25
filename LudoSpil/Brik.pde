class Brik{
  Felt felt;
  int posX, posY;
  int farve;
  int size;
  boolean erHjemme;
  
  Brik(int posX, int posY, int size, int farve){
    felt = null;
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.farve = farve;
    erHjemme = true;
  }
  
  
  void display(){
    fillSpillerFarve(farve+1);
    stroke(0);
    strokeWeight(2);
    triangle(posX-size/2, posY+(size*1), posX+size/2, posY+(size*1), posX, posY-(size*0.95));
    circle(posX, posY-(size*0.5), size);
  }
  
  void flytTil(Felt nytFelt){
    if(nytFelt == null){
      println("Flyt Hjem");
      return;
    }
    erHjemme = false;
    felt = nytFelt;
    posX = felt.centerX();
    posY = felt.centerY();
    felt.brikker.add(this);
  }
  
  boolean musErPå(){
    return false;
  }
}
