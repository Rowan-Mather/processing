int unit = 10;
String direction = "right";

//right up left down

void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  //rectMode(CENTER);
  noFill();
  float x = 3*width/4;
  float y = 3*height/4;
  for (int i = 1; i < 6; i++) {
    rect(x, y, unit*i, unit*i);
    if (direction == "left") {
      x -= unit*i;
      direction = "down";
    } else {
      if (direction == "down") {
        y += unit*i;
      } else {
        if (direction == "right") {
          x += unit*i;
          direction = "up";
        } else {
          if (direction == "up") {
            x -= unit*i;
            y -= unit*i;
            direction = "left";
          } else {
            if (direction == "left") {
              x -= unit*i;
              direction = "down";
            }
          }
        }
      }
    }
  }
}