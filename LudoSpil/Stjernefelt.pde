class Stjernefelt extends Felt{
  Stjernefelt(int posX, int posY, int size, int farve){
    super(posX, posY, size, farve);
  }
  
  
  void display(){
    fill(64 + farve*64, 0, 0);
    rect(posX, posY, size, size);
  }
  
  void landSpiller(Spiller spiller){
    
  }
  
  void fjernSpiller(Spiller spiller){
    
  }
}
