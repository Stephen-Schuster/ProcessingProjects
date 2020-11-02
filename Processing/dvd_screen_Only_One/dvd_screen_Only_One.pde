PImage logo;
int  logoNum = 2;
boolean trailes = false;
int radx = 47+94*logoNum, rady = 21+42*logoNum;
ArrayList<dvd> thing = new ArrayList<dvd>();
boolean[][] good = new boolean[radx][rady];
void setup() {
  logo = loadImage("logo"+logoNum+".png");
  fullScreen();
  colorMode(HSB);
  image(logo,0,0);
  loadPixels();
  for(int i = 0; i<radx; i++) {
    for(int j = 0; j<rady; j++) {
      good[i][j] = brightness(get(i,j))==255;
    }
  }
  updatePixels();
  thing.add(new dvd(width/2,height/2,random(1)<0.5,random(1)<0.5,thing.size()));
  background(0);
}

void draw() {
  if(trailes) fill(0,0,0,30);
  else fill(0,0,0);
  noStroke();
  rect(0,0,width,height);
  for(int i = 0; i<thing.size(); i++) {
    thing.get(i).update();
    thing.get(i).show();
  }
}
