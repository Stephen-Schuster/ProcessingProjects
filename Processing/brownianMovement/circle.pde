class circle {
  color clr;
  private int x,y;
  boolean isSwitching;
  circle(color c, int x, int y) {
    clr = c;
    this.x = x;
    this.y = y;
    isSwitching = false;
  }
  void show() {
    fill(clr);
    rect(x*w,y*h,w,h);
  }
  void setX(int newx) {x = newx;}
  
  void setY(int newy) {y = newy;}
}
