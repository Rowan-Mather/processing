//Pacman: Processing Version by Rowan Mather

//how long the program has been running as milliseconds/a number that corresponds to how fast PM eats - animation
int partSeconds = round(millis()/300);
//PM xPos
int x = 325;
//PM yPos
int y = 400;
//PM ellipse height
int h = 40;
//PM ellipse width
int w = h;
//arc values for PM: start open, stop open, start closed, stop closed
int statimes1 = 40;
int stotimes1 = 320;
int statimes2 = 0;
int stotimes2 = 360;
int dots = 20;
//PM speed
int speed = 4;
//PM direction facing
String direction = "RIGHT";
//list of dot pos
int[] pos = new int[dots]; //work on this

void setup() { 
  size(650,800);
}

void keyPressed() {
  //moving controls + direction trigger
  if (keyCode == UP) {
    y -= speed;
    y = constrain(y,0,height);
    direction = "UP";
  }
  
  if (keyCode == DOWN) {
    y += speed;
    y = constrain(y,0,height);
    direction = "DOWN";
  }
  
  if (keyCode == LEFT) {
    x -= speed;
    x = constrain(x,0,width);
    direction = "LEFT";
  }
  
  if (keyCode == RIGHT) {
    x += speed;
    x = constrain(x,0,width);
    direction = "RIGHT";
  }
}


void draw() {
  //drawing the arc of pacman
  background(0,0,0);
  partSeconds = round(millis()/300);
  float start = TAU/360;
  float stop = TAU/360;
  fill(255,255,0);
  
  //direction PM is facing
  if (direction == "RIGHT") {
    statimes1 = 40;
    stotimes1 = 320;
    statimes2 = 0;
    stotimes2 = 360;
    x++;
  }
  
  if (direction == "LEFT") {
    statimes1 = 230;
    stotimes1 = 500;
    statimes2 = 180;
    stotimes2 = 540;
    x--;
  }
  
  if (direction == "UP") {
    statimes1 = 310;
    stotimes1 = 590;
    statimes2 = 270;
    stotimes2 = 631;
    y--;
  }
  
  if (direction == "DOWN") {
    statimes1 = 130;
    stotimes1 = 410;
    statimes2 = 90;
    stotimes2 = 450;
    y++;
  }
  
  //drawing the nom animation
  if(partSeconds%2 == 0) {
    arc(x,y,h,w,start*statimes1,stop*stotimes1,PIE);
  }
  else {
    arc(x,y,h,w,start*statimes2,stop*stotimes2,PIE);
  }
  
  

}