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
  background(0);
  textAlign(CENTER);
  fill(255);
  text("How many lines?", width/2, height/2);
  text(sides, width/2, height*0.58);
  
  if (drawShape == true) {
    background(0);
    float exAng = 360/float(intSides);
    float turn = exAng;

    sideo2 = float(intSides)/2;
    roundsideo2 = round(sideo2);
    stroke(255);

    if (sideo2 == roundsideo2) { //tests if it is even 
      for (int i = intSides; i > 1; i--) {
        pushMatrix();
        translate(width/2, height/2);
        rotate(radians(exAng));
        rect(0, 0, 1, 200);
        popMatrix();
        exAng = exAng + turn;
      }
    } else {
      for (int j = 1; j < intSides +1; j++) {
        pushMatrix();
        translate(width/2, height/2);
        rotate(radians(exAng*j));
        rect(0, -50, 1, 100);
        popMatrix();
      }
    }
  }
}

void keyPressed() {
  if (key == ENTER) {
    intSides = int(sides);
    drawShape = true;
  }
  if ((key == '1') || (key == '2') || (key == '3') || (key == '4') || (key == '5') || (key == '6') || (key == '7') || (key == '8') || (key == '9') ||(key == '0')) {
    sides = sides + str(key);
  }
  if (key == ' ') {
    background(0);
    sides = "";
    drawShape = false;
    drawSetup = true;
  }
}