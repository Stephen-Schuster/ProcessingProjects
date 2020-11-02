/**
*    This class represents an object that moves left and right across the screen,
*    changing directions when it reaches a left or right border. 
*    
*    When you draw this object, you can use an image, a rectangle, or an ellipse.
*
*    Feel free to add any other features to the class below (like more variables
*    or new constructors/methods). HINT: You will need some variable that keeps 
*    track of which direction you are currently moving in.
*/
class HorizontalMover extends GameObject {
  PImage fly;
  float dir;
  int rad;
  public HorizontalMover() {
    super();
    super.thing = 0;
    fly = loadImage("fly.jpg");
    dir = 5;
    rad = 30;
  }
  /**
  
  public int compareTo(GameObject other) {
    return this.thing-other.thing;
  }*    Write this act method so that the object modifies its x-coordinate
  *    every time this method is called. The object should move either to
  *    the left or to the right. The object should only switch directions
  *    when it hits a side wall.
  */
  public void act() {
    if(getX()>width-rad || getX()<rad) dir*=-1;
    setX(getX()+dir);
  }
  
  /**
  *    You get to decide what to draw here...
  */
  public void draw() {
    image(fly,getX(),getY(),80,60);
  }
}
