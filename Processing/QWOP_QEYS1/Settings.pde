void settings() {
    if(state == settings) {
    image(back,350,50);
    textSize(40);
    text("starting",120,200);
    text("speed",135,250);
    image(down,50,300);
    image(up,350,300);
    textSize(60);
    text((int)sqrt(startSpeed),175,325);
    if(sqrt(pow(350-mouseX,2)+pow(50-mouseY,2))<50 && mousePressed) {
      state = start;
      mousePressed = false;
    }
    if(sqrt(pow(50-mouseX,2)+pow(300-mouseY,2))<50 && mousePressed) {
      startSpeed = pow((int)sqrt(startSpeed)-1,2);
      speed = startSpeed;
      mousePressed = false;
    }
    if(sqrt(pow(350-mouseX,2)+pow(300-mouseY,2))<50 && mousePressed) {
      startSpeed = pow((int)sqrt(startSpeed)+1,2);
      speed = startSpeed;
      mousePressed = false;
    }
  }
}
