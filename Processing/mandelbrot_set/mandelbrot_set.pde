int maxIterations=500;
int sideSpace;
boolean zoomed = true;
float zoom = 1.0;
float focusx = 0;
float focusy = 0;
void setup() {
  fullScreen();
  sideSpace = (width-height)/2;
  colorMode(HSB);
}

void draw() {
  if(zoomed) {
    loadPixels();
    for(int i = 0; i<pixels.length; i++) {
      if(i%width>sideSpace && i%width<width-sideSpace) {
        float a = ((i%width-(float)sideSpace)/(width-2.0*sideSpace)*4-2);
        float b = ((i/width)/((float)height)*4-2);
        a*=zoom;
        b*=zoom;
        a+=focusx;
        b+=focusy;
        float oga = a;
        float ogb = b;
        int its = 0;
        while(its<maxIterations) {
          float olda = a;
          a = a*a-b*b+oga; // (a+bi)(a+bi)(a+bi)(a+bi)
          b = 2*olda*b+ogb; // a^4+6(a^2-b^2)+(-4ab^3i)+4(a^3)bi
          if(a*a+b*b>4.0) {
            break;
          }
          its++;
        }
        pixels[i] = color(its/100.0*360,255,255);
      }
    }
    updatePixels();
    zoomed = false;
  }
}

void keyPressed() {
  if(keyCode == UP) {
    focusx= ((mouseX-(float)sideSpace)/(width-2.0*sideSpace)*4-2)*zoom+focusx;
    focusy= ((mouseY)/((float)height)*4-2)*zoom+focusy;
    zoom*=0.75;
    focusx-= ((mouseX-(float)sideSpace)/(width-2.0*sideSpace)*4-2)*zoom;
    focusy-= ((mouseY)/((float)height)*4-2)*zoom;
  } else if(keyCode == DOWN) {
    zoom/=0.75;
    if(zoom>=1) {
      zoom = 1;
      focusx = 0;
      focusy = 0;
    }
  }
  zoomed = true;
}
