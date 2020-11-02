circle c;
int scroll = 0;
int scrollSpeed = 10;
int numOfCircles = (int)random(10)+3;
boolean catchingUp = true;
boolean scrollable = true;
ArrayList<Float> xs = new ArrayList<Float>();
ArrayList<Float> ys = new ArrayList<Float>();
void setup() {
  size(1200,400);
  c = new circle();
}

void draw() {
  background(0);
  if(numOfCircles>0) {
    c.move();
    c.show();
  }
}

void keyPressed() {
  if(keyCode == RIGHT && scrollable && c.bestX()>scroll) {
    scroll+=scrollSpeed;
  } else if(keyCode == LEFT && scroll>scrollSpeed && scrollable) {
    scroll-=scrollSpeed;
    catchingUp = false;
  }
}

void keyReleased() {
  if(keyCode == RIGHT && scrollable) {
    keyCode = 2485;
  } else if(keyCode == LEFT && scroll>scrollSpeed && scrollable) {
    keyCode = 2485;
  }
}
