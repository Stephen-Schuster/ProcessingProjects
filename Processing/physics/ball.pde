class ball {
  float vx, vy, xPos, yPos, xA, yA, mass, launchSpeed, angle, dragCoeff;
  ball(float xPos, float yPos, float xA, float yA, float mass, float launchSpeed, float angle, float dragCoeff){
    this.xPos = xPos;
    this.yPos = yPos;
    this.xA = xA;
    this.yA = yA;
    this.mass = mass;
    this.launchSpeed = launchSpeed;
    this.angle = angle;
    this.dragCoeff = dragCoeff;
    vx = launchSpeed*cos(radians(angle));
    vy = launchSpeed*sin(radians(angle));
  }
  void calc() {
    float ivx = vx, ivy = vy, ixPos = xPos, iyPos = yPos;
    xA = dragCoeff*(-ivx+w.windStr*cos(radians(w.windAngle)))/mass;
    yA = (g*mass+dragCoeff*(-ivy+w.windStr*sin(radians(w.windAngle))))/mass;
    vx = ivx+xA*timeStep;
    vy = ivy+yA*timeStep;
    xPos = ixPos+vx*timeStep+0.5*xA*timeStep*timeStep;
    yPos = iyPos+vy*timeStep+0.5*yA*timeStep*timeStep;
  }
  void show() {
    noStroke();
    fill(0,255,0);
    ellipse(xPos/scale,height-yPos/scale, sqrt(mass)*10/scale,sqrt(mass)*10/scale);
  }
  
}
