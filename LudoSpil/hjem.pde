class Hjem {
  color farve;
  int posX;
  int posY;
  int size;

  Hjem(int posX, int posY, int size, int farve){
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.farve = farve;
  }
  
  void display(){
    noStroke();
    fill(40);
    rect(posX, posY, size, size);
    fillSpillerFarve(farve+1);
    circle(posX + size/2, posY + size/2, size*0.85);
    fill(255);
    float coffset = size/6;
    float csize = size/3.6;
    circle(posX + size/2-coffset, posY + size/2-coffset, csize);
    circle(posX + size/2+coffset, posY + size/2-coffset, csize);
    circle(posX + size/2-coffset, posY + size/2+coffset, csize);
    circle(posX + size/2+coffset, posY + size/2+coffset, csize);
  }
}
