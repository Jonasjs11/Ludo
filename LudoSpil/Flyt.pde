class Flyt{
  Brik brik;
  int brikX, brikY;
  int brikRadius;
  Felt tilFelt;
  
  Flyt(Brik brik, int brikX, int brikY, int brikRadius, Felt tilFelt){
    this.brik = brik;
    this.brikX = brikX;
    this.brikY = brikY;
    this.brikRadius = brikRadius;
    this.tilFelt = tilFelt;
  }
  
  boolean erMusIndenfor(int mX, int mY){
    return pow(brikX-mX, 2) + pow(brikY-mY, 2) < pow(brikRadius, 2);
  }
  
  void flytBrik(){
    brik.flytTil(tilFelt);
  }
}
