class statModifier {
  float strength, sight, speed;
  int fightsLeft, daysLeft;
  statModifier(float st, float si, float sp, int fl, int dl) {
    strength = st;
    sight = si;
    speed = sp;
  }
  boolean incDay() {
    if(daysLeft<10) daysLeft--;
    return (daysLeft<=0);
  }
  boolean incFight() {
    if(fightsLeft<10) fightsLeft--;
    return (daysLeft<=0);
  }
  statModifier clone() {
    return new statModifier(strength,sight,speed,fightsLeft,daysLeft);
  }
}
