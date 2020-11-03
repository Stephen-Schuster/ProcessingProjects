circle[][] circles = new circle[128][72];
float h;
float w;
int frame = 0;
int framesBetween = 1;
void setup() {
  fullScreen();
  h = (float)height/circles[0].length;
  w = (float)width/circles.length;
  colorMode(HSB, 255);
  for(int x = 0; x<circles.length; x++) {
    for(int y = 0; y<circles[0].length; y++) {
      if(circles.length/2.0-circles[0].length/6.0<x && x<circles.length/2.0+circles[0].length/6.0 && circles[0].length/3.0<y && y<circles[0].length*2/3.0) circles[x][y] = new circle(color(0,0,0),x,y);
      else circles[x][y] = new circle(color(0,0,255),x,y);
    }
  }
  noStroke();
  println(height);
  println(width);
}

void draw() {
  background(0);
  for(circle[] col : circles) for(circle c : col) c.show();
  if(frame%framesBetween == framesBetween-1) {
    for(int i = 0; i<50000; i++) {
      int x = (int)random(circles.length);
      int y = (int)random(circles[0].length);
      if(!circles[x][y].isSwitching) {
        int ox, oy;
        float r = random(1);
        float thresh = 0.5;
        if(r<thresh) {
          if(random(1)<0.5) {
            ox = x;
            oy = y-1;
          } else {
            ox = x-1;
            oy = y;
          }
        } else {
          if(random(1)<0.5) {
            ox = x;
            oy = y+1;
          } else {
            ox = x+1;
            oy = y;
          }
        }
        if(0<=ox && ox<circles.length && 0<=oy && oy<circles[0].length && !circles[ox][oy].isSwitching) {
          circles[ox][oy].isSwitching = true;
          circles[x][y].isSwitching = true;
          circle temp = circles[x][y];
          circles[x][y] = circles[ox][oy];
          circles[ox][oy] = temp;
          circles[ox][oy].setX(ox);
          circles[ox][oy].setY(oy);
          circles[x][y].setX(x);
          circles[x][y].setY(y);
        }
      }
    }
    for(circle[] col : circles) for(circle c : col) c.isSwitching = false;
  }
  frame++;
}
