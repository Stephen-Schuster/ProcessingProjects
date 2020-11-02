PImage[] scene5images;
int scene5frame = 0;
void initScene5() {
  scene5images = new PImage[3];
  for (int i = 0; i<3; i++) {
    scene5images[i] = loadImage("tractor"+i+".png");
  }
}

void scene5() {
  if (timePassed-sceneStartTimes[5]>scene5frame/15.0) scene5frame++;
  image(scene5images[scene5frame%3], -width/9, 2*height/9, 5*width/9, 5*height/9);
}
