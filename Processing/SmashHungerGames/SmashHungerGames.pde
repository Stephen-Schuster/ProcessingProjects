int state = 0, cornicopia = 0, regular = 1, feast = 2, end = 3;
ArrayList<fighter> fighters = new ArrayList<fighter>();
ArrayList<fighter> podium = new ArrayList<fighter>();
boolean proceed = false;
boolean done = false;
int day = 1;
int findChance = 55;
int rareChance = 15;
int battleChance = 30;
int lastDayNumDead = 0;
ArrayList<String> story = new ArrayList<String>();
int x = 0;
ArrayList<fighter> cornFighters = new ArrayList<fighter>();
fighter lastWinner = null;
void setup() {
  size(300,300);
  for(int i = 0; i<76; i++) fighters.add(new fighter(i));
  for(int i = 0; i<76;i++) cornFighters.add(fighters.get(i));
  story.add("Day 1: The Bloodbath");
  story.add(getRunners()+runPlural);
  println(startDescription);
  while(cornFighters.size()>1) {
    int r = (int)random(10);
    if(r<3) {
      run();
    } else if(r<6){
      itemFind(findCornFighter(false));
    } else {
      findCornBattle();
    }
  }
  if(cornFighters.size()>0) run();
  state = regular;
  while(fighters.size()>1) {
    nextDay();
    for(int i = 0; i<20 && fighters.size()>1; i++) {
      int r = (int)random(100);
      if(r<findChance) {
        itemFind(findFighter(false,null));
      } else if(r<findChance+rareChance) {
        rareEvent(findFighter(false,null));
      } else {
        findBattle();
      }
    }
  }
  int place = 1;
  String spod;
  if(fighters.size()>0) {place = 2; spod = "Results:\n1st - "+fighters.get(0).name+" - "+fighters.get(0).numKills+" KOs\n";}
  else spod = "Results:\n";
  for(int i = podium.size()-1; i>=0; i--) {
    spod+= place;
    if(place%10== 1) spod+="st - ";
    else if(place%10== 2) spod+="nd - ";
    else if(place%10== 3) spod+="rd - ";
    else spod+="th - ";
    spod+=podium.get(i).name+" - "+podium.get(i).numKills+" KOs\n";
    place++;
  }
  story.add(spod);
}
void draw() {
  if(proceed) {
    if(!done)println(story.get(x));
    if(x+1<story.size()) x++;
    else done = true;
    proceed = false;
  }
}
void keyPressed() {
  proceed = true;
}
fighter findCornFighter(boolean speedWeighted){
  if(speedWeighted) {
    int total = 0;
    for(fighter f:cornFighters) total+=f.getSpeed();
    int r = (int)random(total);
    int j = 0;
    for(int i = 0; i<cornFighters.size(); i++) {
      r-=cornFighters.get(i).getSpeed();
      if(r<0) {j = i; i = 1000;}
    }
    return cornFighters.get(j);
  } else {
    return cornFighters.get((int)random(cornFighters.size()));
  }
}
fighter findFighter(boolean speedWeighted, fighter exclude) {
  if(speedWeighted) {
    int total = 0;
    for(fighter f:fighters) if(f!=exclude) total+=f.getSpeed();
    int r = (int)random(total);
    int j = 0;
    for(int i = 0; i<fighters.size(); i++) {
      if(fighters.get(i)!=exclude) {
        r-=fighters.get(i).getSpeed();
        if(r<0){ j = i;i = 1000; }
      }
    }
    if(fighters.get(j)!=exclude)return fighters.get(j);
    else return findFighter(speedWeighted,exclude);
  } else {
    int i =(int)random(fighters.size());
    if(fighters.get(i)!=exclude)return fighters.get(i);
    else return findFighter(speedWeighted,exclude);
  }
}
String getRunners() {
  String s = "";
  boolean first = true;
  for(int i = 75; i>=0; i--) {
    if(random(1.0)>0.5) {
      if(first) {
        s = names[i];
        s = "and "+s;
        first = false;
      } else s = names[i]+", "+s;
      cornFighters.remove(i);
    }
  }
  return s;
}
void itemFind(fighter f) {
  String s = "";
  int itemNum;
  if(state == cornicopia) {
    float r = random(1);
    int i;
    for(i = 0;r>=0 && i<cornItemChances.length; i++) {
      r-=cornItemChances[i];
    }
    itemNum = i-1;
  } else itemNum = (int)random(itemNames.length);
  if(itemNames[itemNum].charAt(0)=='a' || itemNames[itemNum].charAt(0)=='o') s = f.name+" finds an "+itemNames[itemNum];
  else s = f.name+" finds a "+itemNames[itemNum];
  story.add(s);
  if(itemNum==6) f.numMasterBalls++;
  if(itemNum==9) f.numPokeBalls++;
  if(itemNum==24) f.buffs.add(new statModifier(1,1,0.5,10,1));
  if(itemNum==28) f.buffs.add(new statModifier(1,2,1,10,1));
  if(itemNum<6) f.assistors.add(itemNames[itemNum]);
  else if(itemNum<22) f.numItems++;
  else if(itemNum<29) f.buffs.add(new statModifier(2,1,1,10,1));
  else if(itemNum<34) randomKill(f,itemNames[itemNum]);
  else if(itemNum==34) {f.numSpecialFlags++; story.add("A voice booms throughout the arena \""+f.name+" HAS OBTAINED A SPECIAL FLAG!\"");f.buffs.add(new statModifier(1,1,20,10,1));}
  else if(itemNum==35) f.buffs.add(new statModifier(0.75,1,1,10,1));
  else if(itemNum==36) f.buffs.add(new statModifier(1,2,2,10,1));
  else if(itemNum==37) f.buffs.add(new statModifier(1,3,1,10,2));
}
void randomKill(fighter f, String w) {
  fighter rf = fighters.get((int)random(fighters.size()));
  if(rf == f) randomKill(f,w);
  else {
    story.add(f.name+" used their new "+w+" on "+rf.name+", knocking them out of the arena!\n"+f.name+" claims all of "+rf.name+"'s spirits and the "+deathSpirits[rf.ogFighterNum]+" spirit!\n"+(fighters.size()-1)+" fighters remain.");
    if(rf.numLives>0) {rf.resurrect(); story.add(" However, "+rf.name+" came back!");}
    else {
      fighters.remove(rf.fighterNum);
      f.numKills++;
      if(rf.name.equals("Samus")) f.isSamusKiller = true;
      lastWinner = f;
      podium.add(rf);
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(rf==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = rf.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
    f.buffs.add(spirits[deathSpiritNums[rf.ogFighterNum]].clone());
    f.numSpecialFlags+=rf.numSpecialFlags;f.numPokeBalls+=rf.numPokeBalls;f.numMasterBalls+=rf.numMasterBalls;f.numItems+=rf.numItems;
    if(rf.numSpecialFlags>0) {story.add("\nA voice booms throughout the arena \""+f.name+" HAS OBTAINED A SPECIAL FLAG!\"");f.buffs.add(new statModifier(1,1,20,10,1));}
    for(statModifier buff: rf.buffs) f.buffs.add(buff); for(String assistor: rf.assistors) f.assistors.add(assistor);
  }
}
void run() {
  fighter runner = findCornFighter(true);
  for(int i = 0; i<cornFighters.size(); i++) if(runner==cornFighters.get(i)) {story.add(cornFighters.remove(i).name+runSingle); break;}
}
void findCornBattle() {
  fighter f1 = findCornFighter(true);
  for(int i = 0; i<cornFighters.size(); i++) if(f1==cornFighters.get(i)) {cornFighters.remove(i); break;}
  fighter f2 = findCornFighter(true);
  cornFighters.add(f1);
  battle(f1,f2);
}
void findBattle() {
  fighter f1 = findFighter(true,null);
  fighter f2 = findFighter(true,f1);
  battle(f1,f2);
}
void battle(fighter f1, fighter f2) {
  if(f1.assistors.size()>0) {
    String s = f2.name+" was knocked out of the arena by "+f1.name+"'s "+f1.assistors.get(0);
    if(f2.numLives>0) {f2.resurrect(); s+=" However, "+f2.name+" came back!";}
    else {
      fighters.remove(f2.fighterNum);
      f1.numKills++;
      if(f2.name.equals("Samus")) f1.isSamusKiller = true;
      lastWinner = f1;
      podium.add(f2);
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(f2==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = f2.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
    s+="\n"+f1.name+" claims all of "+f2.name+"'s spirits and the "+deathSpirits[f2.ogFighterNum]+" spirit!";
    if(f2.numSpecialFlags>0) {s+="\nA voice booms throughout the arena \""+f1.name+" HAS OBTAINED A SPECIAL FLAG!\"";f1.buffs.add(new statModifier(1,1,20,10,1));}
    s+="\n"+fighters.size()+" fighters remain.";
    story.add(f2.name+" was knocked out of the arena by "+f1.name+"'s "+f1.assistors.get(0)+"\n"+f1.name+" claims all of "+f2.name+"'s spirits and the "+deathSpirits[f2.ogFighterNum]+" spirit!");
    f1.numSpecialFlags+=f2.numSpecialFlags;f1.numPokeBalls+=f2.numPokeBalls;f1.numMasterBalls+=f2.numMasterBalls;f1.numItems+=f2.numItems;
    for(statModifier buff: f2.buffs) f1.buffs.add(buff); for(String assistor: f2.assistors) f1.assistors.add(assistor);
    f1.incFight();
    f1.assistors.remove(0);
    return;
  }
  int total = 100;
  total+=f1.getSight();
  total+=f2.getSight();
  String f1strm = "", f2strm = "";
  int str1 = f1.getStrength(f1strm);
  int str2 = f2.getStrength(f2strm);
  int r = (int)random(total);
  String s = "";
  if(r<100) s+=f1.name+" gets into a fight with "+f2.name+".\n";
  else if(r<100+f1.getSight()) {s+=f1.name+" ambushes "+f2.name+".\n"; str1*=1.3;}
  else {s+=f2.name+" ambushes "+f1.name+".\n";str2*=1.3;}
  if(str1/str2>2 && canFlee(f2,f1)) {s+="However, "+f2.name+" flees from the fight!"; story.add(s); return;}
  if(str2/str1>2 && canFlee(f1,f2)) {s+="However, "+f1.name+" flees from the fight!"; story.add(s); return;}
  s+=f1strm;
  s+=f2strm;
  total = 0;
  total+=str1;
  total+=str2;
  r = (int)random(total);
  if(r<str1) {
    r = (int)random(f1.killMove.length);
    s+=f1.name+" knocks "+f2.name+" out of the arena with "+f1.killMove[r]+".";
    if(f2.numLives>0) {f2.resurrect(); s+=" However, "+f2.name+" came back!";}
    else {
      fighters.remove(f2.fighterNum);
      podium.add(f2);
      f1.numKills++;
      if(f2.name.equals("Samus")) f1.isSamusKiller = true;
      lastWinner = f1;
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(f2==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = f2.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
    if(f1.killMove[r].charAt(f1.killMove[r].length()-1) != ')') {
      s+="\n"+f1.name+" claims all of "+f2.name+"'s spirits and the "+deathSpirits[f2.ogFighterNum]+" spirit!";
      f1.buffs.add(spirits[deathSpiritNums[f2.ogFighterNum]].clone());
      f1.numSpecialFlags+=f2.numSpecialFlags;f1.numPokeBalls+=f2.numPokeBalls;f1.numMasterBalls+=f2.numMasterBalls;f1.numItems+=f2.numItems;
      if(f2.numSpecialFlags>0) {s+="\nA voice booms throughout the arena \""+f1.name+" HAS OBTAINED A SPECIAL FLAG!\"";f1.buffs.add(new statModifier(1,1,20,10,1));}
      for(statModifier buff: f2.buffs) f1.buffs.add(buff); for(String assistor: f2.assistors) f1.assistors.add(assistor);
      f1.incFight();
    } else {
      fighters.remove(f1.fighterNum);
      podium.add(f1);
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(f1==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = f1.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
  } else {
    r = (int)random(f2.killMove.length);
    s+=f2.name+" knocks "+f1.name+" out of the arena with "+f2.killMove[r]+".";
    if(f1.numLives>0) {f1.resurrect(); s+=" However, "+f1.name+" came back!";}
    else {
      fighters.remove(f1.fighterNum);
      podium.add(f1);
      f2.numKills++;
      if(f1.name.equals("Samus")) f2.isSamusKiller = true;
      lastWinner = f2;
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(f1==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = f1.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
    if(f2.killMove[r].charAt(f2.killMove[r].length()-1) != ')') {
      s+="\n"+f2.name+" claims all of "+f1.name+"'s spirits and the "+deathSpirits[f1.ogFighterNum]+" spirit!";
      f2.buffs.add(spirits[deathSpiritNums[f1.ogFighterNum]].clone());
      f2.numSpecialFlags+=f1.numSpecialFlags;f2.numPokeBalls+=f1.numPokeBalls;f2.numMasterBalls+=f1.numMasterBalls;f2.numItems+=f1.numItems;
      if(f1.numSpecialFlags>0) {s+="\nA voice booms throughout the arena \""+f2.name+" HAS OBTAINED A SPECIAL FLAG!\"";f2.buffs.add(new statModifier(1,1,20,10,1));}
      for(statModifier buff: f1.buffs) f2.buffs.add(buff); for(String assistor: f1.assistors) f2.assistors.add(assistor);
      f2.incFight();
    } else {
      fighters.remove(f2.fighterNum);
      podium.add(f2);
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(f2==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = f2.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
  }
  s+="\n"+fighters.size()+" fighters remain.";
  story.add(s);
}
boolean canFlee(fighter f1, fighter f2) {
  if(f1.isJiggsResting) return false;
  int total = f1.getSpeed()+f2.getSpeed()+50;
  int r = (int)random(total);
  return (r<f1.getSpeed());
}
void nextDay() {
  for(int i = 0; i<fighters.size(); i++) {
    fighters.get(i).incDay();
  }
  String s = "Fallen Tributes:";
  for(int i = lastDayNumDead; i<podium.size(); i++) {
    s+="\n"+podium.get(i).name;
  }
  lastDayNumDead = podium.size();
  story.add(s);
  day++;
  story.add("Day "+day);
}
