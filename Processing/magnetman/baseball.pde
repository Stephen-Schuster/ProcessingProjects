class baseball extends Item {
  baseball(float x, float y) {
    super(x,y,0,"baseball",35,35, 11.0/16, -7.5/16, baseball);
  }
  void update() {
    super.update();
    if(hasItem) {
      if(super.x>magmanX && super.x<magmanX+magmanH && super.y<magmanY && super.y>magmanY-magmanH && facing == 0 && heldItem.name.equals("bat") && useCooldown>45) {
        vx = 20;
        vy = -6;
        vr = PI/5;
      } else if(super.x<magmanX && super.x>magmanX-magmanH && super.y<magmanY && super.y>magmanY-magmanH && facing != 0 && heldItem.name.equals("bat") && useCooldown>45) {
        vx = -20;
        vy = -6;
        vr = PI/5;
      }
    }
    if(super.magTime > 0 && magmanX>width*26/30.0 && 19/60.0*height<magmanY && magmanY<2/3.0*height) magTime = 0;
    if(x>width*26/30.0 && 19/60.0*height<y && y<2/3.0*height) {
      x = width*49/60;
      vx = -abs(0.5*vx);
      x+=vx;
      bossHP-=5;
    }
  }
}
