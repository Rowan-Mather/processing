// Sierpinski Carpet
int level = 1;
int lvl = 0;
float blocks = 0;
float row = 0;
float divisions = 0;
boolean start = false;
int t = 0;
int gradient = 0;
String levelString = "";

void setup() {
  size(900, 900);
  rectMode(CENTER);
  background(0);
}

void draw() {
  int size = width;
  if (start == true) {
    fill(255);
    lvl = level-1;
    rectMode(CENTER);
    blocks = pow(9, lvl);
    row = blocks/pow(3, lvl);
    divisions = row*2;
    for (float j = 1; j < divisions; j += 2) {
      for (float i = 1; i < divisions; i += 2) {
        rect(size/divisions*i, size/divisions*j, size/pow(3, lvl+1), size/pow(3, lvl+1));
      }
    }
    level--;
    if (level < 1) {
      level = 1;
    }
  } else {
    background(0);
    textSize(size/11.25);
    fill(255);
    textAlign(CENTER);
    text("Sierpinski Carpet", size/2, size/2);
    textSize(size/45);
    fill(255);
    text("Program by Rowan Mather", size/2, size/2+50);
    if (floor(millis()/1000) > t+2) {
      if (gradient < 255) {
        gradient += 3;
      } else {
        gradient = 255;
      }
      fill(gradient);
      text("Press a number key to generate a Sierpinski Carpet to that number of levels\n (1-9)", size/2, size/4*3);
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    start = false;
    t = floor(millis()/1000);
  }
  if ((key == '1') || (key == '2') || (key == '3') || (key == '4') || (key == '5') || (key == '6') || (key == '7') || (key == '8') || (key == '9') ||(key == '0')) {
    levelString = levelString + key;
    level = int(levelString);
    levelString = "";
    background(0);
    start = true;
  }
}