void setup() {
  size(800, 808);
}
spots spot1 = new spots([200, 100, 200], 50, 50, 50);
void draw() {}

class spots {
  IntList colour;
  float x, y, diameter;
  spots(colour,x,y,diameter) {
      fill(colour[0],colour[1],colour[2]);
      stroke(colour[0], colour[1], colour[2]);
      ellipse(x, y, diameter, diameter);
  }
}