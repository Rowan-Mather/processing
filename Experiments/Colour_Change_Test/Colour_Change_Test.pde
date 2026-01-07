int hue = 0;
    
void setup() {
  size(600,400);
  
}

void draw() {
  colorMode(HSB, 255, 100, 100);
  fill(hue,100,100);
  rect(100,100,200,300);
  hue ++;
  if (hue == 255) {
    delay(1);
    hue = 0;
  }
}

//void keyPressed() {
  //if (key == 'c') {
    //hue ++;
 // }
//}