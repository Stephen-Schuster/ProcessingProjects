ArrayList<panel> panels = new ArrayList<panel>();
panel currPanel;
int h = 54, w = 96;
int pxlsPerSqr, sqrL;
int selectX, selectY;
boolean selected = false;
boolean goUp = false, goLeft = false, goRight = false, goDown = false;
boolean panelUp = false, panelLeft = false, panelRight = false, panelDown = false;
void setup() {
  fullScreen();
  pxlsPerSqr = width/w;
  sqrL = pxlsPerSqr-1;
  panels.add(new panel(0,0));
  currPanel = panels.get(0);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(255);
  for(int x = 0; x<w; x++) {
    for(int y = 0; y<h; y++) {
      if(currPanel.soldiers[x][y]) fill(180);
      else fill(230);
      rect(pxlsPerSqr*(x+0.5),pxlsPerSqr*(y+0.5),sqrL,sqrL);
    }
  }
  mouseLogic();
  moveLogic();
}

void mouseLogic() {
  if(mousePressed && mouseButton == LEFT) {
    int tempX = mouseX/pxlsPerSqr;
    int tempY = mouseY/pxlsPerSqr;
    if(currPanel.soldiers[tempX][tempY]) {
      selectX = tempX;
      selectY = tempY;
    }
    selected = true;
  } else if(mousePressed && mouseButton == RIGHT) {
    selected = false;
  }
  if(selected) {
    fill(255,0,0);
    rect(pxlsPerSqr*(selectX+0.5),pxlsPerSqr*(selectY+0.5),sqrL,sqrL);
  }
}

void moveLogic() {
  if(goUp) {
    goUp = false;
    if(currPanel.soldiers[selectX][selectY-1] && currPanel.soldiers[selectX][selectY] && !currPanel.soldiers[selectX][selectY-2]) {
      currPanel.soldiers[selectX][selectY] = false;
      currPanel.soldiers[selectX][selectY-1] = false;
      currPanel.soldiers[selectX][selectY-2] = true;
    }
    selected = false;
  } else if(goDown) {
    goDown = false;
    if(currPanel.soldiers[selectX][selectY+1] && currPanel.soldiers[selectX][selectY] && !currPanel.soldiers[selectX][selectY+2]) {
      currPanel.soldiers[selectX][selectY] = false;
      currPanel.soldiers[selectX][selectY+1] = false;
      currPanel.soldiers[selectX][selectY+2] = true;
    }
    selected = false;
  } else if(goRight) {
    goRight = false;
    if(currPanel.soldiers[selectX+1][selectY] && currPanel.soldiers[selectX][selectY] && !currPanel.soldiers[selectX+2][selectY]) {
      currPanel.soldiers[selectX][selectY] = false;
      currPanel.soldiers[selectX+1][selectY] = false;
      currPanel.soldiers[selectX+2][selectY] = true;
    }
    selected = false;
  } else if(goLeft) {
    goLeft = false;
    if(currPanel.soldiers[selectX-1][selectY] && currPanel.soldiers[selectX][selectY] && !currPanel.soldiers[selectX-2][selectY]) {
      currPanel.soldiers[selectX][selectY] = false;
      currPanel.soldiers[selectX-1][selectY] = false;
      currPanel.soldiers[selectX-2][selectY] = true;
    }
    selected = false;
  }
}

void keyPressed() {
  if(key == 'w') {
    goUp = true;
  } else if(key == 'a') {
    goLeft = true;
  } else if(key == 's') {
    goDown = true;
  } else if(key == 'd') {
    goRight = true;
  } else if(key == CODED) {
    if(keyCode == UP) {
      panelUp = true;
    } else if(keyCode == RIGHT) {
      panelRight = true;
    } else if(keyCode == LEFT) {
      panelLeft = true;
    } else if(keyCode == DOWN) {
      panelDown = true;
    }
  }
}
