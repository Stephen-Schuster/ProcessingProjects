boolean isInZone(int x, int y) {
  //C
  if(x>50 && x<100 & y>100 && y<600) return true;
  if(x>100 && x<275 & y>100 && y<150) return true;
  if(x>100 && x<275 & y>550 && y<600) return true;
  
  // A
  if(x>350 && x<400 & y>100 && y<600) return true;
  if(x>550 && x<600 & y>100 && y<600) return true;
  if(x>400 && x<550 & y>100 && y<175) return true;
  if(x>400 && x<550 & y>300 && y<375) return true;
  return false;
}
