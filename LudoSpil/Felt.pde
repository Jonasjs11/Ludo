class Felt{
  int index;
  int posX, posY;
  int size;
  int farve;
  ArrayList<Brik> brikker;
  
  Felt(int posX, int posY, int size, int farve){
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.farve = farve;
    brikker = new ArrayList<Brik>();
  }
  Felt sætIndex(int i){
    index = i;
    return this;
  }
  
  void display(){
    noStroke();
    fill(150);
    rect(posX, posY, size, size);
    fill(230);
    fillSpillerFarve(farve+1);
    rect(posX+(size/30), posY+(size/30), 28*size/30, 28*size/30);
    
    fill(0);
    textAlign(LEFT, TOP);
    textSize(10);
    text(index, posX, posY);
  }
  
  int centerX(){
    return posX + size/2;
  }
  int centerY(){
    return posY + size/2;
  }
  
  void landBrik(Brik brik){
    if (brikker.size()>0){
      if (brikker.get(0).farve == brik.farve){
        brikker.add(brik);
      }else{
        for (int i=0; i < brikker.size();i++){
          brikker.get(i).sendHjem();
        }
        brikker.clear();
        brikker.add(brik);
      }
    } else{
      brikker.add(brik);
    }
  }
  
  void fjernBrik(Brik brik){
    brikker.remove(brik);
  }
}
