void dopBlocks() {
  if(switched[1]) {
    fill(0,0,0,0);
    strokeWeight(height/100);
    stroke(255,100,175);
  } else {
    fill(255,100,175);
    noStroke();
  }
    for(int x = 0; x<pBlocks[lvl].length; x++) {
      for(int y = 0; y<pBlocks[lvl][0].length; y++) {
        if(pBlocks[lvl][x][y])rect(x*width/35+sideMargins,y*height/20+11*height/20,height/20+2,height/20+1);
      }
    }
}
boolean[][][] pBlocks = {{
  
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,t,f,f,f,f},
  {f,f,f,f,t,f,f,f,f},
  {f,f,f,f,t,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,t,f,f,f,f},
  {f,f,f,f,t,f,f,f,f},
  {f,f,f,f,t,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f}
}};
