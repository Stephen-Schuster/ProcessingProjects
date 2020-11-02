void dogBlocks() {
  if(!switched[1]) {
    fill(0,0,0,0);
    strokeWeight(height/100);
    stroke(0,255,0);
  } else {
    fill(0,255,0);
    noStroke();
  }
    for(int x = 0; x<gBlocks[lvl].length; x++) {
      for(int y = 0; y<gBlocks[lvl][0].length; y++) {
        println("x: "+x+" y: "+y+" "+gBlocks[lvl][x][y]);
        if(gBlocks[lvl][x][y]){
          rect(x*width/35+sideMargins,y*height/20+11*height/20,height/20+2,height/20+1);
        }
      }
    }
}
boolean[][][] gBlocks = {{
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,t,f},
  {f,f,f,f,f,f,f,t,f},
  {f,f,f,f,f,f,f,t,f},
  {f,f,f,t,f,f,f,f,f},
  {f,f,f,t,f,f,f,f,f},
  {f,f,f,t,f,f,f,f,f},
  {f,f,f,t,f,f,f,t,t},
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
  {f,f,f,f,f,f,f,f,f},
  {f,f,f,f,f,f,f,f,f}
}};
