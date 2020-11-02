import processing.sound.*;

float[] x, y, x1, y1;
int state, start, inGame, gameover, lowestBlock, settings,thing,thing2,highscore,time,s;
float speed, counter, startSpeed;
PImage gear, back, up, down, background, flame1, flame2, flame3;
char badKey;
String[] song;
int pos;
boolean testing;

SoundFile[] files;
void setup() {
  testing = false;
  flame1 = loadImage("Flame1.png"); flame2 = loadImage("Flame2.png"); flame3 = loadImage("Flame3.png");
  song = new String[2];
  s = 1;
  song[0] = "999A98790CCCECA99A87GEC94GECC9ACA9CC9AC";
  song[1] = "2B972222B9744CB9555CCB9EEEEGEC97BBBBBBBE79BCCCCCBBBBB99B9EBBBBBBBE79BCCCCCBBBBB99B9E";
  gear = loadImage("settings.png"); back = loadImage("back.png");
  up = loadImage("up.png"); down = loadImage("down.png");
  background = loadImage("background.jpg");
  size(400,700);
  start = 2485; inGame = 69; gameover = 0; settings = 420;
  state = start;
  time = 0;
  x = new float[5];
  y = new float[5];
  x1 = new float[5];
  y1 = new float[5];
  speed = startSpeed; lowestBlock = 4; counter = -1;
  for(int i = 0; i<5; i++) {
    x[i] = (int)random(4);
    y[i] = 175*i-700;
  }
  
  files = new SoundFile[24];
  for(int i = 0; i<24; i++) {
    files[i] = new SoundFile(this,sketchPath("data\\sound"+i+".aiff"));
    files[i].amp(1.0);
  }
  
}

void draw() {
  if(thing != 1) {
    startSpeed = 16;
    speed = 16;
    thing = 1;
    highscore = 0;
  }
  time++;
  if(time%29 == 0&& testing) {
          if(song[s].charAt((int)(time/29)%song[s].length()) > 64) {
            pos = song[s].charAt((int)(time/29)%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)(time/29)%song[s].length()))%24;
          }
          files[pos].play();
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //////////////////////////////
  //GAME START SECTION        //
  //////////////////////////////
  if(state == start) {
    background(255);
    image(gear,300,0);
    stroke(10);
    strokeWeight(5);
    fill(255);
    ellipse(200,350,200,200);
    stroke(0);
    fill(0);
    textSize(60);
    text("Start",135,370);
    textSize(72);
    text("QWOP",100,150);
    text("QEYS",115,220);
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
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //////////////////////////////
  //IN GAME SECTION           //
  //////////////////////////////
  else if(state == inGame) {  
      image(background,0,0);
      stroke(255);
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
          fill(255);
          strokeWeight(5);
          if(counter>8 && counter<29) {
            image(flame1,x[i]*100,y[i]);
          } else if(counter>28 && counter<49) {
            image(flame2, x[i]*100,y[i]);
          } else if(counter>48) {
            image(flame3, x[i]*100,y[i]);
          } else {
            rect(x[i]*100,y[i],100,175);
          }
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
          fill(255);
          strokeWeight(5);
          if(counter>8 && counter<29) {
            image(flame1,x[i]*100,y[i]);
          } else if(counter>28 && counter<49) {
            image(flame2, x[i]*100,y[i]);
          } else if(counter>48) {
            image(flame3, x[i]*100,y[i]);
          } else {
            rect(x[i]*100,y[i],100,175);
          }
        }
        if(y[i]>700) {
          state = gameover;
        }
        y[i]+=sqrt(speed);
      }
      if(keyPressed && key == 'q' && badKey != 'q') {
        badKey = 'q';
        if(x[lowestBlock] == 0) {
            x[lowestBlock] = (int)random(4);
            y[lowestBlock] -= 875;
            lowestBlock--;
            if(lowestBlock<0) lowestBlock = 4;
            counter++;
          if(song[s].charAt((int)counter%song[s].length()) > 64) {
            pos = song[s].charAt((int)counter%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))%24;
          }
          files[pos].play();
        } else {
          state = gameover;
          counter++;
          if(song[s].charAt((int)counter%song[s].length()) > 64) {
            pos = song[s].charAt((int)counter%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))%24;
          }
          counter--;
          files[pos].play();
        }
        key = '/';
      } else if(keyPressed && key == 'w' && badKey != 'w') {
        badKey = 'w';
        if(x[lowestBlock] == 1) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
            counter++;
          if(song[s].charAt((int)counter%song[s].length()) > 64) {
            pos = song[s].charAt((int)counter%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))%24;
          }
          files[pos].play();
        } else {
          state = gameover;
          counter++;
          if(song[s].charAt((int)counter%song[s].length()) > 64) {
            pos = song[s].charAt((int)counter%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))%24;
          }
          counter--;
          files[pos].play();
        }
        key = '/';
      } else if(keyPressed && key == 'o' && badKey != 'o') {
        badKey = 'o';
        if(x[lowestBlock] == 2) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
            counter++;
          if(song[s].charAt((int)counter%song[s].length()) > 64) {
            pos = song[s].charAt((int)counter%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))%24;
          }
          files[pos].play();
        } else {
          state = gameover;
          counter++;
          if(song[s].charAt((int)counter%song[s].length()) > 64) {
            pos = song[s].charAt((int)counter%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))%24;
          }
          counter--;
          files[pos].play();
        }
        key = '/';
      } else if(keyPressed && key == 'p' && badKey != 'p') {
        badKey = 'p';
        if(x[lowestBlock] == 3) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
            counter++;
            files[Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))].play();
        } else {
          state = gameover;
          counter++;
          if(song[s].charAt((int)counter%song[s].length()) > 64) {
            pos = song[s].charAt((int)counter%song[s].length())-55;
          } else {
            pos = Character.getNumericValue(song[s].charAt((int)counter%song[s].length()))%24;
          }
          counter--;
        }
        key = '/';
      } 
      speed+=0.1;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //////////////////////////////
  //GAME OVER SECTION         //
  //////////////////////////////
  else if(state == gameover){
    background(255);
    fill(255);
    strokeWeight(5);
    stroke(0);
    rect(100,375,200,100);
    fill(0);
    textSize(72);
    if(counter<9) text((int)counter+1,170,150);
    else if(counter<99) text((int)counter+1,150,150);
    else if(counter<999) text((int)counter+1,135,150);
    else text((int)counter,110,150);
    textSize(30);
    if(counter>highscore) {
      text("New Highscore!", 90,200);
    }else {
      text("Highscore: "+highscore, 110,200);
    }
    textSize(45);
    text("Game Over",80,335);
    text("Retry?",140,440);
    if(mouseX>=100 && mouseX<=300 && mouseY>=375 && mouseY<=475 && mousePressed) {
      state = start;
      mousePressed = false;
      if(counter>highscore) highscore = (int)counter+1;
      setup();
    }
    if(keyPressed && key == ' ') {
      state = start;
      mousePressed = false;
      if(counter>highscore) highscore = (int)counter+1;
      setup();
      key = '/';
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //////////////////////////////
  //GAME SETTINGS SECTION     //
  //////////////////////////////
  else if(state == settings) {
    background(255);
    image(back,300,0);
    textSize(40);
    text("starting",120,200);
    text("speed",135,250);
    image(down,0,250);
    image(up,300,250);
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
void keyReleased() {
  badKey = '/';
}
