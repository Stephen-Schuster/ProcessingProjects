void dobBlocks() {
  if(!switched[0]) {
    fill(0,0,0,0);
    strokeWeight(height/100);
    stroke(0,0,255);
  } else {
    fill(0,0,255);
    noStroke();
  }
    for(int x = 0; x<bBlocks[lvl].length; x++) {
      for(int y = 0; y<bBlocks[lvl][0].length; y++) {
        println("x: "+x+" y: "+y+" "+bBlocks[lvl][x][y]);
        if(bBlocks[lvl][x][y]){
          rect(x*width/35+sideMargins,y*height/20,height/20+2,height/20+1);
        }
      }
    }
}
boolean f = false;
boolean t = true;
boolean[][][] bBlocks = {{
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
  {f,f,f,f,f,f,t,f,f},
  {f,f,f,f,f,f,t,f,f},
  {f,f,f,f,f,f,t,f,f},
  {f,f,f,f,f,f,t,f,f},
  {f,f,f,f,f,f,t,f,f},
  {f,f,f,f,f,f,t,f,f},
  {f,f,f,f,f,f,t,f,f},
  {f,f,f,f,f,f,t,f,f},
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
},{
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
