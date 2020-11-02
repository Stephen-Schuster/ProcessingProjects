PImage yelling;
PImage X;
void initScene4() {
  yelling = loadImage("yelling.png");
  X = loadImage("redX.png");
}

void scene4() {
  image(yelling, 6*width/10, height/4, 3*width/10, 3*width/10*264/236); //236*264
  tint(255, (float)(3/2.0*(timePassed-sceneStartTimes[4])/(sceneStartTimes[5]-sceneStartTimes[4])*255));
  image(X, 3*width/4-(3*width/10*264/236)/2, height/4, 3*width/10*264/236, 3*width/10*264/236);
  noTint();
}
