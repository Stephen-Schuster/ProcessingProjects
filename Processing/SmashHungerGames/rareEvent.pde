void rareEvent(fighter f) {
  int fn = f.ogFighterNum;
  if(fn==0) {
    story.add("Mario found a chain chomp, which he tranformed into using cappy");
    f.buffs.add(new statModifier(1.6,0.7,0.7,10,10));
  } else if(fn==1) {
    story.add("Donkey Kong decides to eat his banana stockpile");
    f.buffs.add(new statModifier(1.6,1.5,0.6,10,2));
  } else if(fn==2) {
    story.add("Link practices and masters pulling out two arrows at a time");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==3) {
    story.add("Samus gets a chance to fully charge her charge shot");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==4) {
    story.add("Dark Samus gets a chance to fully charge its charge shot");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==5) {
    story.add("Yoshi hops up to get a view");
    f.buffs.add(new statModifier(1,100,1,10,1));
  } else if(fn==6) {
    story.add("Kirby swallows "+findFighter(true,f)+" and runs away");
    f.buffs.add(new statModifier(1.5,1,1,2,2));
  } else if(fn==7) {
    story.add("Fox realizes how busted his Up smash is");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==8) {
    story.add("Pikachu energizes itself with thunder");
    f.buffs.add(new statModifier(1.5,0.7,1.5,10,1));
  } else if(fn==9) {
    rErandomKill(f,"Luigi misfires & knocks "," out of the arena");
  } else if(fn==10) {
    story.add("Ness finds the homerun bat on the floor");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==11) {
    story.add("Captain Falcon is sponsored with the Blue Falcon");
    f.buffs.add(new statModifier(1.5,0.7,1.5,10,10));
  } else if(fn==12) {
    String s ="Jigglypuff sings at the top of her lungs, putting everybody in the arena to sleep.";
    fighter df = null;
    int bestStr = 0;
    for(int i = 0; i<fighters.size(); i++) {
      if(fighters.get(i).getStrength("")>bestStr && fighters.get(i)!=f) {
        bestStr = fighters.get(i).getStrength(""); 
        df = fighters.get(i);
      }
    }
    s+="\nShe goes looking for the strongest remaining fighter and finds "+df.name+", whom she rests on, knocking them out of the arena.\nThe blast zone makes a loud noise, waking everyone else up while Jigglypuff sleeps.";
    s+="\nJigglypuff claims all of "+df.name+"'s spirits and the "+deathSpirits[df.ogFighterNum]+" spirit!";
    if(df.numLives>0) {df.resurrect(); s+=" However, "+df.name+" came back!";}
    else {
      s+="\n"+(fighters.size()-1)+" fighters remain.";
      fighters.remove(df.fighterNum);
      podium.add(df);
      f.numKills++;
      if(df.name.equals("Samus")) f.isSamusKiller = true;
      lastWinner = f;
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(df==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = df.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
    f.buffs.add(spirits[deathSpiritNums[df.ogFighterNum]].clone());
    f.numSpecialFlags+=df.numSpecialFlags;f.numPokeBalls+=df.numPokeBalls;f.numMasterBalls+=df.numMasterBalls;f.numItems+=df.numItems;
    if(df.numSpecialFlags>0) {story.add("\nA voice booms throughout the arena \""+f.name+" HAS OBTAINED A SPECIAL FLAG!\"");f.buffs.add(new statModifier(1,1,20,10,1));}
    for(statModifier buff: df.buffs) f.buffs.add(buff); for(String assistor: df.assistors) f.assistors.add(assistor);
    story.add(s);
    f.buffs.add(new statModifier(0.01,0.01,6,10,1));
    f.isJiggsResting = true;
  } else if(fn==13) {
    story.add("Peach pulled a bomb omb with down b. She better use it soon!");
    f.buffs.add(new statModifier(4,1,1.5,1,10));
    f.hasBombOmb = true;
  } else if(fn==14) {
    story.add("Daisy pulled a bomb omb with down b. She better use it soon!");
    f.buffs.add(new statModifier(4,1,1.5,1,10));
    f.hasBombOmb = true;
  } else if(fn==15) {
    rErandomKill(f,"Bowser waits in a tree until "," comes, whom he uses down b to knock them out of the arena!");
  } else if(fn==16) {
    story.add("The Ice Climbers learn how to desync");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==17) {
    story.add("Sheik masters hiding in this environment");
    f.buffs.add(new statModifier(1,10,0.5,10,10));
  } else if(fn==18) {
    rErandomKill(f,"Zelda uses her broken final smash. It pulls in and knocks "," out of the arena!");
    rErandomKill(f,"Zelda's final smash also pulls in and knocks "," out of the arena!");
    f.buffs.add(new statModifier(1,0.3,1,10,1));
  } else if(fn==19) {
    story.add("Dr. Mario crafts a deadly prescription");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==20) {
    rErandomKill(f,"Pichu does a fully charged Side B, which hits and knocks "," out of the arena!");
  } else if(fn == 21) {
    rErandomKill(f,"Falco ambushes "," and styles on them by knocking them out of the arena with down taunt -> down smash, a true combo. For this, Falco gets a sponsorship");
    itemFind(f);
  } else if(fn==22) {
    story.add("Marth receives Tyrfing, the sword");
    f.buffs.add(new statModifier(1.4,1,1.3,10,10));
  } else if(fn==23) {
    story.add("Lucina receives Tyrfing, the sword");
    f.buffs.add(new statModifier(1.4,1,1.3,10,10));
  } else if(fn==24) {
    rErandomKill(f,"Young Link fires fire arrows into the air to lure ",". Young Link ambushes them and knocks them out of the arena with "+f.killMove[(int)random(f.killMove.length)]);
    f.buffs.add(new statModifier(1,0.7,1,10,1));
  } else if(fn==25) {
    rErandomKill(f,"Ganondorf starts spamming F-smash, which "," accidentally falls into, knocking them out of the arena!");
  } else if(fn==26) {
    story.add("Mewtwo gets a chance to fully charge its shadow ball");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==27) {
    story.add("Roy receives Tyrfing, the sword");
    f.buffs.add(new statModifier(1.4,1,1.3,10,10));
  } else if(fn==28) {
    story.add("Chrom receives Tyrfing, the sword");
    f.buffs.add(new statModifier(1.4,1,1.3,10,10));
  } else if(fn==29) {
    rErandomKill(f,"Mr. Game and Watch gets into a fight with ",". Game & Watch lands a 9, knocking them out of the arena");
  } else if(fn==30) {
    story.add("Meta Knight reverts back to brawl, making him broken again");
    f.buffs.add(new statModifier(2,1,1,10,10));
  } else if(fn==31) {
    story.add("Pit gains Palutena's guidance");
    f.buffs.add(new statModifier(1.4,1.4,1,1,10));
  } else if(fn==32) {
    story.add("Dark Put gains Palutena's guidance");
    f.buffs.add(new statModifier(1.4,1.4,1,1,10));
  } else if(fn==33) {
    story.add("Zero Suit Samus kick flips in the air to get a bird's eye view");
    f.buffs.add(new statModifier(1,100,1,10,1));
  } else if(fn==34) {
    story.add("Wario finds a burrito, giving him fully charged waft");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==35) {
    rErandomKill(f,"Snake detonates a c4 he placed earlier, knocking "," out of the arena!");
  } else if(fn==36) {
    story.add("Ike receives Tyrfing, the sword");
    f.buffs.add(new statModifier(1.4,1,1.3,10,10));
  } else if(fn==37) {
    story.add("Pokémon Trainer finds a Charizardite X, allowing hm to mega evolve charizard");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==38) {
    story.add("Diddy Kong finds Dixie Kong, a sidekick for him in battle!");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==39) {
    story.add("Lucas finds the homerun bat on the floor");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==40) {
    story.add("Sonic runs thru the entire arena at super sonic speed, knocking everyone in the air, exposing their positions, causing the following 10 fights");
    f.buffs.add(new statModifier(1,1,0.01,10,10));
    for(int i = 0; i<10 && fighters.size()>2; i++) {
      findBattle();
    }
    story.add("Sonic is satisfied");
    f.buffs.add(new statModifier(1,1,100,10,10));
  } else if(fn==41) {
    rErandomKill(f,"King Dedede does his super DEDEDE Jump and LANDDDS on ",", knocking them out of the arena!");
    f.buffs.add(new statModifier(1,0.5,1,1,1));
  } else if(fn==42) {
    story.add("Olimar masters using 5 pimin at once");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==43) {
    story.add("Lucario fully charges his charge shot");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
    if(f.numKills>0) f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==44) {
    rErandomKill(f,""," tried to pick up R.O.B.'s gyro but they got hit by it instead. \nMeanwhile R.O.B. comes out of his hiding place to knock them out of the arena with down throw -> Up smash");
  } else if(fn==45) {
    story.add("Toon Link realizes he has side burns, boosting his confidence!");
    f.buffs.add(new statModifier(1.5,1.5,0.6,10,10));
  } else if(fn==46) {
    wolfGimp(f,"Wolf fires his blaster randomly, which hits and barely gimps "," knocking them out of the arena",lastWinner);
  } else if(fn==47) {
    rErandomKill(f,""," tries to ambush Villager right as he is contributing to #teamtrees. The tree growing knocks the ambusher out of the arena.");
  } else if(fn==48) {
    rErandomKill(f,"Megaman does his side b on a tree. A little later the bomb blows up and the tree falls and lands on ",", knocking them out of the arena");
  } else if(fn==49) {
    story.add("Wii Fit Trainer does 5 sets of deep breathing");
    f.buffs.add(new statModifier(1.7,1,1,1,2));
  } else if(fn==50) {
    story.add("Rosalina and Lumas gain another Luma");
    f.buffs.add(new statModifier(1.5,1,1,2,10));
  } else if(fn==51) {
    story.add("Little Mac is sponsored with Doc Louis, who helps Little Mac train");
    f.buffs.add(new statModifier(1.5,1,1,2,10));
  } else if(fn==52) {
    rErandomKill(f,"Greninja shasow sneaks to the other side of the arena, where "," happened to be, who gets knocked out of the arena by that shadow sneak");
  } else if(fn==53) {
    story.add("Palutena realizes her nair is busted");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==54) {
    story.add("Pac-man charges up a key");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==55) {
    story.add("Robin charges up his neutral b");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==56) {
    rErandomKill(f,"Shulk gets really mad at "," for calling his arts \"monados\" so Shulk chooses \"Smash\" art and F-smash them out of the arena");
  } else if(fn==57) {
    story.add("Bowser Jr. does his down b and blindly follows behind it for a while");
    f.buffs.add(new statModifier(1.7,1,1,1,1));
  } else if(fn==58) {
    story.add("Duck Hunt duck flies up in the air to get a bird's eye view");
    f.buffs.add(new statModifier(1,100,1,10,1));
  } else if(fn==59) {
    rErandomKill(f,"Ryu shoryukens into a tree. He waits for ",", whom he ambushes and knocks out of the arena with Down B -> Nair -> Dtilit -> Jab -> Jab -> F-tilit -> Up tilit -> Shoryuken");
  } else if(fn==60) {
    rErandomKill(f,"Ken shoryukens into a tree. He waits for ",", whom he ambushes and knocks out of the arena with Down B -> Nair -> Dtilit -> Jab -> Jab -> F-tilit -> Up tilit -> Shoryuken");
  } else if(fn==61) {
    story.add("Cloud fully charges limit");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==62) {
    story.add("Corrin receives Tyrfing, the sword");
    f.buffs.add(new statModifier(1.4,1,1.3,10,10));
  } else if(fn==63) {
    story.add("Bayonetta reverts back to smash 4, making her broken again");
    f.buffs.add(new statModifier(2,1,1,10,10));
  } else if(fn==64) {
    story.add("Inkling lays low for a while(literally)");
    f.buffs.add(new statModifier(1,1,0.1,10,1));
  } else if(fn==65) {
    fighter df = null;
    for(int i = 0; i<fighters.size() && df!=null; i++) if((fighters.get(i).name.equals("Samus")||fighters.get(i).isSamusKiller)&&fighters.get(i)!=f) df = fighters.get(i);
    if(df!=null) {
      if(df.name.equals("Samus")) {
        wolfGimp(f,"Ridley hunts down and knocks "," out of the arena because of their rivalry",df);
      } else {
        wolfGimp(f,"Ridley finds the remains of Samus. He hunts down and knocks "," out of the arena out of frustration that they stopped Ridley from being the one to KO Samus.",df  );
      }
    }
  } else if(fn==66) {
    story.add("Simon trades his controller for the original atari controller, mapping the only button to special");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==67) {
    story.add("Richter trades his controller for the original atari controller, mapping the only button to special");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else if(fn==68) {
    story.add("King K. Rool puts his kaptain hat on and sails to Tortimor island to look for treasure.");
    itemFind(f);
    itemFind(f);
    itemFind(f);
    f.buffs.add(new statModifier(1,0.7,0.7,10,1));
  } else if(fn==69) {
    rErandomKill(f,"Isabelled planted a Lloid rocket earlier which "," stepped on, taking them to the stratosphere(out of the arena)");
  } else if(fn==70) {
    story.add("A tree was about to fall on Incineroar but he used down b just in time, giving him a revenge boost");
    f.buffs.add(new statModifier(1.7,1,1,1,1));
  } else if(fn==71) {
    story.add("Piranha plant fully charges his side b");
    f.buffs.add(new statModifier(1.5,1,1,1,10));
  } else if(fn==72) {
    story.add("A tree was about to fall on Joker but he used down b, just in time, giving him Arsene");
    f.buffs.add(new statModifier(1.7,1,1,1,1));
  } else if(fn==73) {
    story.add("Hero charges neutral b as well as cast Oomph and Psych up");
    f.buffs.add(new statModifier(1.6,1,1,1,10));
  } else if(fn==74) {
    story.add("Banjo & Kazooie finds 5 more golden feathers");
    f.buffs.add(new statModifier(1.5,1,1,2,10));
  } else if(fn==75) {
    story.add("A tree falls on Terry and he barely lives at exatly 100.0%, giving him Go!");
    f.buffs.add(new statModifier(1.4,1,1,10,10));
  } else ;
}


void rErandomKill(fighter f, String sb, String sa) {
  fighter rf = fighters.get((int)random(fighters.size()));
  if(rf == f) rErandomKill(f,sb,sa);
  else {
    String s = sb+rf.name+sa+"\n"+f.name+" claims all of "+rf.name+"'s spirits and the "+deathSpirits[rf.ogFighterNum]+" spirit!";
    if(rf.numLives>0) {rf.resurrect(); s+=" However, "+rf.name+" came back!";}
    else {
      s+="\n"+(fighters.size()-1)+" fighters remain.";
      f.numKills++;
      if(rf.name.equals("Samus")) f.isSamusKiller = true;
      lastWinner = f;
      fighters.remove(rf.fighterNum);
      podium.add(rf);
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(rf==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = rf.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
    story.add(s);
    f.buffs.add(spirits[deathSpiritNums[rf.ogFighterNum]].clone());
    f.numSpecialFlags+=rf.numSpecialFlags;f.numPokeBalls+=rf.numPokeBalls;f.numMasterBalls+=rf.numMasterBalls;f.numItems+=rf.numItems;
    if(rf.numSpecialFlags>0) {story.add("\nA voice booms throughout the arena \""+f.name+" HAS OBTAINED A SPECIAL FLAG!\"");f.buffs.add(new statModifier(1,1,20,10,1));}
    for(statModifier buff: rf.buffs) f.buffs.add(buff); for(String assistor: rf.assistors) f.assistors.add(assistor);
  }
}
void wolfGimp(fighter f, String sb, String sa, fighter rf) {
    String s = sb+rf.name+sa+"\n"+f.name+" claims all of "+rf.name+"'s spirits and the "+deathSpirits[rf.ogFighterNum]+" spirit!";
    if(rf.numLives>0) {rf.resurrect(); s+=" However, "+rf.name+" came back!";}
    else {
      s+="\n"+(fighters.size()-1)+" fighters remain.";
      f.numKills++;
      if(rf.name.equals("Samus")) f.isSamusKiller = true;
      lastWinner = f;
      fighters.remove(rf.fighterNum);
      podium.add(rf);
      if(state == regular) {findChance-=2; rareChance++; battleChance++;}
      for(int i = 0; i<cornFighters.size(); i++) if(rf==cornFighters.get(i)) {cornFighters.remove(i); break;}
      for(int i = rf.fighterNum; i<fighters.size(); i++) fighters.get(i).fighterNum--;
    }
    story.add(s);
    f.buffs.add(spirits[deathSpiritNums[rf.ogFighterNum]].clone());
    f.numSpecialFlags+=rf.numSpecialFlags;f.numPokeBalls+=rf.numPokeBalls;f.numMasterBalls+=rf.numMasterBalls;f.numItems+=rf.numItems;
    if(rf.numSpecialFlags>0) {story.add("\nA voice booms throughout the arena \""+f.name+" HAS OBTAINED A SPECIAL FLAG!\"");f.buffs.add(new statModifier(1,1,20,10,1));}
    for(statModifier buff: rf.buffs) f.buffs.add(buff); for(String assistor: rf.assistors) f.assistors.add(assistor);
}
