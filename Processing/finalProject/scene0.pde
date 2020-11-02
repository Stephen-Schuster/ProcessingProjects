PImage[] scene0images;
int scene0frame = 0;
void initScene0() {
  scene0images = new PImage[12];
  for (int i = 0; i<12; i++) {
    if (i<7) {
      scene0images[i] = loadImage("sunset"+i+".jpg");
    } else {
      scene0images[i] = loadImage("sunset"+(5-(i-7))+".jpg");
    }
  }
}

void scene0() {
  if (timePassed>(scene0frame+1)/24.0) scene0frame++;
  imageMode(CENTER);
  image(scene0images[scene0frame%12], width/6, height/2, width/3, width/3*39/50); //39/50 is the aspect ratio
  imageMode(CORNER);
}
