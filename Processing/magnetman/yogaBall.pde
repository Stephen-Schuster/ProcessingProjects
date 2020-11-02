class yogaBall extends Item {
  int noBounce;
  color tint;
  int boing;
  yogaBall(float x, float y) {
    super(x,y,0,"yogaBall",60,60, 14.0/16, -7.5/16, yogaBall);
    noBounce = 0;
    int r = (int)random(3);
    if(r == 0) tint = color(255,0,0);
    if(r == 1) tint = color(0,255,0);
    if(r == 2) tint = color(0,0,255);
  }
  void use() {
    if(magmanY == height) {
      drop();
      magmanvy = -8;
      super.x = magmanX;
    }
  }
  void update() {
   super.update();
   if(magTime>0) noBounce = 60;
   if(noBounce>0) noBounce--;
   if(noBounce == 0 && !(super.x-super.W/2>magmanX+magmanH/2.0 || super.x+super.W/2<magmanX-magmanH/2.0) && !(super.y-super.H/2>magmanY || super.y+super.H/2<magmanY-magmanH)) {
     magmanvy = -8;
     boing = 20;
   }
   if(boing>0) boing--;
  }
  void drop() {
    super.drop();
    noBounce = 60;
  }
  void show() {
    tint(tint);
    pushMatrix();
    translate(x,y);
    rotate(rot);
    if(boing == 0) image(img,0,0,W,H);
    else {rotate(-rot); image(img,0,H/4,W,H/2); }
    popMatrix();
    tint(255);
  }
  void showHeld() {
    tint(tint);
    super.showHeld();
    tint(255);
  }
}
