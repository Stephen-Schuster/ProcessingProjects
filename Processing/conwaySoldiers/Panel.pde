class panel {
  int px,py;
  boolean[][] soldiers = new boolean[w][h];
  panel(int px, int py) {
    this.px = px;
    this.py = py;
    for(int x = 0; x<w; x++) {
      for(int y = 0; y<h; y++) {
        if(y<5 && py == 0) soldiers[x][y] = false;
        else soldiers[x][y] = true;
      }
    }
  }
  
}
