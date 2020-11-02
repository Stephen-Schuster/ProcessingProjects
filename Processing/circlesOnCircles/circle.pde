class circle {
  float x, y, t, r, vx;
  recursiveCircle rc;
  circle() {
    x = 0;
    y = 5*height/8;
    r = height/8;
    t = PI/2;
    vx = r*PI/120;
    rc = new recursiveCircle(x+r*cos(t),y+r*sin(t),r*(random(1)/2+0.5),t+(random(2)*PI/6),numOfCircles-1);
  }
  void move() {
    if(x-scroll<width) catchingUp = true;
    x+=vx;
    t+=PI/120;
    rc.move();
    rc.x = x+r*cos(t);
    rc.y = y+r*sin(t);
    if(x-scroll>width) {
      if(!scrollable) {
        xs.clear(); 
        ys.clear(); 
        x = x-rc.getLineX(); 
        rc.x = x+r*cos(t);
        rc.y = y+r*sin(t);
        rc.xZero();
      } else {
        if(keyCode != LEFT && catchingUp && keyCode != RIGHT) scroll = (int)rc.getLineX();
      };    }
  }
  void show() {
    float sx = x-scroll;
    if(scrollable) {
      fill(0,0,0,0);
      stroke(0,255,0);
      strokeWeight(5);
      ellipse(sx,y,2*r,2*r);
      stroke(255,0,0);
      strokeWeight(2);
      line(sx,y,sx+r*cos(t),y+r*sin(t));
      rc.show();
    } else {
      fill(0,0,0,0);
      stroke(0,255,0);
      strokeWeight(5);
      ellipse(x,y,2*r,2*r);
      stroke(255,0,0);
      strokeWeight(2);
      line(x,y,x+r*cos(t),y+r*sin(t));
      rc.show();
    }
  }
  float bestX() {
    return max(x,rc.bestX());
  }
}
