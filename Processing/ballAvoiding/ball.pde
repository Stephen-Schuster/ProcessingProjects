class ball {
  float x, y, vx=0, vy=0, ax, ay;
  float rad = width/50;
  ball(float x, float y, float ax, float ay) {
    this.x = x;
    this.y = y;
    this.ax = ax;
    this.ay = ay;
  }
  void move() {
    vx+=ax;
    vy+=ay;
    x+=vx;
    y+=vy;
    if(x<0){ x = width-1; vx = 0; y = random(height);}
    if(x>width){ x = 1; vx = 0; y = random(height);}
    if(y<0) {y = height-1; vy = 0; x = random(width);}
    if(y>height){ y = 1; vy = 0; x = random(width);}
  }
  void show() {
    noStroke();
    fill(0);
    ellipse(x,y,rad*2,rad*2);
  }
}
