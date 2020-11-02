class bat extends Item {
  boolean swinging;
  int swingCounter;
  bat(float x, float y) {
    super(x,y,0,"bat",48,48, .5+9/80.0, -51/80.0, bat);
    super.pivoty = 0.25;
    swingCounter = 0;
    swinging = false;
  }
  void use() {
    useCooldown = 60;
    if(!swinging)  {
      swingCounter = 22;
      swinging = true;
    }
  }
  void update() {
    super.update();
    if(super.magTime > 0 && magmanX>width*26/30.0 && 19/60.0*height<magmanY && magmanY<2/3.0*height) magTime = 0;
    if(x>width*26/30.0 && 19/60.0*height<y && y<2/3.0*height) {
      x = width*49/60;
      vx = -abs(0.5*vx);
      x+=vx;
      bossHP-=20;
    }
  }
  void magUpdate() {
    x = magmanX;
    y = magmanY;
    if(swinging) {
      if(facing == 0) {
        if(swingCounter>7) {
          rot+=PI/15;
        } else {
          rot-=PI/7;
          if(rot<0) {
            swinging = false;
            swingCounter = 0;
          }
        }
        swingCounter--;
      } else {
        if(swingCounter>7) {
          rot-=PI/15;
        } else {
          rot+=PI/7;
          if(rot>0) {
            swinging = false;
            swingCounter = 0;
          }
        }
        swingCounter--;
      }
    } else {
      rot = 0;
    }
  }
}
