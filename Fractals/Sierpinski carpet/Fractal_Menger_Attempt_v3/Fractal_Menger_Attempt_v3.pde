// Sierpinski Carpet v3
int level = 1;
int lvl = 0;
int size = 900;
int turtleX = 0;
int turtleY = 0;
float blocks = 0;
float row = 0;
float divisions = 0;
int across = 1;

void setup() {
  size(900, 900);
  rectMode(CENTER);
}

void draw() {
  lvl = level-1;
  rectMode(CENTER);
  blocks = pow(9, lvl);
  row = blocks/pow(3, lvl);
  divisions = row*2;
  for (float i = 1; i < divisions; i += 2) {
  rect(size/divisions*i, size/divisions*1, size/pow(3, lvl+1), size/pow(3, lvl+1));
  }
  level++;
}