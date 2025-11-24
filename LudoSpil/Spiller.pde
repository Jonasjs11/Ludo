class Spiller{
  Brik[] brikker;

  Hjem hjem;

  Spiller(int farve, Hjem hjem){
    brikker = new Brik[4];
    for(int i = 0; i < brikker.length; i++){
      brikker[i] = new Brik(hjem.posX, hjem.posY, 50, farve);
    }
    this.hjem = hjem;
  }


  void display(){
    //hjem.display();
    for(int i = 0; i < brikker.length; i++){
      brikker[i].display();
    }
  }

  void vælgBrik(){
    
  }
}
