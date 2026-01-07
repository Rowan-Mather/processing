int generationRate = 3000;

int x = 450;
int y = 450;

int direction;
float topPos = sqrt(sq(900)-sq((900/2)));
int baseY = 850;

void setup() {
  size(900, 900);
  background(0);
  fill(0);
  //triangle(0, baseY, width, baseY, width/2, baseY-topPos);
  stroke(255);
  fill(0, 255, 0);
}


void draw() {}

void keyPressed() {
  for (int i = 0; i < generationRate; i++) {
    direction = int(random(1, 6));
    placer();
  }
}

void placer() {
  if (direction == 1) {
    point((450+x)/2, y/2);
    x = (450+x)/2;
    y = y/2;
  }
  if (direction == 2) {
    point(x/2, (y+365/2));
    x = x/2;
    y = (y+365)/2;
  }
  if (direction == 3) {
    point((x+900)/2, (y+365)/2);
    x = (x+900)/2;
    y = (y+365)/2;
  }
  if (direction == 4) {
    point((x+107)/2, (y+900)/2);
    x = (x+107)/2;
    y = (y+900)/2;
  }  
  if (direction == 5) {
    point((x+793)/2, (y+900)/2);
    x = (x+793)/2;
    y = (y+900)/2;
  }
}