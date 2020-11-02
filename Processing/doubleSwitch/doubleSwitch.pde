int lvl = 0;
int gameState, start = 0, lvlSelect = 1, inGame = 2,gameOver = 3;
float g = 2.0, Dba = 1, jump = -30;
float pHeight = 1.9;
float sideMargins = width/128.0;
int speed = 15;
boolean[] switched = {true,false};
int[] timers = {30};
int frame;
Player[] plyrs;
void setup() {
  fullScreen();
  gameState = inGame;
  plyrs = new Player[2];
  for(int i = 0; i<2; i++) plyrs[i] = new Player(i);
}

void draw() {
  if(gameState == inGame) {
    background(255);
    doPlayers();
    doLavaBlocks();
    dorBlocks();
    dobBlocks();
    dogBlocks();
    dopBlocks();
    doLevelBlocks();
    doSwitch();
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(width/2,height/2,width,height/10);
    rectMode(CORNER);
    frame++;
    fill(0);
    noStroke();
    textAlign(RIGHT);
    textSize(40);
    text(timers[lvl]-frame/60,width,50);
    if(frame>timers[lvl]*60+30) gameState = gameOver;
  } else if(gameState == gameOver) {
    background(255,0,0);
    textAlign(CENTER);
    textSize(100);
    text("GAME OVER", width/2, height/2);
  }
}
void doSwitch() {
  switched[1] = (plyrs[0].isMoving);
  switched[0] = (plyrs[1].isMoving);
}
void doPlayers() {
  for(Player x: plyrs) {
    x.show();
    x.gravity();
    //if(!x.onGround) {
    //  if(x.sign == 0) x.decelerate((int)(-x.vx/abs(x.vx)),false);
    //  else x.decelerate(x.sign,true);
    //} else {
      x.vx = x.sign*speed;
      x.isMoving = x.vx!=0 && x.move(x.vx*(1/60.0),0);
    //}
  }
}

void doLevelBlocks() {
  fill(0);
  noStroke();
  for(int i = 0; i<2; i++) {
    for(int x = 0; x<lvlBlocks[lvl+i].length; x++) {
      for(int y = 0; y<lvlBlocks[lvl+i][0].length; y++) {
        if(lvlBlocks[lvl+i][x][y])rect(x*width/35+sideMargins,y*height/20+11*height/20*i,height/20+2,height/20+1);
      }
    }
  }
}


void keyPressed() {
  if(key == 'a') plyrs[0].sign = -1;
  if(key == 'd') plyrs[0].sign = 1;
  if(key == 'w' && plyrs[0].onGround) plyrs[0].vy = jump;
  if(key == 'j') plyrs[1].sign = -1;
  if(key == 'l') plyrs[1].sign = 1;
  if(key == 'i' && plyrs[1].onGround) plyrs[1].vy = jump;
}

void keyReleased() {
  if((key == 'a' && plyrs[0].sign!=1) || (key == 'd' && plyrs[0].sign!=-1)) plyrs[0].sign = 0;
  if((key == 'j' && plyrs[1].sign!=1) || (key == 'l' && plyrs[1].sign!=-1)) plyrs[1].sign = 0;
}
