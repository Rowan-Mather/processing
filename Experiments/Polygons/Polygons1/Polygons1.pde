int poiX = 450;
int poiY = 450;
void setup() {
  size(900,900);
}

//(PI*sq(r))/4
void draw() {
  translate(551,-140);
  rotate(7.23);
  stroke(0);
  polygon(width/2, height/2, 472, 5);
  stroke(255,0,0);
  ellipse(poiX,poiY,5,5);
  
}

void polygon(float x, float y, float radius, int sides) {
  float angle = TWO_PI / sides;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void keyPressed() {
  /*if (key == 'a') {
    poiX--;
  }
  if (key == 'd') {
    poiX++;
  }
  if (key == 's') {
    poiY++;
  }
  if (key == 'w') {
    poiY--;
  }*/
  println(mouseX, mouseY);
}