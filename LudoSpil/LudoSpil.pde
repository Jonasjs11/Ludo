Ludo ludo;

void setup(){
  size(990, 990);
  
  ludo = new Ludo();
}

void draw(){
  background(50);
  
  ludo.display();
}

void star(float centerX, float centerY, float starRadius){
  PShape s = createShape();
  s.beginShape();
  s.noFill();
  s.stroke(0);
  s.strokeWeight(2);
  int kanter = 5;
  float offset = TWO_PI/2;
  float halfAngle = TWO_PI/kanter/2;
  float outsideRadius = starRadius;
  float insideRadius = starRadius*0.5;
  for(int i = 0; i <= kanter; i++){
    float fullAngle = TWO_PI/kanter * i;
    s.vertex(sin(fullAngle + offset) * outsideRadius, cos(fullAngle + offset) * outsideRadius);
    s.vertex(sin(fullAngle + halfAngle + offset) * insideRadius, cos(fullAngle + halfAngle + offset) * insideRadius);
  }
  s.endShape();
    
  shape(s, centerX, centerY);
}

void globe(float posX, float posY, float globeDiameter){
  float arcDiameter = sqrt((globeDiameter/2)*(globeDiameter/2) + (globeDiameter/4)*(globeDiameter/4))*2;
  float arcXHalfAngle = atan((globeDiameter/2)/(globeDiameter/4));
  float arcYHalfAngle = radians(37.5609693698);
  
  noFill();
  stroke(0);
  strokeWeight(2);
  circle(posX, posY, globeDiameter);
  line(posX - globeDiameter/2, posY, posX + globeDiameter/2, posY);
  line(posX, posY - globeDiameter/2, posX, posY + globeDiameter/2);
  arc(posX + globeDiameter/4, posY, arcDiameter, arcDiameter, TWO_PI/2-arcXHalfAngle, TWO_PI/2+arcXHalfAngle);
  arc(posX - globeDiameter/4, posY, arcDiameter, arcDiameter, 0-arcXHalfAngle, 0+arcXHalfAngle);
  arc(posX, posY - globeDiameter/4 - globeDiameter/2, arcDiameter, arcDiameter, TWO_PI/4-arcYHalfAngle, TWO_PI/4+arcYHalfAngle);
  arc(posX, posY + globeDiameter/4 + globeDiameter/2, arcDiameter, arcDiameter, 3*TWO_PI/4-arcYHalfAngle, 3*TWO_PI/4+arcYHalfAngle);
}
