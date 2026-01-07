// Sierpinski's Carpet //<>//
int lvl = 2;
int size = 900;
int row = 1;
int column = 1;
int blocks = 0;

void setup() {
  size(900, 900);
}

void draw() {
  rectMode(CENTER);
    rect(width/2, height/2, size/3, size/3);
  sierpinski8();

  rect(width/2, height/2, size/2, size/3);
}

void sierpinski8() {
  for (blocks = 1; blocks < 99; blocks += 9) {
    size = size/blocks;
    for (row = 1; row < 6; row += 2) {
      for (column = 1; column < 6; column += 2) {
        rect(size/6*column, size/6*row, size/9, size/9);
      }
    }
  }
}