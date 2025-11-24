class Felt{
  int posX, posY;
  int size;
  int farve;
  ArrayList<Spiller> spillere;
  Felt defaultNæste, sammeFarveNæste;
  
  
  Felt(int posX, int posY, int size, int farve){
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.farve = farve;
  }
  
  
  void display(){
    noStroke();
    fill(150);
    rect(posX, posY, size, size);
    switch(farve){
      case -1:
        fill(230);
        break;
      case 0:
        fill(255, 255, 0);
        break;
      case 1:
        fill(0, 255, 0);
        break;
      case 2:
        fill(0, 0, 255);
        break;
      case 3:
        fill(255, 0, 0);
        break;
    }
    rect(posX+(size/30), posY+(size/30), 28*size/30, 28*size/30);
  }
  
  void landSpiller(Spiller spiller){
    
  }
  
  void fjernSpiller(Spiller spiller){
    
  }
  
  Felt findNæsteFelt(Spiller spiller){
    return null;
  }
}
