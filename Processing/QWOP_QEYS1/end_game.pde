void end() {
  if(state == gameover){
    background(255);
    fill(255);
    strokeWeight(5);
    stroke(0);
    rect(100,375,200,100);
    fill(0);
    textSize(72);
    if(counter<10) text((int)counter,170,150);
    else if(counter<100) text((int)counter,150,150);
    else if(counter<1000) text((int)counter,135,150);
    else text((int)counter,110,150);
    textSize(30);
    if(counter>highscore) {
      text("New Highscore!", 90,200);
    }else {
      text("Highscore: "+highscore, 110,200);
    }
    textSize(45);
    text("Game Over",80,335);
    text("Retry?",140,440);
    if(mouseX>=100 && mouseX<=300 && mouseY>=375 && mouseY<=475 && mousePressed) {
      state = start;
      mousePressed = false;
      if(counter>highscore) highscore = (int)counter;
      setup();
    }
    if(keyPressed && key == ' ') {
      state = start;
      mousePressed = false;
      setup();
      key = '/';
    }
  }
}
