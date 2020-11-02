int clr; float deg;
void setup() {
  size(800,600);
  background(0,0,30);
  colorMode(HSB, 255);
  clr = 0;
  noStroke();
  deg = 0;
}

void draw() {
  if (mousePressed) {
    clr++;
    if (clr==256) {
      clr = 0;
    }
    fill(clr,255,255);
    ellipse(mouseX+10*cos(deg),mouseY+10*sin(deg),100,100);
  }
  loadPixels();
  for (int i = 0; i<pixels.length; i++) {
    if (i%width < width-3) {
      pixels[i] = pixels[i+3];
    } else {
      colorMode(RGB, 255);
      pixels[i] = color(0,0,30);
      colorMode(HSB, 255);
    }
  }
  updatePixels();
  deg+=0.2;
  if (deg == 360) {
    deg = 0;
  }
}
