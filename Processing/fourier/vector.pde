class vector {
  float currTheta, radiansPerFrame, magnitude;
  vector(float  startTheta, float rpf, float mag) {
     currTheta = startTheta; radiansPerFrame = rpf; magnitude = mag;
  }
  vector(complexNum cn, float rpf) {
    currTheta = atan2(cn.imag,cn.real);
    magnitude = sqrt(cn.imag*cn.imag+cn.real*cn.real);
    radiansPerFrame = rpf;
  }
  void inc() {
    currTheta+=radiansPerFrame;
  }
  complexNum getCN() {
    return new complexNum(magnitude*cos(currTheta),magnitude*sin(currTheta));
  }
}
