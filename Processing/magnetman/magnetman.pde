int time = 0;
int oldTime = 0;
int facing = 0;
int lookingUpOrDown = 0;
int magmanSprite;
int gameState;
int gameOver = 2;
int playing = 1;
int start = 0;
float magmanX;
float magmanY;
float acceleration;
float jump;
float magmanSpeed;
float magmanvy = 0;
float magmanvx = 0;
float gravity;
float flyingSpeedX;
float flyingSpeedY;
int magmanH;
int attacking;
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;
boolean airJump = true;
boolean hasItem = false;
int bossStage = 0;
int cutscene = 0;
int flying = 0;
int magTimeStart = 20;
int useCooldown = 0;
color[][] robotClrs = new color[32][32];
ArrayList<Item> groundItems = new ArrayList<Item>();
Item heldItem;
PImage explosion;
PImage robot;
PImage tire;
PImage arm;
PImage cannon;
PImage cannonBall;
int bossHP=100;
int explosionNum = 0;
int cStateTime =1;
int cannonState;
float cannonRot = PI/2;
int loading1, loading2, loading3, reload2shot1, shot12shot2, shot22shot3, shot32reload;
cannonBall cball;
PImage[] sprites = new PImage[24];
boolean letGo = true;
void setup() {
  loadImages();
  fullScreen();
  print(width+"x"+height);
  imageMode(CENTER);
  noStroke();
  loading1 = 0; 
  loading2 = 1; 
  loading3 = 2; 
  reload2shot1 = 3; 
  shot12shot2= 4; 
  shot22shot3 = 5; 
  shot32reload = 6;
  cannonState = loading1;
  cball = new cannonBall(0, 0);
  flyingSpeedX = width/27;
  flyingSpeedY = -height/77;
  magmanX = width/2;
  magmanY = height;
  magmanH = (int)(height/9.6);
  acceleration = width/8537.5;
  jump = -height/192;
  magmanSpeed = width/273.2;
  gravity = -jump/40;
  groundItems.add(new bat(width/2, height/2));
  groundItems.add(new baseball(width/4, height/2));
  groundItems.add(new yogaBall(3*width/4, height/2));
  gameState =playing;
}

void loadImages() {
  robot = loadImage("robot.png");
  tire = loadImage("tire.png");
  arm = loadImage("arm.png");
  cannon = loadImage("cannon.png");
  cannonBall = loadImage("cannonBall.png");
  explosion = loadImage("explosion.png");
  for (int i = 0; i<sprites.length; i++) sprites[i] = loadImage("magman"+i+".png");
}

void draw() {
  if (gameState == playing) {
    background(150);
    time++;
    if (useCooldown>0) useCooldown--;
    showBoss();
    showMagman();
    handleItems();
    if (flying == 0) {
      handleMagmanMovement();
      handleMousePresses();
    } else {
      magmanX+=flyingSpeedX*flying;
      magmanY+=flyingSpeedY;
      if (magmanX>width || magmanX<0) gameState = gameOver;
    }
    handleCannonFire();
    handleBossHealth();
  } else {
    background(255, 0, 0);
  }
}

void handleCannonFire() {
  if (explosionNum%30 != 0) {
    explosionNum--;
    tint(255, 255*(explosionNum%30/30.0));
    image(explosion, (1+(explosionNum/30)*2)*width/6, height*5/6, width/3, height/3);
    tint(255, 255);
  }
  if (0 <= cannonState && cannonState <= 2) {
    if (cStateTime == 1) {
      cball.x = width-3.6*height/24;
      cball.y = -1*height/24;
    }
    cball.show();
    cball.update();
    if (cball.y>9*height/24) {
      cannonState++; 
      cStateTime = 0;
    }
    pushMatrix();
    translate(width-3.5*height/24, 15*height/24+(9.0*height/24/24.0));
    rotate(PI/2);
    image(cannon, -8.5/24*9*height/24, -0.5*height/24+(9.0*height/24/24), 9*height/24, 9*height/24);
    popMatrix();
  } else if (cannonState == reload2shot1) {
    if (cannonRot> -0.262753787) {
      cannonRot-=PI/180; 
      if (cannonRot>-0.262753787) {
        cball.x = 0; 
        cball.y = 0;
      } else {
        cball.x = 7*width/8; 
        cball.y = 2*height/3;
      }
    } else {
      cball.shootUpdate(-0.262753787); 
      cball.show();
    }
    if (cball.y>height) {
      cannonState++; 
      cStateTime = 0;
      explosionNum = 29;
      if ((int)(magmanX/(width/3))==0 && magmanY>2*height/3) {
        if (magmanX>width/6) flying = 1;
        else flying = -1;
      }
    }
    pushMatrix();
    translate(width-3.5*height/24, 15*height/24+(9.0*height/24/24));
    rotate(cannonRot);
    image(cannon, -8.5/24*9*height/24, -0.5*height/24+(9.0*height/24/24), 9*height/24, 9*height/24);
    popMatrix();
  } else if (cannonState == shot12shot2) {
    if (cannonRot> -0.4491579) {
      cannonRot-=PI/180; 
      if (cannonRot>-0.4491579) {
        cball.x = 0; 
        cball.y = 0;
      } else {
        cball.x = 7*width/8; 
        cball.y = 19*height/27;
      }
    } else {
      cball.shootUpdate(-0.4491579); 
      cball.show();
    }
    if (cball.y>height) {
      cannonState++; 
      cStateTime = 0;
      explosionNum = 59;
      if ((int)(magmanX/(width/3))==1 && magmanY>2*height/3) {
        if (magmanX>width/2) flying = 1;
        else flying = -1;
      }
    }
    pushMatrix();
    translate(width-3.5*height/24, 15*height/24+(9.0*height/24/24));
    rotate(cannonRot);
    image(cannon, -8.5/24*9*height/24, -0.5*height/24+(9.0*height/24/24), 9*height/24, 9*height/24);
    popMatrix();
  } else if (cannonState == shot22shot3) {
    if (cannonRot> -0.983296926) {
      cannonRot-=PI/180; 
      if (cannonRot>-0.983296926) {
        cball.x = 0; 
        cball.y = 0;
      } else {
        cball.x = 29*width/32; 
        cball.y = 19*height/27;
      }
    } else {
      cball.shootUpdate(-0.983296926); 
      cball.show();
    }
    if (cball.y>height) {
      cannonState++; 
      cStateTime = 0;
      explosionNum = 89;
      if ((int)(magmanX/(width/3))==2 && magmanY>2*height/3) {
        if (magmanX>5*width/6) flying = 1;
        else flying = -1;
      }
    }
    pushMatrix();
    translate(width-3.5*height/24, 15*height/24+(9.0*height/24/24));
    rotate(cannonRot);
    image(cannon, -8.5/24*9*height/24, -0.5*height/24+(9.0*height/24/24), 9*height/24, 9*height/24);
    popMatrix();
  } else if (cannonState == shot32reload) {
    if (cannonRot>=PI/2) {
      cannonState=0;
      cStateTime=0;
    }
    cannonRot+=PI/180; 
    pushMatrix();
    translate(width-3.5*height/24, 15*height/24+(9.0*height/24/24));
    rotate(cannonRot);
    image(cannon, -8.5/24*9*height/24, -0.5*height/24+(9.0*height/24/24), 9*height/24, 9*height/24);
    popMatrix();
  }
  cStateTime++;
}

void showBoss() {
  image(robot, width+height*3/32, height/2 - 2*height/32, height, height);
  image(tire, width-height*9.5/32, height-height*3.5/32, 7*height/32, 7*height/32);
}

void showMagman() {
  if (down && !left && !right && !hasItem && height>magmanY) lookingUpOrDown = 16;
  else if (up && !left && !right && !hasItem) lookingUpOrDown = 8;
  else lookingUpOrDown = 0;
  if (magmanvx<0) facing = 4;
  else if (magmanvx>0) facing = 0;
  magmanSprite = time%60/30+facing+lookingUpOrDown;
  if (time-oldTime<40 && lookingUpOrDown!=16) magmanSprite+=2;
  if (time-oldTime<40 && lookingUpOrDown!=16) {
    image(sprites[magmanSprite], magmanX, magmanY-magmanH/2+magmanH/8, magmanH, magmanH+magmanH/4);
  } else {
    image(sprites[magmanSprite], magmanX, magmanY-magmanH/2, magmanH, magmanH);
  }
}




void handleItems() {
  for (int i = 0; i<groundItems.size(); i++) {
    groundItems.get(i).show();
    groundItems.get(i).update();
  }
  if (hasItem) {
    heldItem.magUpdate();
    heldItem.showHeld();
  }
}



void handleMagmanMovement() {
  if (magmanY == height) {
    if (right) magmanvx=magmanSpeed;
    else if (left) magmanvx=-magmanSpeed;
    else magmanvx = 0;
  } else {
    if (right) {
      magmanvx+=acceleration;
      if (magmanvx>magmanSpeed) magmanvx = magmanSpeed;
    } else if (left) {
      magmanvx-=acceleration;
      if (magmanvx<-magmanSpeed) magmanvx = -magmanSpeed;
    } else {
      if (magmanvx>0) magmanvx-=acceleration/2;
      if (magmanvx<0) magmanvx+=acceleration/2;
      if (magmanvx<acceleration && magmanvx>-acceleration) magmanvx = 0;
    }
  }
  magmanX+=magmanvx;
  if (magmanX+magmanH/2>width) {
    magmanX = width-magmanH/2; 
    magmanvx = 0;
  }
  if (magmanX-magmanH/2<0) { 
    magmanX = magmanH/2; 
    magmanvx = 0;
  }
  magmanY+=magmanvy;
  if (magmanY<=0) magmanY = 0;
  if (magmanY>=height) magmanY = height;
  else magmanvy+=gravity;
  if (magmanY == height) { 
    magmanvy = 0; 
    airJump = true;
  }
}

void handleMousePresses() {
  if (!(mousePressed && mouseButton == RIGHT)) letGo = true;
  if (mousePressed || key == 'm' || key == 'n') {
    if ((mouseButton == RIGHT || key == 'm') && letGo) {
      if (key == 'm') key = '/';
      if (hasItem) {
        heldItem.drop();
      } else if (allMagTimes0()) {
        float leastDist = width/2;
        int besti = 0;
        if (lookingUpOrDown==0) {
          for (int i = 0; i<groundItems.size(); i++) {
            if (abs(groundItems.get(i).x-magmanX)>abs(groundItems.get(i).y-magmanY) && ((facing==0)==(groundItems.get(i).x>magmanX)) && sqrt(pow(groundItems.get(i).y-magmanY, 2)+pow(groundItems.get(i).x-magmanX, 2))<leastDist) {
              besti = i;
              leastDist = sqrt(pow(groundItems.get(i).y-magmanY, 2)+pow(groundItems.get(i).x-magmanX, 2));
            }
          }
        } else if (lookingUpOrDown == 8) {
          for (int i = 0; i<groundItems.size(); i++) {
            if (abs(groundItems.get(i).x-magmanX)<abs(groundItems.get(i).y-magmanY) && groundItems.get(i).y<magmanY && sqrt(pow(groundItems.get(i).y-magmanY, 2)+pow(groundItems.get(i).x-magmanX, 2))<leastDist) {
              besti = i;
              leastDist = sqrt(pow(groundItems.get(i).y-magmanY, 2)+pow(groundItems.get(i).x-magmanX, 2));
            }
          }
        } else {
          for (int i = 0; i<groundItems.size(); i++) {
            if (abs(groundItems.get(i).x-magmanX)<abs(groundItems.get(i).y-magmanY) && groundItems.get(i).y>magmanY && sqrt(pow(groundItems.get(i).y-magmanY, 2)+pow(groundItems.get(i).x-magmanX, 2))<leastDist) {
              besti = i;
              leastDist = sqrt(pow(groundItems.get(i).y-magmanY, 2)+pow(groundItems.get(i).x-magmanX, 2));
            }
          }
        }
        if (leastDist<width/2) {
          groundItems.get(besti).magTime = magTimeStart;
        }
        letGo = false;
      }
    } else if ((mouseButton == LEFT || key == 'n') && useCooldown == 0) {
      if (key == 'n') key = '/';
      if (hasItem) heldItem.use();
      else {
      }
    }
  }
}

void handleBossHealth() {
  fill(0);
  rect(width/27, height/20, 25*width/27, height/30);
  if (bossHP>0) {
    fill(#F205E7);
    rect(width/27+2, height/20+2, 25*width/27*(bossHP/100.0)-4, height/30-4);
  }
}

boolean allMagTimes0() {
  for (Item x : groundItems) {
    if (x.magTime>0) return false;
  }
  return true;
}
void keyPressed() {
  if (key == 'd') {
    right = true;
  } else if (key == 'a') {
    left = true;
  } else if (key == 'w') {
    up = true;
    if (magmanY == height) 
      magmanvy = jump;
    else if (airJump && !down) {
      magmanvy = jump;
      airJump = false;
      oldTime = time;
    }
  } else if (key == 's') down = true;
}

void keyReleased() {
  if (key == 'd') {
    right = false;
    key = '/';
  } 
  if (key == 'a') {
    left = false;
    key = '/';
  } 
  if (key == 'w') up = false;
  if (key == 's') down = false;
}
