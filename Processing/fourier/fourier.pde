float printTime;
int frame;
ArrayList<Float> xs;
ArrayList<Float> ys;
int imgNum = 3;
void setup() {
  fullScreen();
  xs = new ArrayList<Float>();
  ys = new ArrayList<Float>();
  xs.clear();
  ys.clear();
  printTime = 25.0;
  frame = 0;
  img = loadImage("image"+imgNum+".png");
  initPts();
  initVectors();
}

void draw() {
  translate(width/2, height/2);
  if (frame>60*printTime) {
    xs.clear(); 
    ys.clear(); 
    frame = 0;
  }
  background(0);
  frame++;
  complexNum sum = new complexNum(0, 0);
  for (int i = 0; i<vectors.length; i++) {
    vectors[i].inc();
    complexNum lastSum = new complexNum(sum.real, sum.imag);
    sum = sum.add(vectors[i].getCN());
    strokeWeight(1);
    stroke(255, 0, 0);
    line(lastSum.real*height/3, lastSum.imag*height/3, sum.real*height/3, sum.imag*height/3);
    stroke(255);
    fill(0, 0, 0, 0);
    strokeWeight(0.01);
    ellipse(lastSum.real*height/3, lastSum.imag*height/3, vectors[i].magnitude*2*height/3, vectors[i].magnitude*2*height/3);
  }
  xs.add(sum.real*height/3);
  ys.add(sum.imag*height/3);
  strokeWeight(2);
  for (int i = 1; i<xs.size(); i++) {
    line(xs.get(i-1), ys.get(i-1), xs.get(i), ys.get(i));
  }
  fill(255);
  stroke(255);
  //for(complexNum i: points) {
  //  ellipse(i.real*height/3, i.imag*height/3,5,5);
  //}
  //stroke(255,0,0);
  //fill(255,0,0);
  //ellipse(points.get(points.size()-1).real*height/3, points.get(points.size()-1).imag*height/3,5,5);
}
