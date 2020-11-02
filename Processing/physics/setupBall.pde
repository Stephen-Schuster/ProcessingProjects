class setupBall {
  float vx, vy, xPos = 0, yPos = 0, xA =0, yA =g;
  float mass = 0.057;
  float launchSpeed = 44.64;
  float angle = 55;
  float dragCoeff = 0.01862;
  
  boolean isConnectedToMouse;
  
  setupBall(){
    
  }
  void show() {
    noStroke();
    fill(0,255,0);
    ellipse(xPos/scale,height-yPos/scale, sqrt(mass)*10/scale,sqrt(mass)*10/scale);
  }
  void update() {
    mass = nums[0].num;
    launchSpeed = nums[1].num;
    angle = nums[2].num;
    dragCoeff = nums[3].num;
    if(isConnectedToMouse) {
      if(!mousePressed) isConnectedToMouse = false;
      xPos = mouseX;
      yPos = height-mouseY;
    } else {
      if(pow(xPos/scale-mouseX,2)+pow(height-yPos/scale-mouseY,2)<=mass*100/(scale*scale) && mousePressed) {
        isConnectedToMouse = true;
      }
    }
  }
  ball getBall() {
    return new ball(xPos, yPos, xA, yA,mass,  launchSpeed, angle,dragCoeff);
  }
}
