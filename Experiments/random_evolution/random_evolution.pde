/*
int s = 500;
 int no = 8000;
 int[] dots = {};
 
 void setup() {
 size(500,500);
 background(0);
 frameRate(10);
 for (int i = 0; i<no; i++){
 dots = append(dots,int(random(s)));
 }
 }
 
 void draw() {
 stroke(255);
 background(0);
 for (int i = 0; i<dots.length; i+=2){
 point(dots[i],dots[i+1]);
 int rand1 = int(random(-23,23));
 if (rand1<0) {
 rand1 = int(pow(rand1,2))*-1;
 } else {
 rand1 = int(pow(rand1,2));
 }
 int rand2 = int(random(-23,23));
 if (rand2<0) {
 rand2 = int(pow(rand2,2))*-1;
 } else {
 rand2 = int(pow(rand2,2));
 }
 
 dots[i] = mouseX+rand1;
 dots[i+1] = mouseY+rand2;
 
 }
 }
 */
/*
void setup() {
 size(500,500);
 background(0);
 frameRate(10);
 stroke(255);
 }
 
 void draw() {
 background(0);  
 for (int i = 0; i < 8000; i++) {
 int rand1 = int(pow(random(-5,5),random(3)));
 int rand2 = int(pow(random(-5,5),random(3)));
 point(mouseX+rand1,mouseY+rand2);
 }
 }*/
/*
void setup() {
 size(500,500);
 background(100,100,100);
 frameRate(10);
 stroke(255);
 }
 
 void draw() {
 background(0); 
 for (int i = 0; i < 8000; i++) {
 int rand1 = int(pow(random(5),random(4)));
 point(i/16,rand1);
 }
 }
 */

boolean running = true;
int dist = 1;
int col = 100;
void setup() {
  size(500, 500);
  background(0);
  frameRate(40);
  colorMode(HSB,100);
  stroke(0);
}

void draw() {
  if (running) {
    float angle = 0;
    pushMatrix();
    translate(mouseX, mouseY);
    while (angle != 361) {
      point(0, dist);
      rotate(0.5);
      angle+=0.5;
    }
    popMatrix();
    dist++;
    stroke(col);
    col++;
    if (col>100) {col = 0;}
  }
}

void mouseClicked() {
  dist = 0;
  col = 0;
}

void keyPressed() {
  if (key == 'x') {
    running = false;
  } else if (key == 's') {
    save("C:/Users/rowan/Documents/Rowan/Coding/Processing/Tests/CirclesSave3.png");
  } else {
    running = true;
  }
}