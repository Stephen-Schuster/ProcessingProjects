circle[][] circles = new circle[256][144];
float h;
float w;
int frame = 0;
int framesBetween = 1;
circle trackedCircle;
void setup() {
  fullScreen();
  h = (float)height/circles[0].length;
  w = (float)width/circles.length;
  colorMode(HSB, 255);
  path = new boolean[circles.length][circles[0].length];
  for(int x = 0; x<path.length; x++) for(int y = 0; y<path[0].length; y++) path[x][y] = false;
  ArrayList<Integer> clrs = new ArrayList<Integer>();
  for(int i = 0; i<circles.length*circles[0].length; i++) clrs.add(255*i/(circles.length*circles[0].length));
  for(int x = 0; x<circles.length; x++) {
    for(int y = 0; y<circles[0].length; y++) {
      int r = (int)random(clrs.size());
      circles[x][y] = new circle(color(clrs.get(r),255,255),x,y);
      clrs.remove(r);
    }
  }
  trackedCircle = circles[(int)random(circles.length)][(int)random(circles[0].length)];
  trackedCircle.tracked = true;
  noStroke();
  println(height);
  println(width);
}

void draw() {
  background(0);
  for(circle[] col : circles) for(circle c : col) c.show(); 
  //fill(trackedCircle.clr);
  //for(int i = 0; i<path.length; i++) for(int j = 0; j<path[0].length; j++) if(path[i][j]) rect(i*w,j*h,w,h);
    //path[trackedCircle.x][trackedCircle.y] = false;
  if(frame%framesBetween == framesBetween-1) {
    for(int i = 0; i<50000; i++) {
      int x = (int)random(circles.length);
      int y = (int)random(circles[0].length);
      if(!circles[x][y].isSwitching) {
        int ox, oy;
        float r = random(1);
        float hue = hue(circles[x][y].clr);
        float thresh = (hue-128)/1280.0*5.0+0.5;
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
    //path[trackedCircle.x][trackedCircle.y] = !path[trackedCircle.x][trackedCircle.y];
  }
  frame++;
}
