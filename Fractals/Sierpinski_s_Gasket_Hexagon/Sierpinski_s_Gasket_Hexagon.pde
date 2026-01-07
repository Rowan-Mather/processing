//PImage hexImg;
int generationRate = 1000;
int x = 412;
int y = 412;
void setup() {
  size(824, 824);
  background(0);
  stroke(255);
  //hexImg = loadImage("BlueHexagon.PNG");
  //imageMode(CENTER);
  //image(hexImg,412,412,824,824);
}

void draw() {
}

void keyPressed() {
  for (int i = 0; i < generationRate; i++) {
    placer(int(random(1, 7)));
  }
}

void placer(int direction) {
  if (direction == 1) {
    x = (x+177)/2;
    y = y/2;
  }
  if (direction == 2) {
    x = (x+646)/2;
    y = y/2;
  }
  if (direction == 3) {
    x = (x+824)/2;
    y = (y+355)/2;
  }
  if (direction == 4) {
    x = (x+646)/2;
    y = (y+710)/2;
  }  
  if (direction == 5) {
    x = (x+177)/2;
    y = (y+710)/2;
  }
  if (direction == 6) {
    x = x/2;
    y = (y+355)/2;
  }
  point(x, y);
}