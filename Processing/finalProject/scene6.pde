void scene6() {
  image(yelling, 6*width/10, height/4, 3*width/10, 3*width/10*264/236); //236*264
  tint(255, (float)(3/2.0*(timePassed-sceneStartTimes[6])/(sceneStartTimes[7]-sceneStartTimes[6])*255));
  image(X, 3*width/4-(3*width/10*264/236)/2, height/4, 3*width/10*264/236, 3*width/10*264/236);
  noTint();
}
