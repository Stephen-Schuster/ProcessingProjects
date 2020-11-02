PImage[] scene3images;
int scene3frame = 0;
void initScene3() {
  scene3images = new PImage[3];
  for (int i = 0; i<3; i++) {
    scene3images[i] = loadImage("ridingWithCar"+i+".png");
  }
}

void scene3() {
  if (timePassed-sceneStartTimes[3]>scene3frame/12.0)scene3frame++;
  image(scene3images[scene3frame%3], -width/3.0, 0, width, height);
}
