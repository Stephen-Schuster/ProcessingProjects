float maxIterations=500;
int sideSpace;
float cImag = 0.1889;
float cReal = -0.7269;
void setup() {
  fullScreen();
  sideSpace = (width-height)/2;
  colorMode(HSB);
}

void draw() { 
  cImag = mouseY*2.0/height-1;
  cReal = (mouseX-sideSpace)*2.0/height;
  loadPixels();
    for(int i = 0; i<pixels.length; i++) {
      if(i%width>sideSpace && i%width<width-sideSpace) {
        float a = ((i%width-(float)sideSpace)/(width-2.0*sideSpace)*4-2);
        float b = ((i/width)/((float)height)*4-2);
        float oga = a;
        float ogb = b;
        int its = 0;
        while(its<maxIterations) {
          float olda = a;
          a = a*a-b*b+cReal;
          b = 2*olda*b+cImag;
          if(a*a+b*b>4.0) {
            break;
          }
          its++;
        }
        pixels[i] = color(its/maxIterations*360,255,255);
      }
    }
  updatePixels();
}
