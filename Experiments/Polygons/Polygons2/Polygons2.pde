void setup() {
  size(500, 400);
}

void draw() {
  polygon(250, 200, 5, 50);
}

void polygon(int xPos, int yPos, int sides, int size) {
  float angle = 180 - 360/sides;
  if (sides/2 == int(sides/2)) {
    beginShape();
    vertex(xPos, yPos);
    endShape(CLOSE);
  } else {
    beginShape();
    vertex(xPos, yPos-size);
    for (int i = 0; i < sides; i++) {
      vertex(xPos, yPos-size);
    }  
    endShape(CLOSE);
  }
}