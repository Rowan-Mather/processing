float hueRect;
float xPos;
float yPos;
float curve;

void setup(){
  size(600,400);
  background(255);
}

void draw(){
  
}
  
void keyPressed(){ 
  if (key == 'r') {
    hueRect = random(300);
    xPos = random(600);
    yPos = random(400);
    curve = random(20);
    colorMode(HSB,300,100,100);
    stroke(0);
    fill(hueRect,100,100);
    rect(xPos,yPos,20,20,curve);  
  }
  
  if (key == 'h') {
    colorMode(HSB,600,100,100);
    for (int i = 0; i < 600; i = i+1) {
      stroke(i,100,100);
      line(i,0,i,400);
    }
  }
  
  if (key == 'c') {
    colorMode(HSB,100,100,100);
    background(100);
  }
}