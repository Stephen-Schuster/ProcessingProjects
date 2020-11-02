ball b;
setupBall sb = new setupBall();
editableNumber[] nums = new editableNumber[8];
wind w = new wind();
focus f = new focus();
PImage windArrow;
float timeStep;
float g = -9.8;
float scale = 0.05;
float time = 0;
int state, running = 0, setup = 1;
void setup() {
  fullScreen();
  timeStep = 1.0/60;
  state = setup;
  windArrow = loadImage("arrow.png");
  nums[0] = new editableNumber("mass", 0.057, 9*width/10, 0);
  nums[1] = new editableNumber("launchSpeed", 44.64, 9*width/10, height/8);
  nums[2] = new editableNumber("angle", 55, 9*width/10, 2*height/8);
  nums[3] = new editableNumber("dragCoefficient", 0.01862, 9*width/10, 3*height/8);
  nums[4] = new editableNumber("windAngle", 180, 9*width/10, 4*height/8);
  nums[5] = new editableNumber("windStrength", 10, 9*width/10, 5*height/8);
  nums[6] = new editableNumber("g", -9.8, 9*width/10, 6*height/8);
  nums[7] = new editableNumber("scale", 0.05, 9*width/10, 7*height/8);
}

void draw() {
  time+=1.0/60;
  if(state == running) {
  background(0);
    b.calc();
    b.show();
    if(key == BACKSPACE) {
      state = setup;
    }
  } else {
  background(0);
    setupState();
  }
}

void setupState() {
  playButton();
  sb.show();
    w.windAngle = nums[4].num;
    w.windStr = nums[5].num;
    g = nums[6].num;
    scale = nums[7].num;
  for(int i = 0; i<8; i++) {
    nums[i].show();
    nums[i].update();
  }
}

void playButton() {
  stroke(0,100,0);
  strokeWeight(10);
  fill(0,255,0);
  rect(78*width/100,88*height/100,10*width/100,10*height/100,width/100);
  noStroke();
  fill(0,100,0);
  triangle(80*width/100,90*height/100,80*width/100,96*height/100,86*width/100,93*height/100);
  if(mousePressed && mouseX>78*width/100 && 88*width/100>mouseX && mouseY>88*height/100) {
    b = sb.getBall();
    state = running;
  }
}

  void keyPressed() {
    if(((key == '.' && !f.focus.editNum.contains("."))|| key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || (key == '0' && !f.focus.editNum.equals("")) || (key == '-' && f.focus.editNum.equals("")))) {
      f.focus.type = true;
    }
  }
