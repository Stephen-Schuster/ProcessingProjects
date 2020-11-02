class Item {
  String name;
  float x;
  float vx;
  float vy;
  float vr;
  float y;
  float rot;
  float H;
  float W;
  PImage img;
  float offSetx;
  float offSety;
  float[][] thrownConditions;
  int magTime;
  float pivoty;
  float pivotx;
  Item(float x, float y, float rot, String name, float h, float w, float offx, float offy, float[][] tC) {
    this.x = x;
    this.y = y;
    this.rot = rot;
    this.img = loadImage(name+".png");
    vx = 0;
    vy = 0;
    vr = 0;
    H = h;
    W = w;
    offSetx = offx;
    offSety = offy;
    thrownConditions = tC;
    magTime = 0;
    pivoty = 0;
    pivotx = 0;
    this.name = name;
  }
  void show() {
    pushMatrix();
    translate(x,y);
    rotate(rot);
    image(img,0,0,W,H);
    popMatrix();
  }
  void showHeld() {
    pushMatrix();
    translate(x+magmanH*offSetx*(facing-2)/-2+pivotx*W,y+magmanH*offSety+pivoty*H);
    rotate(rot);
    image(img,-pivotx*W,-pivoty*H,W,H);
    popMatrix();
  }
  void update() {
    if(magTime == 0) {
      x+=vx;
      y+=vy;
      rot+=vr;
      if(x+W/2>width) { x = width-W/2; vx = 0; rot = 0; vr = 0; }
      if(y+H/2>height) {y = height-H/2; vy = 0; vx = 0; rot = 0; vr = 0;}
      else vy+=gravity;
      if(x-W/2<0) { x = W/2; vx = 0; rot = 0; vr = 0;}
    } else {
      if(magTime == 1) {
        heldItem = this;
        groundItems.remove(this);
        hasItem = true;
      } else {
        x-=(x-(magmanX+magmanH*offSetx*(facing-2)/-2))/magTime;
        y-=(y-(magmanY+magmanH*offSety))/magTime;
        rot-=rot/magTime;
      }
      magTime--;
    }
  }
  void magUpdate() {
    x = magmanX;
    y = magmanY;
    rot = 0;
  }
  
  void drop() {
        useCooldown = 0;
        groundItems.add(heldItem);
        hasItem = false;
        groundItems.get(groundItems.size()-1).x = magmanX+magmanH*offSetx*(facing-2)/-2+pivotx*W;
        groundItems.get(groundItems.size()-1).y = magmanY+magmanH*offSety+pivoty*H;
        if(left) {
          groundItems.get(groundItems.size()-1).vx = groundItems.get(groundItems.size()-1).thrownConditions[0][0];
          groundItems.get(groundItems.size()-1).vy = groundItems.get(groundItems.size()-1).thrownConditions[0][1];
          groundItems.get(groundItems.size()-1).vr = groundItems.get(groundItems.size()-1).thrownConditions[0][2];
        } else if(right) {
          groundItems.get(groundItems.size()-1).vx = groundItems.get(groundItems.size()-1).thrownConditions[1][0];
          groundItems.get(groundItems.size()-1).vy = groundItems.get(groundItems.size()-1).thrownConditions[1][1];
          groundItems.get(groundItems.size()-1).vr = groundItems.get(groundItems.size()-1).thrownConditions[1][2];
        } else if(down) {
          groundItems.get(groundItems.size()-1).vx = groundItems.get(groundItems.size()-1).thrownConditions[2][0];
          groundItems.get(groundItems.size()-1).vy = groundItems.get(groundItems.size()-1).thrownConditions[2][1];
          groundItems.get(groundItems.size()-1).vr = groundItems.get(groundItems.size()-1).thrownConditions[2][2];
        } else if(up) {
          groundItems.get(groundItems.size()-1).vx = groundItems.get(groundItems.size()-1).thrownConditions[3][0];
          groundItems.get(groundItems.size()-1).vy = groundItems.get(groundItems.size()-1).thrownConditions[3][1];
          groundItems.get(groundItems.size()-1).vr = groundItems.get(groundItems.size()-1).thrownConditions[3][2];
        } else {
          groundItems.get(groundItems.size()-1).vx = groundItems.get(groundItems.size()-1).thrownConditions[4][0];
          groundItems.get(groundItems.size()-1).vy = groundItems.get(groundItems.size()-1).thrownConditions[4][1];
          groundItems.get(groundItems.size()-1).vr = groundItems.get(groundItems.size()-1).thrownConditions[4][2];
        }
        letGo = false;
  }
  void use() {
  }
}
