/**
*    This class represents an object that moves towards the mouse. It should
*    take small steps towards the mouse during each frame of the game (each
*    time the act method is called).
*    
*    When you draw this object, you can use an image, a rectangle, or an ellipse.
*
*    Feel free to add any other features to the class below (like more variables
*    or new constructors/methods).
*/
class MouseFollower extends GameObject {
  PImage masterHand;
  float dir;
  float click;
  public MouseFollower() {
    super();
    masterHand = loadImage("masterhand.png");
    dir = 0;
  }
  
  /**
  *    Write this act method so that the object moves towards the mouse.
  *    Do not have the object teleport to the mouse's location...have it
  *    gradually move towards the mouse (perhaps have a maximum amount
  *    that it can move each time the act method is called). 
  */
  public void act() {
    float Dx = mouseX-getX();
    float Dy = mouseY-getY();
    if(Dx!=0)dir = atan(Dy/Dx);
    else dir = PI/2;
    if(getX()<mouseX) dir+=PI;
    if(mousePressed) click = -5;
    else click = 1;
    if(Dx>50 || Dx<-50) setX(getX()+click*(Dx/100+random(5)-2.5));
    else setX(getX()+click*(Dx*0.5/abs(Dx)+random(5)-2.5));
    if(Dy>50 || Dy<-50) setY(getY()+click*(Dy/100+random(5)-2.5));
    else setY(getY()+click*(Dy*0.5/abs(Dy)+random(5)-2.5));
  }
  
  /**
  *    You get to decide what to draw here...
  */
  public void draw() {
    pushMatrix();
    translate(getX(),getY());
    rotate(dir+PI);
    image(masterHand,0,0,50,50);
    popMatrix();
  }
}
