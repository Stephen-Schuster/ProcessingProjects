ArrayList<ArrayList<String>> lines; //several lines may be displayed at one
int currentParagraph;
float letterHeight = 1.0/12;

void initLines() {
  currentParagraph = 0;
  String[] lyrics = loadStrings("lyrics.txt");
  lines = new ArrayList<ArrayList<String>>();
  lines.add(new ArrayList<String>());
  for (int i = 0; i<lyrics.length; i++) {
    if (lyrics[i].length() ==0) {
      lines.add(new ArrayList<String>());
    } else {
      lines.get(lines.size()-1).add(lyrics[i]);
    }
  }
}

void lines() { // right 2/3 of the screen is for lyrics
  if (timePassed>lineStartTimes[currentParagraph+1]) currentParagraph++;
  for (int i = 0; i<lines.get(currentParagraph).size(); i++) {
    int margin;
    if (currentParagraph%2 == 0) margin = width/3;
    else margin = 0;
    if (currentParagraph == 2) margin = width/2;
    drawLine(lines.get(currentParagraph).get(i), i, margin, height/3);
  }
}

void drawLine(String line, int lineNumber, int x, int y) {
  line = unCapitalize(line);
  float pos = x;
  for (int i = 0; i<line.length(); i++) {
    PImage letter;
    if (a<=(int)line.charAt(i) && (int)line.charAt(i)<a+numLettersInAlphabet) {
      letter = fontLetters[line.charAt(i)-a];
    } else if (line.charAt(i) == ' ') {
      letter = fontLetters[numLettersInAlphabet+0];
    } else if (line.charAt(i) == '(') {
      letter = fontLetters[numLettersInAlphabet+1];
    } else if (line.charAt(i) == ')') {
      letter = fontLetters[numLettersInAlphabet+2];
    } else if (line.charAt(i) == ',') {
      letter = fontLetters[numLettersInAlphabet+3];
    } else if (line.charAt(i) == '2') {
      letter = fontLetters[numLettersInAlphabet+5];
    } else {// otherwise it should it be an apostrophe
      letter = fontLetters[numLettersInAlphabet+4];
    }
    float letterWidth =letter.width*width/2940;
    image(letter, pos, y+letterHeight*lineNumber*height, letterWidth, letterHeight*height);
    pos+=letterWidth;
  }
}

String unCapitalize(String str) {
  String newstr = "";
  while (str.length()>0) {
    if ('A'<=str.charAt(0) && str.charAt(0)<='Z') newstr+=(char)(str.charAt(0)+(a-'A'));
    else newstr+=str.charAt(0);
    str = str.substring(1);
  }
  return newstr;
}
