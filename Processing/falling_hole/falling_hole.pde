PImage img;
int state;
float deg;
int ox;
int oy;
int r;
float g;
float vx;
float vy;
float x;
float y;
void setup () {
  size(800, 600);
  img = loadImage("scary_face.png");
  state = 1;
  deg = 0;
  ox = 400;
  oy = 300;
  background(128, 128, 128);
  strokeWeight(3);
  stroke(0,0,0);
  r=180;
  g=2;
  vx=2;
  vy=0;
  x=ox;
  y=oy;
  imageMode(CENTER);
}

void draw() {
  if(deg>PI*2) {
    state = 2;
  }
  if(state==1) {
    line((int)(ox + (r*cos(deg))),(int)( oy + (r*sin(deg))),(int)( ox + (r*cos(deg+0.01570796326))),(int)( oy + (r*sin(deg+0.01570796326))));
    deg=deg+0.01570796326;
  }
  if(state==2) {
    image(img,ox,oy);
    strokeWeight(440);
    stroke(128,128,128);
    fill(0,0,0,0);
    ellipse(ox,oy,800,800);
    strokeWeight(3);
    stroke(0,0,0);
    ellipse(ox,oy,2*r,2*r);
    fill(128,128,128);
    ellipse(x,y,2*r,2*r);
    x=x+vx;
    y=y+vy;
    vy=vy+g;
  }
}
