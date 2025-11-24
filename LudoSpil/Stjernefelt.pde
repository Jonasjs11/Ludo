class Stjernefelt extends Felt{
  Stjernefelt(int posX, int posY, int size, int farve){
    super(posX, posY, size, farve);
  }
  
  
  void display(){
    super.display();
    
    PShape s = createShape();
    s.beginShape();
    s.fill(255);
    s.stroke(0);
    s.strokeWeight(2);
    int kanter = 5;
    for(int i = 0; i < kanter; i++){
      float offset = TWO_PI/2;
      float fullAngle = TWO_PI/kanter * i;
      float halfAngle = TWO_PI/kanter/2;
      float outsideRadius = size*0.4;
      float insideRadius = size*0.2;
      s.vertex(sin(fullAngle + offset) * outsideRadius, cos(fullAngle + offset) * outsideRadius);
      s.vertex(sin(fullAngle + halfAngle + offset) * insideRadius, cos(fullAngle + halfAngle + offset) * insideRadius);
    }
    s.endShape();
    
    shape(s, posX + size/2, posY + size/2);
  }
  
  void landSpiller(Spiller spiller){
    
  }
  
  void fjernSpiller(Spiller spiller){
    
  }
}
