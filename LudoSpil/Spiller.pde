class Spiller{
  Brik[] brikker;

  Hjem hjem;
  
  int farve;

  Spiller(int farve, Hjem hjem){
    brikker = new Brik[4];
    int size = hjem.size;
    int posX = hjem.posX;
    int posY = hjem.posY;
    int coffset = hjem.size/6;
    brikker[0] = new Brik(posX + size/2-coffset, posY + size/2-coffset, size/10, farve);
    brikker[1] = new Brik(posX + size/2+coffset, posY + size/2-coffset, size/10, farve);
    brikker[2] = new Brik(posX + size/2-coffset, posY + size/2+coffset, size/10, farve);
    brikker[3] = new Brik(posX + size/2+coffset, posY + size/2+coffset, size/10, farve);
    this.farve = farve;
    this.hjem = hjem;
  }
  
  ArrayList<Flyt> findMuligeFlyts(int terningSide, Ludo ludo){
    ArrayList<Flyt> muligeFlyts = new ArrayList<Flyt>();
    
    for(int i = 0; i < brikker.length; i++){
      if(brikker[i].erHjemme){
        if(terningSide == 6){
          //Brikken kan flyttes ud fra hjem
          muligeFlyts.add(new Flyt(brikker[i], brikker[i].posX, brikker[i].posY, brikker[i].size, ludo.findStartFelt(farve)));
        }
        continue;
      }
      
      if(terningSide == 2){
        //Terningen er stjerne
        //muligeFlyts.add(new Flyt(brikker[i], brikker[i].posX, brikker[i].posY, brikker[i].size, ludo.findNæsteStjerne(brikker[i].felt)));
        continue;
      }
      if(terningSide == 5){
        //Terningen er globus
        //muligeFlyts.add(new Flyt(brikker[i], brikker[i].posX, brikker[i].posY, brikker[i].size, ludo.findNæsteGlobus(brikker[i].felt)));
        continue;
      }
      
      //Terningen er kun et tal
      muligeFlyts.add(new Flyt(brikker[i], brikker[i].posX, brikker[i].posY, brikker[i].size, ludo.tælFrem(brikker[i].felt, terningSide, farve)));
    }
    
    return muligeFlyts;
  }
  
  void display(){
    hjem.display();
    for(int i = 0; i < brikker.length; i++){
      brikker[i].display();
    }
  }

  void vælgBrik(){
    
  }
}
