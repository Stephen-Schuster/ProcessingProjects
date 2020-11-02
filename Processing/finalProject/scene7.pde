int scene7frame = 0;
void scene7() {
  if (timePassed-sceneStartTimes[7]>(scene7frame+1)/24.0) scene7frame++;
  imageMode(CENTER);
  image(scene0images[scene7frame%12], width/6, height/2, width/3, width/3*39/50); //39/50 is the aspect ratio
  imageMode(CORNER);
}
