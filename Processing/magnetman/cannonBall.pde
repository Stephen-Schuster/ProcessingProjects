class cannonBall extends Item{
  float speed = 50;
  cannonBall(float x, float y) {
    super(x,y,0.0,"cannonBall",width/13.0,width/13.0,0.0,0.0,new float[5][3]);
  }
  void shootUpdate(float angle) {
    super.x-=speed*cos(angle);
    super.y-=speed*sin(angle);
  }
}
