class Stjernefelt extends Felt{
  Stjernefelt(int posX, int posY, int size, int farve){
    super(posX, posY, size, farve);
  }
  
  
  void display(){
    super.display();

    star(posX + size/2, posY + size/2, size*0.4);
  }
}
