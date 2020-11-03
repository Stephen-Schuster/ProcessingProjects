#include <Wire.h>

#include <XInput.h>
int up = 1, down = 2, left = 3, right = 4, neutral = 0;
int movement = 0, sheild = 1, grab = 2, tilt = 3, smash = 4, special = 5, utaunt = 6, staunt = 7, dtaunt = 8;
int input = 0;
void setup() {
  // put your setup code here, to run once:
  XInput.begin();
  Wire.begin(9);
  Wire.onReceive(receiveEvent);
}

void receiveEvent(int bytes) {
  input = Wire.read();
}
void loop() {
  // put your main code here, to run repeatedly:
  int inputButton = input/5; 
  int inputDir = input%5;
  int dx = 0, dy = 0;
  XInput.setTrigger(TRIGGER_RIGHT,0);
  XInput.setButton(BUTTON_RB,false);
  XInput.setButton(BUTTON_A,false);
  XInput.setButton(BUTTON_B,false);
  XInput.setButton(DPAD_UP,false);
  XInput.setButton(DPAD_LEFT,false);
  XInput.setButton(DPAD_DOWN,false);
  if(inputDir==up)dy = -1;
  else if(inputDir==down) dy = 1;
  else if(inputDir==left) dx = -1;
  else if(inputDir==right) dx = 1;
  if(inputButton==sheild) XInput.setTrigger(TRIGGER_RIGHT, 255);
  else if(inputButton==grab) XInput.setButton(BUTTON_RB,true);
  else if(inputButton==smash&&inputButton==tilt) XInput.setButton(BUTTON_A,true);
  else if(inputButton==special) XInput.setButton(BUTTON_B,true);
  else if(inputButton==utaunt) XInput.setButton(DPAD_UP,true);
  else if(inputButton==staunt) XInput.setButton(DPAD_LEFT,true);
  else if(inputButton==dtaunt) XInput.setButton(DPAD_DOWN,true);
  if(inputButton == tilt) XInput.setJoystick(JOY_LEFT,dx*16384,dy*16384);
  else XInput.setJoystick(JOY_LEFT,dx*32767,dy*32767);
}
void pressButton(int button) {
  XInput.press(button);
  delay(300);
  XInput.release(button);
  delay(300);
}
