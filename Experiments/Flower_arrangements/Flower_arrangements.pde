float value = 2;
void setup() {
  background(0);
  size(800, 800);
  stroke(255);
  colorMode(HSB,400);
  frameRate(15);
}

void draw() {
  translate(400, 400);
  background(0);
  value += 0.001;
  text(str(value),330,-350);
  float deg = 360/value;
  float dis = 2;
  float rota = 0;
  int hue = 0;
  
  ellipse(0, 0, 10, 10);
  for (int i=0; i<500; i++) {
    hue += 1;
    rotate(radians(deg));
    rota += deg;
    fill(hue,400,400);
    ellipse(dis, 0, 10, 10);
    if (rota > 360) {
      dis += 5;
      rota = 360-rota;
    }
  }
}