class Ludo{
  Felt[] felter;
 
  Spiller[] spillere;
 
  Terning terning;

  Spiller tur;
  
  
  Ludo(){
    felter = new Felt[57];
    int feltSize = width / 11;
    felter[0+(0*10)] = new Globusfelt(feltSize*4, feltSize*9, feltSize, 0);
    felter[1+(0*10)] = new Felt(feltSize*4, feltSize*8, feltSize, -1);
    felter[2+(0*10)] = new Felt(feltSize*4, feltSize*7, feltSize, -1);
    felter[3+(0*10)] = new Stjernefelt(feltSize*4, feltSize*6, feltSize, -1);
    felter[4+(0*10)] = new Felt(feltSize*3, feltSize*6, feltSize, -1);
    felter[5+(0*10)] = new Globusfelt(feltSize*2, feltSize*6, feltSize, -1);
    felter[6+(0*10)] = new Felt(feltSize*1, feltSize*6, feltSize, -1);
    felter[7+(0*10)] = new Felt(feltSize*0, feltSize*6, feltSize, -1);
    felter[8+(0*10)] = new Stjernefelt(feltSize*0, feltSize*5, feltSize, -1);
    felter[9+(0*10)] = new Felt(feltSize*0, feltSize*4, feltSize, -1);
    
    felter[0+(1*10)] = new Globusfelt(feltSize*1, feltSize*4, feltSize, 1);
    felter[1+(1*10)] = new Felt(feltSize*2, feltSize*4, feltSize, -1);
    felter[2+(1*10)] = new Felt(feltSize*3, feltSize*4, feltSize, -1);
    felter[3+(1*10)] = new Stjernefelt(feltSize*4, feltSize*4, feltSize, -1);
    felter[4+(1*10)] = new Felt(feltSize*4, feltSize*3, feltSize, -1);
    felter[5+(1*10)] = new Globusfelt(feltSize*4, feltSize*2, feltSize, -1);
    felter[6+(1*10)] = new Felt(feltSize*4, feltSize*1, feltSize, -1);
    felter[7+(1*10)] = new Felt(feltSize*4, feltSize*0, feltSize, -1);
    felter[8+(1*10)] = new Stjernefelt(feltSize*5, feltSize*0, feltSize, -1);
    felter[9+(1*10)] = new Felt(feltSize*6, feltSize*0, feltSize, -1);
    
    felter[0+(2*10)] = new Globusfelt(feltSize*6, feltSize*1, feltSize, 2);
    felter[1+(2*10)] = new Felt(feltSize*6, feltSize*2, feltSize, -1);
    felter[2+(2*10)] = new Felt(feltSize*6, feltSize*3, feltSize, -1);
    felter[3+(2*10)] = new Stjernefelt(feltSize*6, feltSize*4, feltSize, -1);
    felter[4+(2*10)] = new Felt(feltSize*7, feltSize*4, feltSize, -1);
    felter[5+(2*10)] = new Globusfelt(feltSize*8, feltSize*4, feltSize, -1);
    felter[6+(2*10)] = new Felt(feltSize*9, feltSize*4, feltSize, -1);
    felter[7+(2*10)] = new Felt(feltSize*10, feltSize*4, feltSize, -1);
    felter[8+(2*10)] = new Stjernefelt(feltSize*10, feltSize*5, feltSize, -1);
    felter[9+(2*10)] = new Felt(feltSize*10, feltSize*6, feltSize, -1);
    
    felter[0+(3*10)] = new Globusfelt(feltSize*9, feltSize*6, feltSize, 3);
    felter[1+(3*10)] = new Felt(feltSize*8, feltSize*6, feltSize, -1);
    felter[2+(3*10)] = new Felt(feltSize*7, feltSize*6, feltSize, -1);
    felter[3+(3*10)] = new Stjernefelt(feltSize*6, feltSize*6, feltSize, -1);
    felter[4+(3*10)] = new Felt(feltSize*6, feltSize*7, feltSize, -1);
    felter[5+(3*10)] = new Globusfelt(feltSize*6, feltSize*8, feltSize, -1);
    felter[6+(3*10)] = new Felt(feltSize*6, feltSize*9, feltSize, -1);
    felter[7+(3*10)] = new Felt(feltSize*6, feltSize*10, feltSize, -1);
    felter[8+(3*10)] = new Stjernefelt(feltSize*5, feltSize*10, feltSize, -1);
    felter[9+(3*10)] = new Felt(feltSize*4, feltSize*10, feltSize, -1);
    
    felter[40+(0*4)+0] = new Felt(feltSize*5, feltSize*9, feltSize, 0);
    felter[40+(0*4)+1] = new Felt(feltSize*5, feltSize*8, feltSize, 0);
    felter[40+(0*4)+2] = new Felt(feltSize*5, feltSize*7, feltSize, 0);
    felter[40+(0*4)+3] = new Felt(feltSize*5, feltSize*6, feltSize, 0);
    
    felter[40+(1*4)+0] = new Felt(feltSize*1, feltSize*5, feltSize, 1);
    felter[40+(1*4)+1] = new Felt(feltSize*2, feltSize*5, feltSize, 1);
    felter[40+(1*4)+2] = new Felt(feltSize*3, feltSize*5, feltSize, 1);
    felter[40+(1*4)+3] = new Felt(feltSize*4, feltSize*5, feltSize, 1);
    
    felter[40+(2*4)+0] = new Felt(feltSize*5, feltSize*1, feltSize, 2);
    felter[40+(2*4)+1] = new Felt(feltSize*5, feltSize*2, feltSize, 2);
    felter[40+(2*4)+2] = new Felt(feltSize*5, feltSize*3, feltSize, 2);
    felter[40+(2*4)+3] = new Felt(feltSize*5, feltSize*4, feltSize, 2);
    
    felter[40+(3*4)+0] = new Felt(feltSize*9, feltSize*5, feltSize, 3);
    felter[40+(3*4)+1] = new Felt(feltSize*8, feltSize*5, feltSize, 3);
    felter[40+(3*4)+2] = new Felt(feltSize*7, feltSize*5, feltSize, 3);
    felter[40+(3*4)+3] = new Felt(feltSize*6, feltSize*5, feltSize, 3);
    
    felter[felter.length-1] = new Slutfelt(feltSize*5, feltSize*5, feltSize, -1);
    
    spillere = new Spiller[4];
    spillere[0] = new Spiller(1, new Hjem(0, 0, feltSize*4, 1));
    spillere[1] = new Spiller(2, new Hjem(0, 7*feltSize, feltSize*4, 2));
    spillere[2] = new Spiller(3, new Hjem(7*feltSize, 0, feltSize*4, 3));
    spillere[3] = new Spiller(4, new Hjem(7*feltSize, 7*feltSize, feltSize*4, 4));
    
    terning = new Terning(6);
    
    tur = spillere[0];
  }
  
  
  void display(){
    for(int i = 0; i < felter.length; i++){
      felter[i].display();
    }
    
    for(int i = 0; i < spillere.length; i++){
      spillere[i].display();
    }
  }
  
  
  int findStartFelt(int brik){
    return 0;
  }

  int findNæsteStjerne(int brik){
     return 0; 
  }
  
  int findNæsteGlobus(int brik){
      return 0;
  }

}
