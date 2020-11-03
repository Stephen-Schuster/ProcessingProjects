class player {
  float x, y;
  float rad = width/50;
  float zoomDist = height/3;
  float diagMult = sqrt(2)/2;
  player(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void move() {
    if(inputNum==1) {
      x-=zoomDist*diagMult;
      y+=zoomDist*diagMult;
    } else if(inputNum==2) {
      y+=zoomDist;
    } else if(inputNum==3) {
      x+=zoomDist*diagMult;
      y+=zoomDist*diagMult;
    } else if(inputNum==4) {
      x-=zoomDist;
    } else if(inputNum==6) {
      x+=zoomDist;
    } else if(inputNum==7) {
      x-=zoomDist*diagMult;
      y-=zoomDist*diagMult;
    } else if(inputNum==8) {
      y-=zoomDist;
    } else if(inputNum==9) {
      x+=zoomDist*diagMult;
      y-=zoomDist*diagMult;
    }
    inputNum = 0;
    if(x<0) x = 0;
    else if(x>width) x = width;
    if(y<0) y = 0;
    else if(y>height) y = height;
    
  }
  void show() {
    noStroke();
    fill(255,0,0);
    ellipse(x,y,rad*2,rad*2);
    fill(255);
    text(balls.size(),x-textWidth(balls.size()+"")/2,y+20);
  }
}
