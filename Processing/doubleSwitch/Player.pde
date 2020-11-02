class Player {
  int pNum;
  float x,y;
  float vx, vy;
  boolean onGround = true;
  int sign = 0;
boolean isMoving;
  Player(int playerNum) {
    pNum = playerNum;
    y = 8.99;
    x = 1.0;
    vx = 0; vy = 0;
  }
  void show() {
    fill(0);
    noStroke();
    ellipse(x/35*width+sideMargins,pNum*height*11.0/20+y*height/20-pHeight*height/20/2,pHeight/20*height,pHeight/20*height);
    
  }
  boolean gravity() {
    boolean b = move(0,vy*(1/60.0)+0.5*g*(1/60.0)*(1/60.0));
    if(!b && vy>=0) {move(0,0.1); onGround = true;}
    else {onGround = false; vy+=g;}
    return b;
  }
  //void decelerate(int sign, boolean acc) {
  //  move(vx*(1/60.0),0);
  //  //if(!acc) {
  //  //  move(vx*(1/60.0)-0.5*(0.5*sign*vx*vx*Dba)*(1/60.0)*(1/60.0),0);
  //  //  vx-=0.5*(0.5*sign*vx*vx*Dba)*(1/60.0)*(1/60.0);
  //  //} else {
  //  //  move(vx*(1/60.0)-0.5*(0.5*sign*speed*speed*Dba)*(1/60.0)*(1/60.0),0);
  //  //  vx+=0.5*(0.5*sign*speed*speed*Dba)*(1/60.0)*(1/60.0);
  //  //}
  //}
  boolean move(float dx, float dy) {
    if(x+dx>0 && x+dx<lvlBlocks[lvl+pNum].length && y+dy>0 && y+dy<lvlBlocks[lvl+pNum][0].length && y+dy-pHeight<lvlBlocks[lvl+pNum][0].length) {
      boolean[][][] brpgBlocks;
      if(pNum == 0) {
        if(switched[0]) brpgBlocks = bBlocks;
        else brpgBlocks = rBlocks;
      } else {
        if(switched[1]) brpgBlocks = gBlocks;
        else brpgBlocks = pBlocks;
      }
      if(lavaBlocks[lvl+pNum][(int)(x+dx)][(int)(y+dy)]){gameState = gameOver; return false;}
      if(!lvlBlocks[lvl+pNum][(int)(x+dx)][(int)(y+dy)] && !lvlBlocks[lvl+pNum][(int)(x+dx)][(int)(y+dy-pHeight/2)] && !lvlBlocks[lvl+pNum][(int)(x+dx)][(int)(y+dy-pHeight)]
      && !brpgBlocks[lvl][(int)(x+dx)][(int)(y+dy)] && !brpgBlocks[lvl][(int)(x+dx)][(int)(y+dy-pHeight/2)] && !brpgBlocks[lvl][(int)(x+dx)][(int)(y+dy-pHeight)]) {
        x+=dx;
        y+=dy;
        return true;
      } else return false;
    }else return false;
  }
}
