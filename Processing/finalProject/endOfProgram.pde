
void end() {
  drawLine("Click to Replay", 0, 2*width/5, height*10/21);
  drawLine("Or Esc to Quit", 1, 41*width/100, height*10/21);
  if (mousePressed) {
    currentParagraph = 0;
    timePassed = 0;
    scene0frame = 0;
    scene1frame = 0;
    scene2frame = 0;
    scene3frame = 0;
    scene5frame = 0;
    scene7frame = 0;
    partB = false;
    initScene1();
    music.stop();
    music.play();
  }
}
