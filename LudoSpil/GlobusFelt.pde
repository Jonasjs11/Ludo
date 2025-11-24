class Globusfelt extends Felt{
  Globusfelt(int posX, int posY, int size, int farve){
    super(posX, posY, size, farve);
  }
  
  
  void display(){
    super.display();
    
    float globusDiameter = size * 0.75;
    
    float arcDiameter = sqrt((globusDiameter/2)*(globusDiameter/2) + (globusDiameter/4)*(globusDiameter/4))*2;
    float arcXHalfAngle = atan((globusDiameter/2)/(globusDiameter/4));
    float arcYHalfAngle = radians(37.5609693698);
    
    noFill();
    stroke(0);
    strokeWeight(2);
    circle(posX + size/2, posY + size/2, globusDiameter);
    line(posX + size/2 - globusDiameter/2, posY + size/2, posX + size/2 + globusDiameter/2, posY + size/2);
    line(posX + size/2, posY + size/2 - globusDiameter/2, posX + size/2, posY + size/2 + globusDiameter/2);
    arc(posX + size/2 + globusDiameter/4, posY + size/2, arcDiameter, arcDiameter, TWO_PI/2-arcXHalfAngle, TWO_PI/2+arcXHalfAngle);
    arc(posX + size/2 - globusDiameter/4, posY + size/2, arcDiameter, arcDiameter, 0-arcXHalfAngle, 0+arcXHalfAngle);
    arc(posX + size/2, posY + size/2 - globusDiameter/4 - globusDiameter/2, arcDiameter, arcDiameter, TWO_PI/4-arcYHalfAngle, TWO_PI/4+arcYHalfAngle);
    arc(posX + size/2, posY + size/2 + globusDiameter/4 + globusDiameter/2, arcDiameter, arcDiameter, 3*TWO_PI/4-arcYHalfAngle, 3*TWO_PI/4+arcYHalfAngle);
  }
  
  void landSpiller(Spiller spiller){
    
  }
  
  void fjernSpiller(Spiller spiller){
    
  }
}
