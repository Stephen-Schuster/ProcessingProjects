class editableNumber {
  String name;
  float num;
  boolean inEditMode;
  String editNum;
  float w = width/10;
  float h = height/8;
  float x;
  float y;
  String thing = "";
  boolean type;
  editableNumber(String name, float num, float x, float y) {
    this.name = name;
    this.num = num;
    inEditMode = false;
    editNum = "";
    this.x = x;
    this.y = y;
  }
  void show() {
    fill(150);
    stroke(100);
    strokeWeight(2);
    rect(x,y,w,h);
    fill(0);
    textSize(height/42);
    text(name,x+w/2.0-(textWidth(name)/2.0),y+height/21);
    if(!inEditMode) {
      text(num,x+w/2.0-(textWidth(num+"")/2.0),y+2*height/21);
    } else {
      text(editNum,x+w/2.0-(textWidth(editNum)/2.0),y+2*height/21);
    }
  }
  
  void update() {
    if(inEditMode) {
      if(key == ENTER) {
        inEditMode = false;
          num = parseFloat(editNum);
          f.hasFocus = false;
          key = '/';
      } else if(time>0 && type) {
        editNum+=key;
        time = 0;
        type = false;
      }
    } else {
      if(mousePressed && x<=mouseX && mouseX<=x+w && y<=mouseY && mouseY<=y+h) {
        inEditMode = true;
        editNum = "";
        f.hasFocus = true;
        f.focus = this;
      }
    }
  }
}
