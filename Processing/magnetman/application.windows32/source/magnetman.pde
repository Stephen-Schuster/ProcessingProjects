int time = 0;
int oldTime = 0;
int facing = 0;
float magmanX;
float magmanY;
float acceleration =0.16;
float jump = -4;
float magmanSpeed = 5;
float magmanvy = 0;
float magmanvx = 0;
float gravity = 0.1;
int magmanH = 80;
boolean right = false;
boolean left = false;
boolean airJump = true;
PImage[] sprites = new PImage[8];
void setup() {
  for(int i = 0; i<sprites.length; i++) sprites[i] = loadImage("magman"+i+".png");
  fullScreen();
  imageMode(CENTER);
  background(100);
  magmanX = width/2;
  magmanY = height;
}

void draw() {
  time++;
  background(150);
  if(magmanvx<0) facing = 4;
  else if(magmanvx>0) facing = 0;
  if(time-oldTime<40) {
    image(sprites[time%60/30+2+facing],magmanX,magmanY-magmanH/2+10,magmanH,magmanH+20);
  } else {
    image(sprites[time%60/30+facing],magmanX,magmanY-magmanH/2,magmanH,magmanH);
  }
  if(magmanY == height) {
    if(right) magmanvx=magmanSpeed;
    else if(left) magmanvx=-magmanSpeed;
    else magmanvx = 0;
  } else {
    if(right) {
      magmanvx+=acceleration;
      if(magmanvx>magmanSpeed) magmanvx = magmanSpeed;
    } else if(left) {
      magmanvx-=acceleration;
      if(magmanvx<-magmanSpeed) magmanvx = -magmanSpeed;
    } else {
      if(magmanvx>0) magmanvx-=acceleration;
      if(magmanvx<0) magmanvx+=acceleration;
      if(magmanvx<acceleration && magmanvx>-acceleration) magmanvx = 0;
    }
  }
  magmanX+=magmanvx;
  if(magmanX+magmanH/2>width) magmanX = width-magmanH/2;
  if(magmanX-magmanH/2<0) magmanX = magmanH/2;
  magmanY+=magmanvy;
  if(magmanY<=0) magmanY = 0;
  if(magmanY>=height) magmanY = height;
  else magmanvy+=gravity;
  if(magmanY == height) { magmanvy = 0; airJump = true; }
}

void keyPressed() {
  if(key == 'd') {
    right = true;
  } else if(key == 'a') {
    left = true;
  } else if(key == 'w' && magmanY == height) {
    magmanvy = jump;
  } else if(key == 'w' && airJump) {
    magmanvy = jump;
    airJump = false;
    oldTime = time;
  }
}

void keyReleased() {
  if(key == 'd') {
    right = false;
  } else if(key == 'a') {
    left = false;
  }
  key = '/';
}
