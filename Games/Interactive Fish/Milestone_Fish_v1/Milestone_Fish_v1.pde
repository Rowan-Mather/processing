//fish size
float fishSize = 1;
//fish position
int fishX = 500;
int fishY = 400;
//tail
float tailOrigin = fishX+fishSize*25;
int fishTailUp = 180;
int fishTailDown = 180;
//food
float foodX = 1;
float foodY = 1;
boolean food = false;
//colour
String fishMode = "Goldfish";
//auto moving
boolean find = false;
String idk = "RIGHT";

void setup() {
  size(1000, 800);
}

void draw() {
  //draw setup
  background(153, 238, 255);
  fill(255, 160, 0);
  tailOrigin = fishX+fishSize*25;

  //tail
  if (fishMode == "Goldfish") {
    stroke(245, 150, 0);
  }
  if (fishMode == "Rainbowfish") {
    stroke(0,0,255);
  }
  noFill();
  strokeWeight(1);

  for (int i = 0; i < 350; i += 20) {
    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailUp-fishSize*2, fishX+fishSize*40, fishTailUp-fishSize*2, fishX+fishSize*45, fishTailUp+fishSize*3);
    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailUp+fishSize*2, fishX+fishSize*40, fishTailUp+fishSize*2, fishX+fishSize*45, fishTailUp-fishSize*3);

    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailDown-fishSize*2, fishX+fishSize*40, fishTailDown-fishSize*2, fishX+fishSize*45, fishTailDown+fishSize*4);
    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailDown+fishSize*2, fishX+fishSize*40, fishTailDown+fishSize*2, fishX+fishSize*45, fishTailDown-fishSize*3);

    fishTailUp -= fishSize;
    fishTailDown += fishSize;
    //bezier(mouseX-(i/2), 40+i, 410, 20, 440, 300, 240-(i/16), 300+(i/8));
  }

  fishTailUp = fishY;
  fishTailDown = fishY;

  //main body
  if (fishMode == "Goldfish") {
    stroke(220, 125, 0);
    fill(245,150,0);
  }
  if (fishMode == "Rainbowfish") {
    stroke(0,210,0);
    fill(0,235,10);
  }
  strokeWeight(3);
  ellipse(fishX, fishY, fishSize*50, fishSize*30);
  
  //mouth
  if (fishMode == "Goldfish") {
    stroke(215, 120, 0);
    fill(235, 140, 0);
  }
  if (fishMode == "Rainbowfish") {
    stroke(200,120,0);
    fill(255,0,0);
  }
  ellipse(fishX-22.5*fishSize, fishY, 4*fishSize, 5*fishSize);

  //eye
  if (fishMode == "Goldfish") {
    stroke(200,120,0);
    fill(255);
  }
  if (fishMode == "Rainbowfish") {
    stroke(200,120,0);
    fill(255);
  }
  ellipse(fishX-12*fishSize, fishY, 7*fishSize, 7*fishSize);
  fill(0);
  stroke(0);
  ellipse(fishX-12*fishSize, fishY, 2*fishSize, 2*fishSize);
  
  //fins
  if ((fishSize > 1) || (fishSize < -1)) {
   if (fishMode == "Goldfish") {
      stroke(220, 125, 0);
    }
    if (fishMode == "Rainbowfish") {
      stroke(255,0,0);
    }
    //top fin
    strokeWeight(1);
    noFill();
    float fin1 = fishSize*10;

    for (int i = 0; i < fishSize*10; i += 5) {
      bezier(fishX, fishY-fishSize*15, fishX+5*fishSize, fishY-fishSize*20+fin1/2, fishX+15*fishSize, fishY-fishSize*24+fin1, fishX+20*fishSize+fin1/fishSize, fishY-fishSize*20+fin1);
      fin1 -= 6;
    }

    //bottom fin
    float fin2 = fishSize*10;

    for (int i = 0; i < fishSize*10; i += 5) {
      bezier(fishX, fishY+fishSize*15, fishX+5*fishSize, fishY+fishSize*20+fin2/2, fishX+15*fishSize, fishY+fishSize*24+fin2, fishX+20*fishSize+fin2/fishSize, fishY+fishSize*20+fin2);
      fin2 -= 6;
    }
  }
  
  //seaweed
  fill(0,255,0);
  noStroke();
  bezier(100,height,130,750,90,710,110,700);

  //food
  if (food == true) {
    fill(255);
    stroke(255);
    ellipse(foodX, foodY, 10, 10);
    foodY += 1;
    foodY = constrain(foodY, 0, 792);
  }

  //eating
  eat();

  //auto moving
  if (find == true) {
    move();
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    fishX -= 3;
  }

  if (keyCode == RIGHT) {
    fishX += 3;
  }

  if (keyCode == UP) {
    fishY -= 3;
  }

  if (keyCode == DOWN) {
    fishY += 3;
  }

  if (key == 'f') {
    foodX = random(1000);
    foodY = random(400);
    food = true;
  }

  if ((key == 't') && (find == false)) {
    println("Auto-find: On");
    find = true;
    delay(1);
  } else {
    println("Auto-find: Off");
    find = false;
    delay(1);
  }
  
  if (key == 's') {
    fishSize -= 0.5;
  }  
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    foodX = mouseX;
    foodY = mouseY;
    food = true;
  }
  
  if (mouseButton == LEFT) {
    foodX = random(1000);
    foodY = random(400);
    food = true;
  }
}

void eat() {
  if (((fishX == foodX) || ((fishX < foodX) && (fishX > foodX-28*fishSize)) || ((fishX > foodX) && (fishX < foodX+28*fishSize))) && (food == true)) {
    if ((fishY == foodY) || ((fishY < foodY) && (fishY > foodY-12*fishSize)) || ((fishY > foodY) && (fishY < foodY+12*fishSize))) {
      food = false;
      fishSize += 0.5;
      println(fishSize);
    }
  }
}

void move() {
  if (food == true) {
    if (fishX < foodX) {
      fishX ++;
    }

    if (fishX > foodX) {
      fishX --;
    }

    if (fishY < foodY) {
      fishY ++;
    }

    if (fishY > foodY) {
      fishY --;
    }
  } else {
    if (idk == "LEFT") {
      fishX--;
      if (fishX < 0 + 25*fishSize) {
        idk = "RIGHT";
      }
    } else {
      fishX++;
      if (fishX > width - 25*fishSize) {
        idk = "LEFT";
      }
    }
  }
}