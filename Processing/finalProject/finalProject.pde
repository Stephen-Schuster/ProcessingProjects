//OLD TOWN ROAD ANIMATED MUSIC VIDEO
//MADE BY GAVIN "STEPHEN" SCHUSTER
//THE PROJECT DISPLAYS THE LYRICS IN CUSTOM WESTERN FONT WITH ANIMATIONS BESIDE THEM

import processing.sound.*;
SoundFile music;
double timePassed = 0;//number of seconds since the start of the program
double[] sceneStartTimes = {0, 16.5, 21, 25, 32, 47, 55, 69, 86}; //scene x starts at timePassed == sceneStartTimes[x]
double[] lineStartTimes = {0, 16.5, 25, 32, 47, 55, 69, 86}; //line x starts at timePassed == lineStartTimes[x]
double endOfProgramTime = 86; //"CLick to Replay" shows up 86 after the poem starts
boolean introDone = false, startScreenLoaded = false;
float introTime = 0;
long time2load;
void setup() {
  fullScreen();
}

void draw() {
  if (timePassed == 0 && !introDone) { //draws intro screen the first frame but doesn't appear when replayed because introDone will be true then
    timePassed+=1.0/frameRate;//increasing the time passed
    background(255);
    fill(255, 0, 0);
    textSize(height/5);
    text("Old Town Road", width/2-textWidth("Old Town Road")/2.0, height/2);
    textSize(height/15);
    text("by Lil Nas X Feat. Billy Cyrus", width/2-textWidth("by Lil Nas X Feat. Billy Cyrus")/2.0, 3*height/4);
    startScreenLoaded = true;
  } else if (!introDone) { //loads everything
    if (introTime == 0) {
      long time = millis();
      initFont();
      initLines();
      initScenes();
      music = new SoundFile(this, "music.mp3");
      music.play();
      time2load = millis()-time;
    }
    if (introTime > 3-time2load/1000.0) {
      introDone = true;
    } //makes sure the loading intro lasts for atleast 3 seconds
    introTime+=1.0/frameRate;//increasing the time passed
  } else { // song, lyrics and animations are playing
    background(255);
    timePassed+=1.0/frameRate;//increasing the time passed
    if (timePassed<endOfProgramTime) {
      scenes();
      lines();
    } else end();
  }
}

void scenes() {
  if (timePassed<endOfProgramTime && timePassed>sceneStartTimes[7]) scene7();
  else if (timePassed>sceneStartTimes[6]) scene6();
  else if (timePassed>sceneStartTimes[5]) scene5();
  else if (timePassed>sceneStartTimes[4]) scene4();
  else if (timePassed>sceneStartTimes[3]) scene3();
  else if (timePassed>sceneStartTimes[2]) scene2();
  else if (timePassed>sceneStartTimes[1]) scene1();
  else if (timePassed>sceneStartTimes[0]) scene0();
}

void initScenes() {
  initScene0();
  initScene1();
  initScene2();
  initScene3();
  initScene4();
  initScene5();
}
