float[] x, y, x1, y1;
int state, start, inGame, gameover, lowestBlock, settings,thing,thing2;
float speed, counter, startSpeed;
PImage gear, back, up, down;
void setup() {
  gear = loadImage("settings.png"); back = loadImage("back.png");
  up = loadImage("up.png"); down = loadImage("down.png");
  size(400,700);
  start = 2485; inGame = 69; gameover = 0; settings = 420;
  state = start;
  x = new float[5];
  y = new float[5];
  x1 = new float[5];
  y1 = new float[5];
  imageMode(CENTER);
  speed = startSpeed; lowestBlock = 4; counter = 0;
  for(int i = 0; i<5; i++) {
    x[i] = (int)random(4);
    y[i] = 175*i-700;
  }
}

void draw() {
  if(thing != 1) {
    startSpeed = 16;
    speed = 16;
    thing = 1;
  }
  if(state == start) {
    background(255);
    image(gear,350,50);
    stroke(10);
    strokeWeight(5);
    fill(255);
    ellipse(200,350,200,200);
    stroke(0);
    fill(0);
    textSize(60);
    text("Start",135,370);
    if(sqrt(pow(200-mouseX,2)+pow(350-mouseY,2))<100 && mousePressed) {
      state = inGame;
      mousePressed = false;
    }
    if(sqrt(pow(350-mouseX,2)+pow(50-mouseY,2))<30 && mousePressed) {
      state = settings;
      mousePressed = false;
    }
    if(key == ' ' && keyPressed) {
      state = inGame;
      key = '/';
      speed = startSpeed;
    }
    
  } else if(state == inGame) {  
      background(255);
      stroke(0);
      line(100,700,100,0);
      line(200,700,200,0);
      line(300,700,300,0);
      for(int i = 0; i<5; i++) {
        if(x[i]>=0 && y[i]>=0) {
          if(i==lowestBlock) {
            colorMode (RGB);
            stroke(128,255,128);
          }else {
            colorMode (RGB);
            stroke(128);
          }
          colorMode (HSB);
          fill(64*x[i],255,200);
          strokeWeight(5);
          rect(x[i]*100,y[i],100,175);
        }
        
        if(y[i]<=0 && y[i]+175>=0) {
          if(i==lowestBlock) {
            colorMode (RGB);
            stroke(128,255,128);
          }else {
            colorMode (RGB);
            stroke(128);
          }
          colorMode (HSB);
          fill(64*x[i],255,200);
          strokeWeight(5);
          rect(x[i]*100,0,100,y[i]+175);
        }
        if(y[i]>700) {
          state = gameover;
        }
        y[i]+=sqrt(speed);
      }
      if(keyPressed && key == 'q') {
        if(x[lowestBlock] == 0) {
          if(x[(lowestBlock+4)%5] != x[lowestBlock]) {
            x[lowestBlock] = (int)random(4);
            y[lowestBlock] -= 875;
            lowestBlock--;
            if(lowestBlock<0) lowestBlock = 4;
            counter++;
          } else {
            x[lowestBlock] = (int)random(4);
            y[lowestBlock] -= 875;
            lowestBlock--;
            if(lowestBlock<0) lowestBlock = 4;
            counter++;
          }
        } else {
          state = gameover;
        }
        key = '/';
      } else if(keyPressed && key == 'w') {
        if(x[lowestBlock] == 1) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
          counter++;
        } else {
          state = gameover;
        }
        key = '/';
      } else if(keyPressed && key == 'o') {
        if(x[lowestBlock] == 2) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
          counter++;
        } else {
          state = gameover;
        }
        key = '/';
      } else if(keyPressed && key == 'p') {
        if(x[lowestBlock] == 3) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
          counter++;
        } else {
          state = gameover;
        }
        key = '/';
      }
      speed+=0.1;
  } else {
    background(255);
    fill(255);
    strokeWeight(5);
    stroke(0);
    rect(100,375,200,100);
    fill(0);
    textSize(72);
    if(counter<10) text((int)counter,180,150);
    else if(counter<100) text((int)counter,150,150);
    else if(counter<1000) text((int)counter,135,150);
    else text((int)counter,110,150);
    textSize(45);
    text("Game Over",80,335);
    text("Retry?",140,440);
    if(mouseX>=100 && mouseX<=300 && mouseY>=375 && mouseY<=475 && mousePressed) {
      state = start;
      mousePressed = false;
      setup();
    }
  }
  if(state == settings) {
    background(255);
    image(back,350,50);
    textSize(40);
    text("starting",120,200);
    text("speed",135,250);
    image(down,50,300);
    image(up,350,300);
    textSize(60);
    text((int)sqrt(startSpeed),175,325);
    if(sqrt(pow(350-mouseX,2)+pow(50-mouseY,2))<50 && mousePressed) {
      state = start;
      mousePressed = false;
    }
    if(sqrt(pow(50-mouseX,2)+pow(300-mouseY,2))<50 && mousePressed) {
      startSpeed = pow((int)sqrt(startSpeed)-1,2);
      speed = startSpeed;
      mousePressed = false;
    }
    if(sqrt(pow(350-mouseX,2)+pow(300-mouseY,2))<50 && mousePressed) {
      startSpeed = pow((int)sqrt(startSpeed)+1,2);
      speed = startSpeed;
      mousePressed = false;
    }
  }
}
