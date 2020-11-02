void start() {
  if(state == start) {
    background(255);
    image(gear,350,50);
    stroke(10);
    strokeWeight(5);
    fill(255);
    ellipse(200,350,200,200);
    stroke(0);
    fill(0);
    textSize(60);
    text("Start",135,370);
    if(sqrt(pow(200-mouseX,2)+pow(350-mouseY,2))<100 && mousePressed) {
      state = inGame;
      mousePressed = false;
    }
    if(sqrt(pow(350-mouseX,2)+pow(50-mouseY,2))<30 && mousePressed) {
      state = settings;
      mousePressed = false;
    }
    if(key == ' ' && keyPressed) {
      state = inGame;
      key = '/';
      speed = startSpeed;
    }
    
  }
}
