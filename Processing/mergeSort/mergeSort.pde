int[] list;
int[] newList;
ArrayList<Integer> switch1 = new ArrayList<Integer>();
ArrayList<Integer> switch2 = new ArrayList<Integer>();
int time, count, switchesPerFrame = 50;
void setup() {
  newList = new int[width];
  fullScreen();
  list = new int[width];
  strokeWeight(1);
  stroke(255);
  for(int i = 0; i<list.length; i++) list[i] = (int)((double)i/width*height);
  scramble();
  for(int i = 0; i<width; i++) newList[i] = list[i];
  mSort(0,width-1);
  time = 0; count = 0;
}

void draw() {
  background(0);
  for(int i = 0; i<width; i++) {
    line(i,height-list[i],i,height);
  }
  for(int i = 0; i<switchesPerFrame; i++) {
    if(switch1.size()>0) {
      int t = list[switch1.get(0)];
      list[switch1.get(0)] = list[switch2.get(0)];
      list[switch2.get(0)] = t;
      switch1.remove(0);
      switch2.remove(0);
    } else print("done");
  }
}

void scramble() {
  ArrayList<Integer> nList = new ArrayList<Integer>();
  for(int i = 0; i<width; i++) {
    nList.add((int)random(i),i);
  }
  int[] tempList = new int[width];
  for(int i = 0; i<width; i++) tempList[i] = list[i];
  for(int i = 0; i<width; i++) list[i] = tempList[nList.get(i)];
}

void switchInts(int start, int end) {
  int t = newList[start];
  newList[start] = newList[end];
  newList[end] = t;
  switch1.add(start);
  switch2.add(end);
}

void mSort(int start, int end) {
  if(end-start>1) {
    mSort(start,(start+end)/2);
    mSort((start+end)/2+1,end);
    print(" ::  ");
    for(int i = start; i<=end; i++) {
      print(newList[i]+" ");
    }
    int list1 = start;
    int list2 = (start+end)/2+1;
    while(list1<list2 && list2<=end) {
      if(newList[list1]>newList[list2]) {
        for(int i = list2; i>list1; i--) {
          switchInts(i,i-1);
        }
        list1++;
        list2++;
      } else if(newList[list1]<newList[list2]) {
        list1++;
      } else {
        for(int i = list2; i>list1; i--) {
          switchInts(i,i-1);
        }
        list1+=2;
        list2++;
      }
    }
    print(" :  ");
    for(int i = start; i<=end; i++) {
      print(newList[i]+" ");
    }
  }else{
    print(" ::  ");
    for(int i = start; i<=end; i++) {
      print(newList[i]+" ");
    }
    if(newList[start]>newList[end]) switchInts(start,end);
    print(" :  ");
    for(int i = start; i<=end; i++) {
      print(newList[i]+" ");
    }
  }
}
