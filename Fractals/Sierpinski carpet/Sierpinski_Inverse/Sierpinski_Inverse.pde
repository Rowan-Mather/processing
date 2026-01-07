// Sierpinski Carpet v3
int targetLevel = 6;
void setup() {
  size(900, 900);
  rectMode(CENTER);
  background(0);
}

void draw() {
  int level = 1;
  int lvl = 0;
  int size = 900;
  float blocks = 0;
  float row = 0;
  float divisions = 0;
  for (int k = 0; k < targetLevel; k++) {
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
    level++;
  }
}