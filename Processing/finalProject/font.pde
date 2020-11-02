PImage[] fontLetters;
char a = 'a';
int numLettersInAlphabet = 26;
void initFont() {
  fontLetters = new PImage[32];
  for (int i = a; i<a+numLettersInAlphabet; i++) { //ascii values for every lower case letter in the alphabet
    fontLetters[i-a] = loadImage((char)i+".png");
  }
  //initializing non-letter parts of the font
  fontLetters[numLettersInAlphabet+0] = loadImage(" .png"); //space
  fontLetters[numLettersInAlphabet+1] = loadImage("(.png"); //open parenthases
  fontLetters[numLettersInAlphabet+2] = loadImage(").png"); //close parenthases
  fontLetters[numLettersInAlphabet+3] = loadImage(",.png"); //comma
  fontLetters[numLettersInAlphabet+4] = loadImage("'.png"); //apostrophe
  fontLetters[numLettersInAlphabet+5] = loadImage("2.png"); //2
}
