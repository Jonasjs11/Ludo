class Globusfelt extends Felt{
  Globusfelt(int posX, int posY, int size, int farve){
    super(posX, posY, size, farve);
  }
  
  
  void display(){
    super.display();
    
    globe(posX + size/2, posY + size/2, size * 0.75);
  }
  
  void landSpiller(Spiller spiller){
    
  }
  
  void fjernSpiller(Spiller spiller){
    
  }
}
