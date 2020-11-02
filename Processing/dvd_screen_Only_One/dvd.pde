class dvd {
  float x,y, vx, vy;
  color clr;
  int place; 
  dvd(float x, float y, boolean down, boolean right, int place) {
    this.x = x;
    this.y = y;
    this.place = place;
    vx = -2;
    vy = -1.5;
    if(down) {
      vy*=-1;
    }
    if(right) {
      vx*=-1;
    }
    clr = color(hue(clr)+30+random(195),255,200);
  }
  void update() {
    x+=vx;
    y+=vy;
    boolean bounceX = false;
    if(width-radx/2.0<x) {
      x = width-radx/2.0;
      clr = color(random(255),255,200);
      vx = -vx;
      bounceX = true;
    }
    if(radx/2.0>x) {
      x = radx/2.0;
      clr = color(random(255),255,200);
      vx = -vx;
      bounceX = true;
    }
    if(height-rady/2.0<y) {
      y = height-rady/2.0;
      clr = color(random(255),255,200);
      vy = -vy;
    }
    if(y<rady/2.0){
      y = rady/2.0;
      clr = color(random(255),255,200);
      vy = -vy;
    }
  }
  void show() {
    loadPixels();
    for(int i = -radx/2; i<radx/2+1; i++) {
      for(int j = -rady/2; j<rady/2+1; j++) {
        if(good[i+radx/2][j+rady/2]) {
          pixels[(int)((int)(y+j)*width+(x+i))] = clr;
        }
      }
    }
    updatePixels();
  }
}
