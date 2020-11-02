ArrayList<Integer> dir;
int[] x = {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int[] y = {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int limx;
int limy;
int sizex;
int sizey;
int ticks;
int foodx;
int foody;
int snek;
boolean paused;
boolean gameOver;
void setup() {
  for (int i = 1;i<x.length;i++) {
    x[i] = 0;
    y[i] = 0;
  }
  x[0] = 1;
  y[0] = 1;
  fullScreen();;
  sizex = 20;
  sizey = 20;
  dir = new ArrayList<Integer>();
  limx = width/sizex;
  limy = height/sizey;
  background(0);
  ticks = 0;
  noStroke();
  newfood();
  gameOver = 1>2;
  snek = 1;
}
void newfood() {
  foodx = (int)(random(limx-1));
  foody = (int)(random(limy-1));
}
void draw() {
  if (gameOver == false) {
    if (ticks == 0) {
      fill(0);
      rect(x[snek-1]*sizex,y[snek-1]*sizey,sizex,sizey);
      for (int i = snek-1; i>0;i--) {
        x[i] = x[i-1];
        y[i] = y[i-1];
      }
      if(dir.contains(1)) {
        y[0] = y[0] - 1;
      }
      if(dir.contains(2)) {
        x[0] = x[0] + 1;
      }
      if(dir.contains(3)) {
        y[0] = y[0] + 1;
      }
      if(dir.contains(4)) {
        x[0] = x[0] - 1;
      }
      while(dir.size()>1) dir.remove(0);
      fill(255,255,255);
      rect(x[0]*sizex,y[0]*sizey,sizex,sizey);
    }
    ticks++;
    if(ticks == 5) {
      ticks = 0;
    }
    fill(255,0,0);
    rect(foodx*sizex,foody*sizey,sizex,sizey);
    if (x[0]>=limx || x[0]<0 || y[0]>=limy || y[0]<0) {
      gameOver = true;
    }
    for (int i = 1; i<snek; i++) {
      if (x[i] == x[0] && y[i] == y[0]) {
        gameOver = 1<2;
      }
    }
    if (x[0] == foodx && y[0] == foody) {
      fill(255,255,255);
      rect(foodx*sizex,foody*sizey,sizex,sizey);
      newfood();
      snek = snek +3;
    }
  } else {
    background(255,0,0);
  }
  if (gameOver == false) {
    fill(0,0,0);
    rect(width-51,height-50,30,50);
  }
  textSize(20);
  fill(255,255,255);
  text(snek,width-50,height-20);
  if (key == 'p') {
    if (gameOver == false) {
      gameOver = true;
      paused = true;
    } else {
      if (paused == true) {
        gameOver = false;
        paused = false;
      }
    }
    key = 'q';
  }
  if (key == 'r') {
    setup();
    key = 'q';
  }
}
void keyPressed() {
      if (key == CODED) {
        if(dir.size()>0) {
          if (keyCode == UP && dir.get(dir.size()-1)!=3) {
            dir.add(1);
          }
          if (keyCode == RIGHT && dir.get(dir.size()-1)!= 4) {
            dir.add(2);
          }
          if (keyCode == DOWN && dir.get(dir.size()-1) != 1) {
            dir.add(3);
          }
          if (keyCode == LEFT && dir.get(dir.size()-1) != 2) {
            dir.add(4);
          }
        } else {
          if (keyCode == UP) {
            dir.add(1);
          }
          if (keyCode == RIGHT) {
            dir.add(2);
          }
          if (keyCode == DOWN) {
            dir.add(3);
          }
          if (keyCode == LEFT) {
            dir.add(4);
          }
        }
      }
}
