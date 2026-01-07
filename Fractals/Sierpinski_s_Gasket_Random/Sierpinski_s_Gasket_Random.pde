int generationRate = 3000;

int x = 450;
int y = 450;

int direction;
float topPos = sqrt(sq(900)-sq((900/2)));
int baseY = 850;

void setup() {
  size(900, 900);
  background(0);
  triangle(0, baseY, width, baseY, width/2, baseY-topPos);
  stroke(0);
  fill(0, 255, 0);
}


void draw() {}

void keyPressed() {
  for (int i = 0; i < generationRate; i++) {
    direction = int(random(1, 4));
    placer();
  }
}

void placer() {
  if (direction == 1) {
    point(x/2, (baseY+y)/2);
    x = x/2;
    y = (baseY+y)/2;
  }
  if (direction == 2) {
    point((x+width)/2, (y+baseY)/2);
    x = (x+width)/2;
    y = (y+baseY)/2;
  }
  if (direction == 3) {
    point((x+width/2)/2, (y+(baseY-topPos))/2);
    x = (x+width/2)/2;
    y = int((y+(baseY-topPos))/2);
  }
}