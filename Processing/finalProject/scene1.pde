PImage[] scene1images;
int scene1frame = 0;
boolean partB = false;
void initScene1() {
  scene1images = new PImage[7];
  for (int i = 0; i<7; i++) {
    scene1images[i] = loadImage("horse"+i+".png");
  }
}

void scene1() {
  image(scene1images[scene1frame%7], width/2, height/2-250*width/(271*4), width/2, 250*width/(271*2));
  if (timePassed-sceneStartTimes[1]>scene1frame/24.0)scene1frame++;
  if (timePassed-sceneStartTimes[1]>2 && !partB) {
    partB = true;
    for (int i = 0; i<7; i++) scene1images[i] = loadImage("horse"+i+"b.png");
  }
}
