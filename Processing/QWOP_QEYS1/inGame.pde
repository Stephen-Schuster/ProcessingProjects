void inGame() {
   if(state == inGame) {  
      background(255);
      stroke(0);
      line(100,700,100,0);
      line(200,700,200,0);
      line(300,700,300,0);
      for(int i = 0; i<5; i++) {
        if(x[i]>=0 && y[i]>=0) {
          if(i==lowestBlock) {
            colorMode (RGB);
            stroke(128,255,128);
          }else {
            colorMode (RGB);
            stroke(128);
          }
          colorMode (HSB);
          fill(64*x[i],255,200);
          strokeWeight(5);
          rect(x[i]*100,y[i],100,175);
        }
        
        if(y[i]<=0 && y[i]+175>=0) {
          if(i==lowestBlock) {
            colorMode (RGB);
            stroke(128,255,128);
          }else {
            colorMode (RGB);
            stroke(128);
          }
          colorMode (HSB);
          fill(64*x[i],255,200);
          strokeWeight(5);
          rect(x[i]*100,0,100,y[i]+175);
        }
        if(y[i]>700) {
          state = gameover;
        }
        y[i]+=sqrt(speed);
      }
      if(keyPressed && key == 'q' && badKey != 'q') {
        badKey = 'q';
        if(x[lowestBlock] == 0) {
            x[lowestBlock] = (int)random(4);
            y[lowestBlock] -= 875;
            lowestBlock--;
            if(lowestBlock<0) lowestBlock = 4;
            counter++;
        } else {
          state = gameover;
        }
        key = '/';
      } else if(keyPressed && key == 'w' && badKey != 'w') {
        badKey = 'w';
        if(x[lowestBlock] == 1) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
          counter++;
        } else {
          state = gameover;
        }
        key = '/';
      } else if(keyPressed && key == 'o' && badKey != 'o') {
        badKey = 'o';
        if(x[lowestBlock] == 2) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
          counter++;
        } else {
          state = gameover;
        }
        key = '/';
      } else if(keyPressed && key == 'p' && badKey != 'p') {
        badKey = 'p';
        if(x[lowestBlock] == 3) {
          x[lowestBlock] = (int)random(4);
          y[lowestBlock] -= 875;
          lowestBlock--;
          if(lowestBlock<0) lowestBlock = 4;
          counter++;
        } else {
          state = gameover;
        }
        key = '/';
      }
      speed+=0.1;
  }
}
