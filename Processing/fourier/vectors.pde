vector[] vectors= new vector[600];
void initVectors() {
  for(int i = 0; i<vectors.length/2; i++) {
    for(int j = -1; j<=1; j+=2) {
      complexNum sum = new complexNum(0,0);
      for(int p = 0; p<points.size(); p++) {
        sum = sum.add(points.get(p).multiply(new complexNum(cos(-i*j*2*PI*p/points.size()),sin(-i*j*2*PI*p/points.size()))));
      }
      vectors[(int)(i*2+(j*0.5+1))] = new vector(new complexNum(sum.real/points.size(),sum.imag/points.size()),i*j*PI/30/printTime);
    }
  }
}
