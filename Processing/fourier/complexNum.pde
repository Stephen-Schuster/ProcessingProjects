class complexNum {
  float real, imag;
  complexNum(float real, float imag) {
    this.real = real;
    this.imag = imag;
  }
  complexNum add(complexNum other){
    return new complexNum(this.real+other.real, this.imag+other.imag);
  }
  complexNum multiply(complexNum other) {
    return new complexNum(this.real*other.real-this.imag*other.imag, this.real*other.imag+this.imag*other.real);
  }
}
