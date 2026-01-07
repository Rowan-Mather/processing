String sides = "";
boolean drawSetup = true;
int intSides;
boolean drawShape = false;
float sideo2;
float roundsideo2;

void setup() {
  size(600, 600);
  background(0);
  rectMode(CENTER);
}

void draw() {
  if (drawSetup == true) {
    translate(width/2, height/2); //sets 0,0 to center screen
    textSize(32);
    textAlign(CENTER);
    drawSetup = false;
  }
  flake(200,250,80,5);
}

void flake(int pointX, int pointY, int size, int no) {
  float exAng = 360/float(no);
  float turn = exAng;
  stroke(255);

  if (no%2==0) { //tests if it is even 
    for (int i = no; i > 1; i--) {
      pushMatrix();
      translate(pointX, pointY);
      rotate(radians(exAng));
      rect(0, 0, 1, 200);
      popMatrix();
      exAng = exAng + turn;
    }
  } else {
    for (int j = 1; j < no +1; j++) {
      pushMatrix();
      translate(pointX, pointY);
      rotate(radians(exAng*j));
      rect(0, -50, 1, 100);
      popMatrix();
    }
  }
}