/*
variables
 setup
 background colour change
 seaweed
 call eat function
 key triggers
 mouse triggers
 draw fish
 eat 
 move
 */

/* To Do
 seaweed
 unlimeted food at once
 fish going up + down, left + right random in track mode
 limited size /
 bottom fin facing right /
 food cashing system?
 
 */

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
float fishFin = 1;
boolean food = false;
//auto moving
boolean find = false;
String facing = "LEFT";
boolean delayFind = false;
//speed
int fSpeed = 10;

int backgroundCol = 950;
boolean contCol = true;

void setup() {
  size(1000, 800);
}

void draw() {
  fishFin = sqrt(sq(fishSize));
  delayFind = true;
  //maximum size
  constrain(fishSize, 1, 20);

  colorMode(HSB, 2000, 10, 10);
  if (contCol == true) {
    backgroundCol += 1;
  }
  if (contCol == false) {
    backgroundCol -= 1;
  }
  if (backgroundCol == 1150) {
    contCol = false;
  }
  if (backgroundCol == 950) {
    contCol = true;
  }

  //draw setup
  background(backgroundCol, 100, 100);
 
  if (fishSize > 8) {
    fishSize = 8;
  }
  if ((fishSize < 1) && (fishSize > 0)) {
    fishSize = 1;
  }
  if ((fishSize > -1) && (fishSize < 0)) {
    fishSize = -1;
  }
  if (fishSize < -8) {
    fishSize = -8;
  }
  
  fishX = constrain(fishX, 0, width);
  fishY = constrain(fishY, 0, height);
  drawFish();

  //seaweed
  fill(0, 255, 0);
  noStroke();
  //bezier(100, height, 130, height-250, 90, height-290, 110, height-300);
  //bezier(170, height, 200, height-300, 150, height-370, 180, height-400);

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
    fishX -= fSpeed;
    if (facing == "RIGHT") {
      facing = "LEFT";
      fishSize = fishSize*-1;
    }
  }
  if (keyCode == RIGHT) {
    fishX += fSpeed;
    if (facing == "LEFT") {
      facing = "RIGHT";
      fishSize = fishSize*-1;
    }
  }
  if (keyCode == UP) {
    fishY -= fSpeed;
  }
  if (keyCode == DOWN) {
    fishY += fSpeed;
  }
  if (key == 'f') {
    if (food == false) {
      foodX = random(1000);
      foodY = random(400);
      food = true;
    } else {
      println("Only one piece of food at a time, you'll confuse the poor fish!");
    }
  }
  if ((key == 't') && (find == false)&& (delayFind == true)) {
    println("Auto-find: On");
    find = true;
    delayFind = false;
  } 

  if ((key == 't') && (find == true) && (delayFind == true)) {
    println("Auto-find: Off");
    find = false;
    delayFind = false;
  }

  if (key == 's') {
    fishSize -= 0.5;
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    if (food == false) {
      foodX = mouseX;
      foodY = mouseY;
      food = true;
    } else {
      println("Only one piece of food at a time, you'll confuse the poor fish!");
    }
  }

  if (mouseButton == LEFT) {
    if (food == false) {
      foodX = random(1000);
      foodY = random(400);
      food = true;
    } else {
      println("Only one piece of food at a time, you'll confuse the poor fish!");
    }
  }
}

void drawFish() {
  colorMode(RGB, 255, 255, 255);
  fill(255, 160, 0);
  tailOrigin = fishX+fishSize*25;

  //tail
  stroke(245, 150, 0);
  noFill();
  strokeWeight(1);
  for (int i = 0; i < 350; i += 20) {
    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailUp-fishSize*2, fishX+fishSize*40, fishTailUp-fishSize*2, fishX+fishSize*45, fishTailUp+fishSize*3);
    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailUp+fishSize*2, fishX+fishSize*40, fishTailUp+fishSize*2, fishX+fishSize*45, fishTailUp-fishSize*3);
    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailDown-fishSize*2, fishX+fishSize*40, fishTailDown-fishSize*2, fishX+fishSize*45, fishTailDown+fishSize*4);
    bezier(tailOrigin, fishY, fishX+fishSize*35, fishTailDown+fishSize*2, fishX+fishSize*40, fishTailDown+fishSize*2, fishX+fishSize*45, fishTailDown-fishSize*3);
    fishTailUp -= fishSize;
    fishTailDown += fishSize;
  }
  fishTailUp = fishY;
  fishTailDown = fishY;

  //main body
  stroke(220, 125, 0);
  fill(245, 150, 0);
  strokeWeight(3);
  ellipse(fishX, fishY, fishSize*50, fishSize*30);

  //mouth
  stroke(215, 120, 0);
  fill(235, 140, 0);
  ellipse(fishX-22.5*fishSize, fishY, 4*fishSize, 5*fishSize);

  //eye
  stroke(200, 120, 0);
  fill(255);
  ellipse(fishX-12*fishSize, fishY, 7*fishSize, 7*fishSize);
  fill(0);
  stroke(0);
  ellipse(fishX-12*fishSize, fishY, 2*fishSize, 2*fishSize);

  //fins
  if ((fishSize != 1) && (fishSize != -1)) {
    stroke(220, 125, 0);
    //top fin
    strokeWeight(1);
    noFill();
    float fin1 = fishFin*10;
    for (int i = 0; i < fishFin*10; i += 5) {
      if (facing == "LEFT") {
        bezier(fishX, fishY-fishSize*15, fishX+5*fishSize, fishY-fishSize*20+fin1/2, fishX+15*fishSize, fishY-fishSize*24+fin1, fishX+20*fishSize+fin1/fishSize, fishY-fishSize*20+fin1);
      } else {
        bezier(fishX, fishY-fishFin*15, fishX-5*fishFin, fishY-fishFin*20+fin1/2, fishX-15*fishFin, fishY-fishFin*24+fin1, fishX-(20*fishFin+fin1/fishFin), fishY-fishFin*20+fin1);
      }
      fin1 -= 6;
    }

    //bottom fin
    float fin2 = fishFin*10;
    for (int i = 0; i < fishFin*10; i += 5) {
      if (facing == "LEFT") {
        bezier(fishX, fishY+fishSize*15, fishX+5*fishSize, fishY+fishSize*20+fin2/2, fishX+15*fishSize, fishY+fishSize*24+fin2, fishX+20*fishSize+fin2/fishSize, fishY+fishSize*20+fin2);
      } else {
        bezier(fishX, fishY+fishFin*15, fishX-5*fishFin, fishY+fishFin*20+fin2/2, fishX-15*fishFin, fishY+fishFin*24+fin2, fishX-20*fishFin-fin2/fishFin, fishY+fishFin*20+fin2);
      }
      fin2 -= 6;
    }
  }
}

void eat() {
  if (((fishX == foodX) || ((fishX < foodX) && (fishX > foodX-28*fishFin)) || ((fishX > foodX) && (fishX < foodX+28*fishFin))) && (food == true)) {
    if ((fishY == foodY) || ((fishY < foodY) && (fishY > foodY-12*fishFin)) || ((fishY > foodY) && (fishY < foodY+12*fishFin))) {
      food = false;
      if (fishSize > 0.5) {
        fishSize += 0.5;
      } else {
        fishSize -= 0.5;
      }
      println(fishSize);
    }
  }
}

void move() {
  if (food == true) {
    if (fishX < foodX) {
      fishX += 2;
      if (facing == "LEFT") {
        facing = "RIGHT";
        direction();
      }
    }
    if (fishX > foodX) {
      fishX -= 2;
      if (facing == "RIGHT") {
        facing = "LEFT";
        direction();
      }
    }
    if (fishY < foodY) {
      fishY += 2;
    }
    if (fishY > foodY) {
      fishY -= 2;
    }
  } else {
    if (facing == "LEFT") {
      fishX -= 2;
      facing = "LEFT";
      direction();
      if (fishX < 0 + 25*fishFin) {
        facing = "RIGHT";
      }
    } else {
      fishX += 2;
      facing = "RIGHT";
      direction();
      if (fishX > width - 25*fishFin) {
        facing = "LEFT";
      }
    }
  }
}

void direction () {
  if (facing == "LEFT") {
    fishSize = sqrt(sq(fishSize));
  }
  if (facing == "RIGHT") {
    fishSize = sqrt(sq(fishSize))*-1;
  }
}