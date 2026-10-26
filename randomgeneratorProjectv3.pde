int x;
int y;
int a;
int b;
boolean ApplicationStart = false;
boolean clicked = false;
boolean AppearText = false;
boolean ButtonCursorDisabler = false;
String xtext = "";
String ytext = "";
boolean gotNumber = false;
boolean StrokeX = false;
boolean StrokeY = false;
int activeField;
int result;
boolean RandomGeneratorException = false;
boolean RandomGeneratorSuccess = false;


void setup() {
  size(500,500);
 surface.setTitle("Random Number Generator");
}

void draw() {
 background(255,255,255);
startButton();
ButtonClicked();
TextStuffCrap();
if(RandomGeneratorSuccess == true) {
  fill(0,0,0);
rect(110, 280, 270, 90);
  fill(255, 233, 0);
rect(120, 290, 250, 70);
fill(255,0,0);
textSize(64);
text(result, 145, 340);

RandomGeneratorException = false;
}
if(RandomGeneratorException == true) {
  fill(255,0,0);
  text("words arent numbers silly", 120, 300);
  RandomGeneratorSuccess = false;
}
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
text("Fill out the values to generate a number between them", 30, 80);
fill(0,0,0);
text("X: " + xtext, 30, 120);
text("Y: " + ytext, 30, 160);

if(StrokeX == true) {
noFill();
strokeWeight(9);
stroke(255,0,0);
rect(20,100,100,30);

noStroke();
fill(125,125,125);
rect(20,140,100,30);

fill(0);
text("X: " + xtext, 30, 120);
text("Y: " + ytext, 30, 160);
}

if(StrokeY == true) {
  noFill();
strokeWeight(5);
stroke(255,0,0);
rect(20,140,100,30);

noStroke();
fill(125,125,125);
rect(20,100,100,30);

fill(0);
text("X: " + xtext, 30, 120);
text("Y: " + ytext, 30, 160);

} else { 
 fill(125,125,125);
rect(20, 100, 100, 30);
rect(20, 140, 100, 30);
fill(255,255,255);
fill(0,0,0);
text("X: " + xtext, 30, 120);
text("Y: " + ytext, 30, 160);
}
  }
}


   int randomNumberGenerator(int x, int y) {
 return int(random(x, y +1));
}
   


void mouseClicked() {    
  if(AppearText == false) {
    if(dist(mouseX, mouseY, 250,250) < 135) {
clicked = true;
  } 
  }
else {
  //X Box
  if(mouseX > 20 && mouseX < 120 && mouseY > 100 && mouseY < 130) {
    StrokeX = true;
    StrokeY = false;
        activeField = 1;

  }
  else if(mouseX > 20 && mouseX < 120 && mouseY > 140 && mouseY < 170) {
        StrokeX = false;
    StrokeY = true;
        activeField = 2;

  }
  else {
    StrokeX = false;
    StrokeY = false;
    activeField = 0;
  }
}
}






 void mouseMoved() {
   if(ButtonCursorDisabler == false) {
   if(dist(mouseX, mouseY, 250, 250) < 135) {
     cursor(HAND);
   }
   else { 
     cursor(ARROW);
   }
 }
 
 if(mouseX > 20 && mouseX < 120 && mouseY > 100 && mouseY < 130) {
   cursor(TEXT);
 }
 else if (mouseX > 20 && mouseX < 120 && mouseY > 140 && mouseY < 170) {
   cursor(TEXT);
 }
 else {
 }
 }
 
 
 
 
 
 
 
 void keyTyped() {
if(AppearText == true) {
  
  if(key == BACKSPACE) {
  if (activeField == 1 && xtext.length() > 0) {
      xtext = xtext.substring(0, xtext.length() - 1); 
  }
   if (activeField == 2 && ytext.length() > 0) {
      ytext = ytext.substring(0, ytext.length() - 1);
  }
  }
  else if (key == '\n') {
    if(xtext.length() > 0 && ytext.length() > 0 ) {
      try {
int a = Integer.parseInt(xtext);
int b = Integer.parseInt(ytext);
  if(a > b) {
  int switchy = a;
  a = b;
  b = switchy;
  }
  
        result = randomNumberGenerator(a,b);
        gotNumber = true;
        System.out.println(result);
        RandomGeneratorSuccess = true;
      }
      catch (Exception e) {
RandomGeneratorException = true;
      }
      }
      
      
}

  else {
   if(activeField == 1) {
     xtext += key;
  }
  if(activeField == 2) {
    ytext += key;
}
}
 }
 }
 
 
 
