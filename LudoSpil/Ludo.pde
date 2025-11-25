class Ludo{
  Felt[] felter;
 
  Spiller[] spillere;
 
  Terning terning;

  int tur;
  
  
  int feltSize;
  
  Ludo(){
    feltSize = width / 11;
    skabFelter();
    
    skabSpillere();
    
    terning = new Terning(6);
    
    tur = 0;
  }
  
  void display(){
    for(int i = 0; i < felter.length; i++){
      felter[i].display();
    }
    
    for(int i = 0; i < spillere.length; i++){
      spillere[i].display();
    }
    

    int terningW = feltSize;
    if(tur == 0){
      terning.display(spillere[0].hjem.posX + spillere[0].hjem.size - terningW, spillere[0].hjem.posY, terningW, -TWO_PI/8);
    }
    if(tur == 1){
      terning.display(spillere[1].hjem.posX + spillere[1].hjem.size - terningW, spillere[1].hjem.posY + spillere[1].hjem.size - terningW, terningW, TWO_PI/8);
    }
    if(tur == 2){
      terning.display(spillere[2].hjem.posX, spillere[2].hjem.posY + spillere[2].hjem.size - terningW, terningW, -TWO_PI/8);
    }
    if(tur == 3){
      terning.display(spillere[3].hjem.posX, spillere[3].hjem.posY, terningW, TWO_PI/8);
    }
  }
  
  void checkForInput(){
    if(terning.erBlank()){
      if(keyReleased){
        terning.kast();
      }
    } else{
      ArrayList<Flyt> muligeFlyts = spillere[tur].findMuligeFlyts(terning.findSide(), this);
      if(muligeFlyts.size() == 0){
        nextPlayerTurn();
      }
      for(int i = 0; i < muligeFlyts.size(); i++){
        Flyt flyt = muligeFlyts.get(i);
        fill(255, 255, 255, 255);
        circle(flyt.brikX, flyt.brikY, flyt.brikRadius);
        circle(flyt.tilFelt.centerX(), flyt.tilFelt.centerY(), flyt.brikRadius);
        if(mouseReleased){
          if(flyt.erMusIndenfor(mouseX, mouseY)){
            flyt.flytBrik();
            nextPlayerTurn();
            break;
          }
        }
      }
    }
  }
  
  void nextPlayerTurn(){
    tur++;
    if(tur >= spillere.length) { tur = 0; }
    terning.reset();
  }
  
  Felt tælFrem(Felt startFelt, int antalFelter, int farve){
    int næsteFelt = startFelt.index;
    boolean skalVæreUdenfor = næsteFelt <= 9+(3*10);
    
    for(int i = 0; i < antalFelter; i++){
      if(næsteFelt == 8+(farve*10)){
        næsteFelt = 40+(farve*4)+0;
        println("Kan flyttes ind på holdets linje");
        continue;
      }
      
      næsteFelt = næsteFelt + 1;
      if(næsteFelt > 9+(3*10) && skalVæreUdenfor){
        næsteFelt = 0; // Den er i ringen og skal fortsat være det, gå til starten af ringen.
        println("Kan flyttes til start af ring");
      } else if (næsteFelt == 40+(farve*4)+3){
        næsteFelt = felter.length-1; // Den er nået til slutfeltet.
        println("Kan flyttes til slut");
      }
    }
    return felter[næsteFelt];
  }
  
  Felt findStartFelt(int farve){
    return felter[farve*10];
  }

  Felt findNæsteStjerne(Felt fraFelt){
     return null; 
  }
  
  Felt findNæsteGlobus(Felt fraFelt){
      return null;
  }
  
  
  void skabSpillere(){
    spillere = new Spiller[4];
    spillere[0] = new Spiller(0, new Hjem(0, 7*feltSize, feltSize*4, 0));
    spillere[1] = new Spiller(1, new Hjem(0, 0, feltSize*4, 1));
    spillere[2] = new Spiller(2, new Hjem(7*feltSize, 0, feltSize*4, 2));
    spillere[3] = new Spiller(3, new Hjem(7*feltSize, 7*feltSize, feltSize*4, 3));
  }
  
  void skabFelter(){
    felter = new Felt[57];
    felter[0+(0*10)] = new Globusfelt(feltSize*4, feltSize*9, feltSize, 0)   .sætIndex(0+(0*10));
    felter[1+(0*10)] = new Felt(feltSize*4, feltSize*8, feltSize, -1)        .sætIndex(1+(0*10));
    felter[2+(0*10)] = new Felt(feltSize*4, feltSize*7, feltSize, -1)        .sætIndex(2+(0*10));
    felter[3+(0*10)] = new Stjernefelt(feltSize*4, feltSize*6, feltSize, -1) .sætIndex(3+(0*10));
    felter[4+(0*10)] = new Felt(feltSize*3, feltSize*6, feltSize, -1)        .sætIndex(4+(0*10));
    felter[5+(0*10)] = new Globusfelt(feltSize*2, feltSize*6, feltSize, -1)  .sætIndex(5+(0*10));
    felter[6+(0*10)] = new Felt(feltSize*1, feltSize*6, feltSize, -1)        .sætIndex(6+(0*10));
    felter[7+(0*10)] = new Felt(feltSize*0, feltSize*6, feltSize, -1)        .sætIndex(7+(0*10));
    felter[8+(0*10)] = new Stjernefelt(feltSize*0, feltSize*5, feltSize, -1) .sætIndex(8+(0*10));
    felter[9+(0*10)] = new Felt(feltSize*0, feltSize*4, feltSize, -1)        .sætIndex(9+(0*10));
    
    felter[0+(1*10)] = new Globusfelt(feltSize*1, feltSize*4, feltSize, 1)   .sætIndex(0+(1*10));
    felter[1+(1*10)] = new Felt(feltSize*2, feltSize*4, feltSize, -1)        .sætIndex(1+(1*10));
    felter[2+(1*10)] = new Felt(feltSize*3, feltSize*4, feltSize, -1)        .sætIndex(2+(1*10));
    felter[3+(1*10)] = new Stjernefelt(feltSize*4, feltSize*4, feltSize, -1) .sætIndex(3+(1*10));
    felter[4+(1*10)] = new Felt(feltSize*4, feltSize*3, feltSize, -1)        .sætIndex(4+(1*10));
    felter[5+(1*10)] = new Globusfelt(feltSize*4, feltSize*2, feltSize, -1)  .sætIndex(5+(1*10));
    felter[6+(1*10)] = new Felt(feltSize*4, feltSize*1, feltSize, -1)        .sætIndex(6+(1*10));
    felter[7+(1*10)] = new Felt(feltSize*4, feltSize*0, feltSize, -1)        .sætIndex(7+(1*10));
    felter[8+(1*10)] = new Stjernefelt(feltSize*5, feltSize*0, feltSize, -1) .sætIndex(8+(1*10));
    felter[9+(1*10)] = new Felt(feltSize*6, feltSize*0, feltSize, -1)        .sætIndex(9+(1*10));
    
    felter[0+(2*10)] = new Globusfelt(feltSize*6, feltSize*1, feltSize, 2)   .sætIndex(0+(2*10));
    felter[1+(2*10)] = new Felt(feltSize*6, feltSize*2, feltSize, -1)        .sætIndex(1+(2*10));
    felter[2+(2*10)] = new Felt(feltSize*6, feltSize*3, feltSize, -1)        .sætIndex(2+(2*10));
    felter[3+(2*10)] = new Stjernefelt(feltSize*6, feltSize*4, feltSize, -1) .sætIndex(3+(2*10));
    felter[4+(2*10)] = new Felt(feltSize*7, feltSize*4, feltSize, -1)        .sætIndex(4+(2*10));
    felter[5+(2*10)] = new Globusfelt(feltSize*8, feltSize*4, feltSize, -1)  .sætIndex(5+(2*10));
    felter[6+(2*10)] = new Felt(feltSize*9, feltSize*4, feltSize, -1)        .sætIndex(6+(2*10));
    felter[7+(2*10)] = new Felt(feltSize*10, feltSize*4, feltSize, -1)       .sætIndex(7+(2*10));
    felter[8+(2*10)] = new Stjernefelt(feltSize*10, feltSize*5, feltSize, -1).sætIndex(8+(2*10));
    felter[9+(2*10)] = new Felt(feltSize*10, feltSize*6, feltSize, -1)       .sætIndex(9+(2*10));
    
    felter[0+(3*10)] = new Globusfelt(feltSize*9, feltSize*6, feltSize, 3)   .sætIndex(0+(3*10));
    felter[1+(3*10)] = new Felt(feltSize*8, feltSize*6, feltSize, -1)        .sætIndex(1+(3*10));
    felter[2+(3*10)] = new Felt(feltSize*7, feltSize*6, feltSize, -1)        .sætIndex(2+(3*10));
    felter[3+(3*10)] = new Stjernefelt(feltSize*6, feltSize*6, feltSize, -1) .sætIndex(3+(3*10));
    felter[4+(3*10)] = new Felt(feltSize*6, feltSize*7, feltSize, -1)        .sætIndex(4+(3*10));
    felter[5+(3*10)] = new Globusfelt(feltSize*6, feltSize*8, feltSize, -1)  .sætIndex(5+(3*10));
    felter[6+(3*10)] = new Felt(feltSize*6, feltSize*9, feltSize, -1)        .sætIndex(6+(3*10));
    felter[7+(3*10)] = new Felt(feltSize*6, feltSize*10, feltSize, -1)       .sætIndex(7+(3*10));
    felter[8+(3*10)] = new Stjernefelt(feltSize*5, feltSize*10, feltSize, -1).sætIndex(8+(3*10));
    felter[9+(3*10)] = new Felt(feltSize*4, feltSize*10, feltSize, -1)       .sætIndex(9+(3*10));
    
    felter[40+(0*4)+0] = new Felt(feltSize*5, feltSize*9, feltSize, 0).sætIndex(40+(0*4)+0);
    felter[40+(0*4)+1] = new Felt(feltSize*5, feltSize*8, feltSize, 0).sætIndex(40+(0*4)+1);
    felter[40+(0*4)+2] = new Felt(feltSize*5, feltSize*7, feltSize, 0).sætIndex(40+(0*4)+2);
    felter[40+(0*4)+3] = new Felt(feltSize*5, feltSize*6, feltSize, 0).sætIndex(40+(0*4)+3);
    
    felter[40+(1*4)+0] = new Felt(feltSize*1, feltSize*5, feltSize, 1).sætIndex(40+(1*4)+0);
    felter[40+(1*4)+1] = new Felt(feltSize*2, feltSize*5, feltSize, 1).sætIndex(40+(1*4)+1);
    felter[40+(1*4)+2] = new Felt(feltSize*3, feltSize*5, feltSize, 1).sætIndex(40+(1*4)+2);
    felter[40+(1*4)+3] = new Felt(feltSize*4, feltSize*5, feltSize, 1).sætIndex(40+(1*4)+3);
    
    felter[40+(2*4)+0] = new Felt(feltSize*5, feltSize*1, feltSize, 2).sætIndex(40+(2*4)+0);
    felter[40+(2*4)+1] = new Felt(feltSize*5, feltSize*2, feltSize, 2).sætIndex(40+(2*4)+1);
    felter[40+(2*4)+2] = new Felt(feltSize*5, feltSize*3, feltSize, 2).sætIndex(40+(2*4)+2);
    felter[40+(2*4)+3] = new Felt(feltSize*5, feltSize*4, feltSize, 2).sætIndex(40+(2*4)+3);
    
    felter[40+(3*4)+0] = new Felt(feltSize*9, feltSize*5, feltSize, 3).sætIndex(40+(3*4)+0);
    felter[40+(3*4)+1] = new Felt(feltSize*8, feltSize*5, feltSize, 3).sætIndex(40+(3*4)+1);
    felter[40+(3*4)+2] = new Felt(feltSize*7, feltSize*5, feltSize, 3).sætIndex(40+(3*4)+2);
    felter[40+(3*4)+3] = new Felt(feltSize*6, feltSize*5, feltSize, 3).sætIndex(40+(3*4)+3);
    
    felter[felter.length-1] = new Slutfelt(feltSize*5, feltSize*5, feltSize, -1).sætIndex(felter.length-1);
  }
}
