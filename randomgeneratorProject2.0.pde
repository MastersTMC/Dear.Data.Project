boolean ApplicationStart = false;
int x;
int y;
boolean clicked = false;
int screen;
boolean AppearText = false;
boolean ButtonCursorDisabler = false;
String xtext = " ";
String ytext = " ";
boolean gotNumber = false;
boolean typingX = false;
boolean typingY = false;

int randomNumberGenerator(int x, int y) {
 return int(random(x, y +1));
}

void setup() {
  size(500,500);
 surface.setTitle("Random Number Generator");
 background(255,255,255);
}

void draw() {
startButton();
ButtonClicked();
TextStuffCrap();
}



void startButton() {
  fill(128,128,128);
ellipse(250, 250, 300, 300);
fill(255, 0,0);
ellipse(250,250, 270, 270);
fill(255,255,255);
text("Start", 185, 270);
textSize(64); 
}

void ButtonClicked() {
  if(clicked == true) {
 fill(255,255,255);
  noStroke();
 ellipse(250,250,320,320);
 noStroke();
 AppearText = true;
 ButtonCursorDisabler = true;
 cursor(ARROW);

  }
}

void TextStuffCrap() {
  if(AppearText == true) {
fill(125,125,125);
rect(20, 60, 450, 30);
rect(20, 100, 100, 30);
rect(20, 140, 100, 30);

fill(255,255,255);
textSize(16);
text("pick a number between X and Y (click X to write, click Y to write)", 30, 80);
fill(0,0,0);
text("X: " + xtext, 30, 120);
text("Y: " + ytext, 30, 160);

  }
}

void mouseClicked() {
  if(dist(mouseX, mouseY, 250,250) < 135) {
    clicked = true;
  }
}
 void mouseMoved() {
   if(!ButtonCursorDisabler) {
   if(dist(mouseX, mouseY, 250, 250) < 135) {
     cursor(HAND);
   }
   else { 
     cursor(ARROW);
   }
 }
 }
 
 void keyTyped() {
if(AppearText == true) {
  
if(key == 'X') {
  typingX = true;
  typingY = false;
  if(typingX == true) {
  if (key == BACKSPACE && xtext.length() > 0) {
      xtext = xtext.substring(0, xtext.length() - 1);
  } 
   else if (key == '\n') {
    gotNumber = true;
  } 
  else {
    xtext += key;
  }
}
}



if(key == 'Y') {
  typingX = false;
  typingY = true;
  if (key == BACKSPACE && ytext.length() > 0) {
      ytext = ytext.substring(0, ytext.length() - 1);
  } 
   else if (key == '\n') {
    gotNumber = true;
  } 
  else {
    ytext += key;
  }
 }
 }
 }
 
