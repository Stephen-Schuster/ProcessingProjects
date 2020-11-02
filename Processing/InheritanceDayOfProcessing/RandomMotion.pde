/**
*    This class represents an object that randomly moves around onscreen.
*    Every frame, modify the x and y values of the object by some small random
*    amount (this amount could be positive or negative). 
*    
*    When you draw this object, you can use an image, a rectangle, or an ellipse.
*
*    Feel free to add any other features to the class below (like more variables
*    or new constructors/methods).
*/
class RandomMotion extends GameObject {
  PImage crab;
  float vx;
  float vy;
  float variance = 4, backForce = 5;
  public RandomMotion() {
    super();
    crab = loadImage("crab.png");
  }
  
  public int compareTo(GameObject other) {
    return this.thing-other.thing;
  }
  /**
  *    Write this act method so that the object modifies its x- and y-coordinates
  *    every time this method is called. Add some small random amount to both.
  *    Be sure that you are getting a random number that can also be negative.
  */
  public void act() {
    vy+=random(variance)-variance/2-vy/backForce;
    vx+=random(variance)-variance/2-vx/backForce;
    setX(getX()+vx);
    setY(getY()+vy);
  }
  
  /**
  *    You get to decide what to draw here...
  */
  public void draw() {
    image(crab, getX(), getY(), 51,45);
  }
}
