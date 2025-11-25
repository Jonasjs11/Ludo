class Terning{
  int side;
  int antalSider;
  
  
  Terning(int antalSider){
    this.antalSider = antalSider;
    side = -1;
  }
  
  
  void display(int x, int y, int w, float rot){
    int dotDiameter = w/5;
    
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(x, y, w, w, w/5);
    
    noStroke();
    fill(0);
    
    switch(side){
      case -1:
        fill(0);
        noStroke();
        textAlign(CENTER, CENTER);
        textSize(w/3);
        pushMatrix();
        translate(x + w/2, y + w/2);
        rotate(rot);
        text("KAST", 0, 0);
        popMatrix();
        break;
      case 1:
        circle(x + w/2, y + w/2, dotDiameter);
        break;
      case 2:
        star(x + w/2, y + w/2, w*0.4);
        break;
      case 3:
        circle(x + 3*w/4, y + w/4, dotDiameter);
        circle(x + w/2, y + w/2, dotDiameter);
        circle(x + w/4, y + 3*w/4, dotDiameter);
        break;
      case 4:
        circle(x + w/3, y + w/3, dotDiameter);
        circle(x + 2*w/3, y + w/3, dotDiameter);
        circle(x + w/3, y + 2*w/3, dotDiameter);
        circle(x + 2*w/3, y + 2*w/3, dotDiameter);
        break;
      case 5:
        globe(x + w/2, y + w/2, w * 0.75);
        break;
      case 6:
        circle(x + 2*w/6, y + w/2 - dotDiameter * 1.5, dotDiameter);
        circle(x + 2*w/6, y + w/2, dotDiameter);
        circle(x + 2*w/6, y + w/2 + dotDiameter * 1.5, dotDiameter);
        circle(x + 4*w/6, y + w/2 - dotDiameter * 1.5, dotDiameter);
        circle(x + 4*w/6, y + w/2, dotDiameter);
        circle(x + 4*w/6, y + w/2 + dotDiameter * 1.5, dotDiameter);
        break;
    }
  }
  
  boolean erBlank(){
    return side == -1;
  }
  
  void reset(){
    side = -1;
  }
  
  void kast(){
    side = (int)random(1, antalSider+1);
  }
  
  int findSide(){
    return side;
  }

}
