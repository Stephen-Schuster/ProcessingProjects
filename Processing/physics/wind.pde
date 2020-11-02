class wind {
  boolean fullScreen = true;
  float windAngle = 180;
  float windStr = 10;
  float[] arrowX = new float[15];
  float[] arrowY = new float[15];
  float w = width*scale;
  float h = height*scale;
  float x = 0;
  float y = 0;
  wind() {
    for(int i = 0; i<arrowX.length; i++) {
      if(i%3 == 0) arrowY[i] = (3*y+(y+h))/4;
      else if(i%3 == 1) arrowY[i] = (y+(y+h))/2;
      else  arrowY[i] = (y+(y+h)*3)/4;
      if(i%5 == 0)arrowY[i] = (5*x+(x+w))/6;
      else if(i%5 == 1) arrowY[i] = (2*x+(x+w))/3;
      else if(i%5 == 2) arrowY[i] = (x+(x+w))/2;
      else if(i%5 == 3) arrowY[i] = (x+(x+w)*2)/3;
      else arrowY[i] = (x+(x+w)*5)/6;
    }
  }
}
