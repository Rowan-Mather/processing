int nPer = 0;
float x = 0;
float y = 0;

float a = 0;
float b = 0;
float c = 0;
float d = 0;
float f = 0;

void setup() {
  size(1200, 600);
  background(0);
  stroke(255);
}

void draw() {}

void keyPressed() {
  for (int i = 0; i < 1000; i++) {
    nPer = int(random(0, 101));
    if (nPer <= 2) {
      //n = 1  The Stem up untill the largest left-hand leaf
      //stroke(255,0,0);
      a = 0;
      b = 0;
      c = 0;
      d = 0.16;
      f = 0;
    }

    if ((nPer <= 89) && (nPer > 2)) {
      //n = 2  The smaller leaves and stem after the largest left-hand leaf
      //stroke(0,255,0);
      a = 0.85;
      b = 0.04;
      c = -0.04;
      d = 0.85;
      f = 1.6;
    }

    if ((nPer <= 96) && (nPer > 89)) {
      //n = 3  The largest left-hand leaf
      //stroke(0,0,255);
      a = 0.2;
      b = -0.26;
      c = 0.23;
      d = 0.22;
      f = 1.6;
    }

    if ((nPer <= 100) && (nPer > 96)) {
      //n = 4  The largest right-hand leaf
      //stroke(255,0,255);
      a = -0.15;
      b = 0.28;
      c = 0.26;
      d = 0.24;
      f = 0.44;
    }

    x = a*x+b*y;
    y = c*x+d*y+f;
    point(int(y*100+width/12), int(x*100+height/2-50));
    //println(x, " ", y);
  }
}