int[] x, y, size;
float[] rotation;
float rotSpeed;
boolean[] growing;
int n, numStars, minSize, maxSize;
void setup() {
  rectMode(CENTER);
  numStars = 700;
  rotSpeed = 0.7;
  minSize = 2;
  maxSize = 20;
  size(600,700);
  x = new int[numStars];
  y = new int[numStars];
  rotation = new float[numStars];
  size = new int[numStars];
  growing = new boolean[numStars];
  n = 0;
}

void draw() {
  background(0);
  if(n<numStars) {
    x[n] = (int)random(width);
    y[n] = 0;
    size[n] = (int)random(maxSize-minSize)+minSize;
    rotation[n] = random(90);
    growing[n] = true;
    n++;
  }
  for(int i = 0; i<numStars; i++) {
    y[i]++;
    rotation[i]+=rotSpeed;
    if(rotation[i]>90) {
      rotation[i] = 1;
    }
    if(growing[i]) {
      size[i]++;
    } else {
      size[i]--;
    }
    if(size[i]<=minSize) {
      growing[i] = true;
      size[i] =  minSize;
    }
    if(size[i]>=maxSize) {
      growing[i] = false;
      size[i] = maxSize;
    }
    if(isInZone(x[i],y[i])) {
      
    pushMatrix();
    translate(x[i],y[i]);
    rotate(PI/180.0*rotation[i]);
    rect(0,0,size[i],size[i]);
    popMatrix();
    }
    if(y[i]>height) {
      
    x[i] = (int)random(width);
    y[i] = 0;
    size[i] = (int)random(maxSize-minSize)+minSize;
    rotation[i] = random(90);
    growing[i] = true;
    n++;
    }
  }
}
