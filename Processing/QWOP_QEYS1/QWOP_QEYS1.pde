float[] x, y, x1, y1;
int state, start, inGame, gameover, lowestBlock, settings,thing,thing2,highscore;
float speed, counter, startSpeed;
PImage gear, back, up, down;
char badKey;
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
    highscore = 0;
  }
  start();
  inGame();
  end();
  settings();
}
void keyReleased() {
  badKey = '/';
}
