// Sierpinski's Carpet v2
int lvl = 2;
int size = 900;
int row = 1;
int column = 1;
int blocks = 0;
int turtleX = 0;
int turtleY = 0;

void setup() {
  size(900, 900);
}

void draw() {
  rectMode(CENTER);
  sierpinski8();
  lvl++;

  //rect(width/2, height/2, size/3, size/3);
}

void sierpinski8() {
  for (int i = 0; i < width; i += width/6) {
    for (int j = 0; j < height; j += height/6) {
      rect(i*2,j*2,30, 30);
    }
  }
}