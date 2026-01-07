int generationRate = 1000000;
int x = 450;
int y = 450;
void setup() {
  size(900, 900);
  beginShape();
  vertex(450, 16);
  vertex(0, 343);
  vertex(169, 870);
  vertex(725, 870);
  vertex(900, 343);
  endShape(CLOSE);
}

void draw() {
}

void keyPressed() {
  for (int i = 0; i < generationRate; i++) {
    placer(int(random(1, 6)));
  }
}

void placer(int direction) {
  if (direction == 1) {
    point((450+x)/2, (y+16)/2);
    x = (450+x)/2;
    y = (y+16)/2;
  }
  if (direction == 2) {
    point((x+0)/2, (y+343)/2);
    x = (x+0)/2;
    y = (y+343)/2;
  }
  if (direction == 3) {
    point((x+169)/2, (y+870)/2);
    x = (x+169)/2;
    y = (y+870)/2;
  }
  if (direction == 4) {
    point((x+725)/2, (y+870)/2);
    x = (x+725)/2;
    y = (y+870)/2;
  }  
  if (direction == 5) {
    point((x+900)/2, (y+343)/2);
    x = (x+900)/2;
    y = (y+343)/2;
  }
}