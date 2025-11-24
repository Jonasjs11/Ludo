class Spiller{
  Brik[] brikker;

  Hjem hjem;

  Spiller(int farve, Hjem hjem){
    brikker = new Brik[4];
    for(int i = 0; i < brikker.length; i++){
      brikker[i] = new Brik(farve);
    }
    this.hjem = hjem;
  }


  void display(){
    //hjem.display();
  }

  void vælgBrik(){
    
  }
}
