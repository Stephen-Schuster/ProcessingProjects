ArrayList<ball> balls  = new ArrayList<ball>();
player p = new player(width/2,height/2);
int inputNum = 0;
int frames = 0;
void setup() {
  fullScreen();
  p = new player(width/2,height/2);
  textSize(40);
}

void draw() {
  background(255);
  frames++;
  if(frames%720==1) balls.add(new ball(random(width),0,0,height/120.0/60));
  if(frames%720==180) balls.add(new ball(random(width),height,0,-height/120.0/60));
  if(frames%720==360) balls.add(new ball(0,random(height),height/120.0/60,0));
  if(frames%720==540) balls.add(new ball(width,random(height),-height/120.0/60,0));
  p.show();
  p.move();
  for(ball Ball : balls) {Ball.show(); Ball.move();}
  death();
}

void keyPressed() {
  inputNum = key-(int)('0');
}

void death() {
  boolean over = false;
  for(ball Ball : balls) {
    if(sqrt((Ball.x-p.x)*(Ball.x-p.x)+(Ball.y-p.y)*(Ball.y-p.y))<=p.rad*2) {
      over = true;
      break;
    }
  }
  if(over) {
    inputNum = 0;
    while(balls.size()>0) balls.remove(0);
    frames = 0;
    p.x = width/2;
    p.y= height/2;
  }
}
