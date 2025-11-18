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
    fill(64 + farve*64, 0, 0);
    rect(posX, posY, size, size);
  }
  
  void landSpiller(Spiller spiller){
    
  }
  
  void fjernSpiller(Spiller spiller){
    
  }
  
  Felt findNæsteFelt(Spiller spiller){
    return null;
  }
}
