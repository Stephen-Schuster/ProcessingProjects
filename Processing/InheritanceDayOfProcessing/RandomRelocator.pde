/**
*    This class represents an object that randomly moves around onscreen.
*    It only moves every 30 frames, using a counter in the act() method
*    to keep track of the current frame number and only acting when
*    appropriate.
*    The object also draws itself using an image.
*/
class RandomRelocator extends GameObject {
  
  //A variable to track number of frames, used to only act every 30 frames 
  private int frameCounter; 
  
  int movesPerSecond = 3;
  
  int[] randFrames;
  
  float rot;
  
  //Keeps track of the size of the image (drawing it as a square, so
  //this will be both width and height)
  private int size;
  
  //A PImage variable to store the image used when drawing this thing
  private PImage img;
  
  public RandomRelocator() {
    super(); 
    frameCounter = 0;
    size = 50;
    img = loadImage("vsauce.jpg");
    rot = random(2*PI);
    randFrames = new int[movesPerSecond];
  }
  
  public int compareTo(GameObject other) {
    return this.thing-other.thing;
  }
  
  /**
  *    We have to override the act method because it is
  *    abstract in our superclass.
  */
  public void act() {
    //count every frame
    
    //every 30 frames, re-set the x and y values to random numbers
    if(frameCounter % 60 == 0) {
      for(int i = 0; i<randFrames.length; i++) randFrames[i] = (int)random(60);
    }
    for(int i = 0; i<randFrames.length; i++) {
      if(frameCounter % 60 == randFrames[i]) {
        setX( (int)random(size/2, width - size/2) );
        setY( (int)random(size/2, height - size/2) );
        rot = random(2*PI);
      }
    }
    frameCounter++;
  }
  
  
  /**
  *    We have to override the draw method because it is
  *    abstract in our superclass.
  */
  public void draw() {
      //sets mode so that x and y are center of image
      //and uses the version of image that accepts
      //the desired width and height as extra parameters
      //which effectively resizes the image
      imageMode(CENTER);
      pushMatrix();
      translate( getX(), getY());
      rotate(rot);
      image(img,0,0, size, size);
      popMatrix();
  }
}
