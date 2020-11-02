ArrayList<complexNum> points = new ArrayList<complexNum>();
PImage img;
void initPts() {
  points.clear();
  imageMode(CORNER);
  background(0);
  image(img,0,0);
  int x = 0, y = 0;
  loadPixels();
  boolean found = false;
  while(y<img.height && !found) {
    x = 0;
    while(x<img.width && !found) {
      if(pixels[y*width+x]== color(255,0,0)) {
        found = true;
      }
      if(!found)x++;
    }
    if(!found)y++;
  }
  if(!found) throw new ArrayIndexOutOfBoundsException("no start point found");
  points.add(new complexNum(2.0*x/img.width-1,2.0*y/img.height-1));
  int dirx = 0;
  int diry = 0;
  while(found) {
    int ndirx = dirx, ndiry = diry;
    found = false;
    if(brightness(pixels[y*width+x+1])>0 && !(-dirx==1 && -diry==0)) {
      ndirx = 1; ndiry = 0;
      found = true;
    }
    if(brightness(pixels[y*width+x-1])>0 && !(-dirx==-1 && -diry==0)) {
      if(found) throw new ArrayIndexOutOfBoundsException("split path at "+x+","+y);
      else {
        ndirx = -1; ndiry = 0;
        found = true;
      }
    }
    if(brightness(pixels[y*width+x+width])>0 && !(-dirx==0 && -diry==1)) {
      if(found) throw new ArrayIndexOutOfBoundsException("split path at "+x+","+y);
      else {
        ndirx = 0; ndiry = 1;
        found = true;
      }
    }
    if(brightness(pixels[y*width+x-width])>0 && !(-dirx==0 && -diry==-1)) {
      if(found) throw new ArrayIndexOutOfBoundsException("split path at "+x+","+y);
      else {
        ndirx = 0; ndiry = -1;
        found = true;
      }
    }
    if(!found) {
      if(brightness(pixels[y*width+x+1+width])>0 && !(-dirx==1 && -diry==1)) {
        ndirx = 1; ndiry = 1;
        found = true;
      }
      if(brightness(pixels[y*width+x-1-width])>0 && !(-dirx==-1 && -diry==-1)) {
        if(found) throw new ArrayIndexOutOfBoundsException("split path at "+x+","+y);
        else {
          ndirx = -1; ndiry = -1;
          found = true;
        }
      }
      if(brightness(pixels[y*width+x+width-1])>0 && !(-dirx==-1 && -diry==1)) {
        if(found) throw new ArrayIndexOutOfBoundsException("split path at "+x+","+y);
        else {
          ndirx = -1; ndiry = 1;
          found = true;
        }
      }
      if(brightness(pixels[y*width+x-width+1])>0 && !(-dirx==1 && -diry==-1)) {
        if(found) throw new ArrayIndexOutOfBoundsException("split path at "+x+","+y);
        else {
          ndirx = 1; ndiry = -1;
          found = true;
        }
      }
    }
    dirx = ndirx; diry = ndiry;
    x+=dirx; y+=diry;
    int fx = x, fy = y;
    //if(green(pixels[y*width+x-1])<128) fx+=green(pixels[y*width+x-1])/4;
    //else fx+=(green(pixels[y*width+x-1])-255)/4;
    //if(blue(pixels[y*width+x-1])<128) fy+=blue(pixels[y*width+x-1])/4;
    //else fy+=(blue(pixels[y*width+x-1])-255)/4;
    points.add(new complexNum(2.0*fx/img.width-1,2.0*fy/img.height-1));
  }
  updatePixels();
  background(0);
  complexNum sum = new complexNum(0,0);
  for(complexNum a: points) {
    sum = sum.add(a);
  }
  sum = new complexNum(sum.real/points.size(), sum.imag/points.size());
  for(int i = 0; i<points.size(); i++) {
    points.set(i,points.get(i).add( new complexNum(-sum.real, -sum.imag)));
  }
}
//void initPts() {
//  int pointslength = 100;
//  for(int i = 0; i<pointslength/4; i++) {
//    points.add(new complexNum(8.0*i/pointslength-1,1));
//  }
//  for(int i = 0; i<pointslength/4; i++) {
//    points.add(new complexNum(1,1-8.0*i/pointslength));
//  }
//  for(int i = 0; i<pointslength/4; i++) {
//    points.add(new complexNum(1-8.0*i/pointslength,-1));
//  }
//  for(int i = 0; i<pointslength/4; i++) {
//    points.add(new complexNum(-1,8.0*i/pointslength-1));
//  }
//}
