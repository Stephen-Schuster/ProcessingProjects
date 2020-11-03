int aggr = 0, def = 1, grab = 2, all = 3;
statModifier[] spirits = {new statModifier(1.3,1,1,10,10),new statModifier(1,1.3,1,10,10),new statModifier(1,1,1.3,10,10),new statModifier(1.092,1.092,1.092,10,10)};
class fighter {
  int deathSpirit;
  String name;
  int fighterNum, ogFighterNum;
  int numSpecialFlags, numLives, numItems, numPokeBalls, numMasterBalls;
  int numKills;
  String[] killMove;
  ArrayList<statModifier> buffs = new ArrayList<statModifier>();
  ArrayList<String> assistors = new ArrayList<String>();
  boolean isJiggsResting = false;
  boolean hasBombOmb = false;
  boolean bombOmbExploding = false;
  boolean isSamusKiller = false;
  fighter(int fn) {
    deathSpirit = deathSpiritNums[fn];
    name = names[fn];
    numSpecialFlags = 0;
    numLives = 0;
    fighterNum = fn;
    ogFighterNum = fn;
    killMove = killMoves[fn];
  }
  int getSpeed() {
    float sp = 100;
    for(statModifier buff : buffs) {
      sp*=buff.speed;
    }
    return (int)sp;
  }
  int getStrength(String m) {
    float st = 100;
    for(statModifier buff : buffs) {
      st*=buff.strength;
    }
    if(numItems>0) {
      if(numMasterBalls>0)  {
        st*=10000;
      } else if(numPokeBalls>0) {
        String[] badMons = {"goldeen", "magikarp", "mew", "togepi", "spewpa", "inkay"};
        int r = (int) random(55);
        if(r<6) m = "Unfortunately, "+name+" found "+badMons[r]+" in their pokeball, making it useless.\n";
        else st*=1.5;
      } else st*=1.5;
    }
    return (int)st;
  }
  int getSight() {
    float si = 100;
    for(statModifier buff : buffs) {
      si*=buff.sight;
    }
    return (int)si;
  }
  void delExpBuffs() {
    for(int i = 0; i<buffs.size(); i++) {
      if(buffs.get(i).daysLeft==0 || buffs.get(i).fightsLeft==0) {
        buffs.remove(i);
        i--;
      }
    }
  }
  void incDay() {
    isJiggsResting = false;
    for(int i = 0; i<buffs.size(); i++) {
      if(buffs.get(i).incDay()) {buffs.remove(i); i--;}
    }
    if(numSpecialFlags==1) {
      numLives+=numSpecialFlags;
      numSpecialFlags=0;
      story.add(name+" used their special flag!");
    } else if(numSpecialFlags>1) {
      numLives+=numSpecialFlags;
      numSpecialFlags = 0;
      story.add(name+" used their special flags");
    }
    if(bombOmbExploding) {
      String s = name+"was blown up by her own bomb omb";
        if(numLives>0) {resurrect(); s+=" However, "+name+" came back!";}
      else {
        fighters.remove(fighterNum);
        podium.add(this);
        if(state == regular) {findChance-=2; rareChance++; battleChance++;}
        for(int i = 0; i<cornFighters.size(); i++) if(this==cornFighters.get(i)) {cornFighters.remove(i); break;}
        for(int i = fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
      }
    }
    if(hasBombOmb) bombOmbExploding = true;
  }
  void incFight() {
    for(int i = 0; i<buffs.size(); i++) {
      if(buffs.get(i).incFight()) {buffs.remove(i); i--;}
    }
    if(numMasterBalls>0) numMasterBalls--;
    else if(numPokeBalls>0) numPokeBalls--;
    if(numItems>0) numItems--;
    hasBombOmb = false; bombOmbExploding = false;
  }
  void resurrect() {
    numLives--;
    buffs = new ArrayList<statModifier>();
    assistors = new ArrayList<String>();
    numSpecialFlags = 0;
  }
}
