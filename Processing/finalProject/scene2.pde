PImage[] scene2images;
int scene2frame = 0;
float scene2y;
void initScene2() {
  scene2images = new PImage[2];
  scene2y = height/5;
  for (int i = 0; i<2; i++) {
    scene2images[i] = loadImage("bootsNhat"+i+".png");
  }
}

void scene2() {
  if (timePassed-sceneStartTimes[2]>scene2frame/3.0)scene2frame++;
  scene2y = -((float)timePassed - (float)sceneStartTimes[2])/((float)sceneStartTimes[3] - (float)sceneStartTimes[2])*(3*height/5)+height/5.0;
  image(scene2images[scene2frame%2], width/2, scene2y, 6*height/5*7/15, 6*height/5);
}
