class recursiveCircle {
  recursiveCircle rc;
  boolean isCircle;
  float x,y,r,t;
  recursiveCircle(float x, float y, float r, float t, int counter) {
    if(counter>0) rc = new recursiveCircle(x+r*cos(t),y+r*sin(t),r*(random(1)/2+0.5),t+(random(2)*PI/6),counter-1);
    isCircle = counter>0;
    this.x = x;
    this.y = y;
    this.r = r;
    this.t = t;
  }
  void move() {
    if(isCircle) {
      rc.move();
      t+=PI/120*(height/4)/r;
      rc.x = x+r*cos(t);
      rc.y = y+r*sin(t);
    } else {
      xs.add(x);
      ys.add(y);
    }
  }
  float getLineX() {
    if(isCircle) {
      return rc.getLineX();
    } else {
      return x;
    }
  }
  void xZero() {
    if(isCircle) {
      rc.x = x+r*cos(t);
      rc.y = y+r*sin(t);
      rc.xZero();
    }
  }
  void show() {
    if(isCircle) {
      float sx = x-scroll;
      if(scrollable) {
        rc.show();
        fill(0,0,0,0);
        stroke(0,255,0);
        strokeWeight(5);
        ellipse(sx,y,2*r,2*r);
        stroke(255,0,0);
        strokeWeight(2);
        line(sx,y,sx+r*cos(t),y+r*sin(t));
      } else {
        rc.show();
        fill(0,0,0,0);
        stroke(0,255,0);
        strokeWeight(5);
        ellipse(x,y,2*r,2*r);
        stroke(255,0,0);
        strokeWeight(2);
        line(x,y,x+r*cos(t),y+r*sin(t));
      }
    } else {
      stroke(255);
      strokeWeight(height/40);
      if(xs.size()>0) line(0,ys.get(0),xs.get(0)-scroll,ys.get(0));
      for(int i = 1; i<xs.size(); i++) {
        line(xs.get(i)-scroll,ys.get(i),xs.get(i-1)-scroll,ys.get(i-1));
      }
    }
  }
  float bestX() {
    if(isCircle) {
      return max(x,rc.bestX());
    } else {
      return x;
    }
  }
}
