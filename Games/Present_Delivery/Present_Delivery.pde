//les variables
int sleighX = 400;
int presX;
int presY;
boolean pressie_shown;
boolean first_run;
int pressie_run;
int house;
int score;
String score_disp;
String sleigh_direction = "RIGHT";
PImage santa;
PImage santa_left;
PImage chimney;
PImage Gchimney;
PFont homeFont;
PFont defaultF;
int seconds;
String seconds_disp;
int goal = 3;
int previous;
String goal_disp;
int presentColour1;
int presentColour2;
boolean home_screen = true;
int time_extender = 0;

void setup() {
  size(800, 600);
  //loading assets
  santa = loadImage("Santa_guy.png");
  santa_left = loadImage("Santa_guy_left.png");
  chimney = loadImage("Chimney.png");
  Gchimney = loadImage("Green_Chimney.png");
  homeFont = createFont("Monotype Corsiva", 60); 
  defaultF = createFont("Lucinda Grande", 12); 
  //rectangle mode and first chimney position
  rectMode(CENTER);
  house = 5*int(random(10, 150));
}

void draw() {  
  if (home_screen == true) {
    background(10, 10, 150);
    //title screen text
    textFont(homeFont);
    textAlign(CENTER);
    text("Click the santa to start...", 400, 250);
    textAlign(LEFT);
    //title scren santa image
    imageMode(CENTER);
    image(santa, 400, 350, 192, 132);
    imageMode(CORNER);
    textFont(defaultF);
  } else {
    fill(255);
    stroke(0);
    background(10, 10, 150);

    //number displays at the top of the screen during play
    textSize(30);
    score_disp = "Presents Delivered: " + str(score);
    text(score_disp, 30, 50);
    seconds = int(millis()/1000) - previous;
    seconds_disp = "Time: " + str(20 - seconds);
    text(seconds_disp, 350, 50);
    goal_disp = "Target Presents: " + str(goal);
    text(goal_disp, 500, 50);

    //sleigh
    if (sleigh_direction == "RIGHT") {
      image(santa, sleighX, 50, 192, 132);
    } else {
      image(santa_left, sleighX, 50, 192, 132);
    }
    //present dropping sequence
    if (pressie_shown == true) {
      //generating the position and colour of this present - only happens once per sequence
      if (first_run == true) {
        presX = sleighX + 100;
        presY = 150;
        presentColour1 = int(random(100));
        presentColour2 = int(random(100));
        first_run = false;
      }
      //gravity... kinda
      pressie_run += 1;
      presY += int(pressie_run/3);
      //Ending the present sequence and generating a new position for the chimney
      if (presY > 900) {
        pressie_run = 0;
        house = 5*int(random(10, 150));
        pressie_shown = false;
      }
      //drawing the present
      if (((presY > 425) && !((presX > house-40)&&(presX < house+40))) || (presY < 425)) {
        colorMode(HSB, 100);
        strokeWeight(5);
        fill(presentColour1, 100, 100);
        stroke(presentColour2, 100, 100);
        rect(presX, presY, 50, 50);
        line(presX, presY-25, presX, presY+25);
        line(presX-25, presY, presX+25, presY);
        colorMode(RGB, 255);
        strokeWeight(1);
      }
    }

    //scoring + chimney colour
    if ((pressie_run >= 43) && (presX > house-40) && (presX < house+40)) {
      if (pressie_run == 43) {
        score += 1;
      }
      //green chimney
      imageMode(CENTER);
      image(Gchimney, house, 510);
      imageMode(CORNER);
    } else {
      //drawing the standard red chimney
      imageMode(CENTER);
      image(chimney, house, 510);
      imageMode(CORNER);
    }

    //time up
    if (seconds >= 20) {
      time_extender +=1;
      seconds = 20;
      textAlign(CENTER);
      textFont(homeFont);
      //if you've met the goal
      if (score >= goal) {
        fill(0, 255, 0);
        text("Yay! You've won the round!", width/2, height/2);
        if (time_extender == 60) { //giving the text approximately 2 seconds
          //resets round score and time and adds 1 to the round goal
          score = 0;
          goal += 1;
          seconds = int(millis()/1000);
          previous = seconds;
          seconds = int(millis()/1000) - previous;
          time_extender = 0;
        }
        fill(255);
      } else { //if you haven't met the goal
        fill(255, 0, 0);
        text("Sorry, you lose...", width/2, height/2);
        if (time_extender == 60) { //giving the text approximately 2 seconds
          //resets game
          goal = 3;
          score = 0;
          time_extender = 0;
          home_screen = true;
        }
        fill(255);
      }
      textAlign(LEFT);
      textFont(defaultF);
    }
  }
}

void keyPressed() {
  //moves the sleigh
  if (keyCode == RIGHT) {
    sleighX += 5;
    sleigh_direction = "RIGHT";
  }
  if (keyCode == LEFT) {
    sleighX -= 5;
    sleigh_direction = "LEFT";
  }
  //triggers a present to be dropped
  if (key == ' ') {
    pressie_shown = true;
    first_run = true;
  }
}

void mouseClicked() {
  //Starts the game when you click on the area with the santa image
  if ((mouseX >= 315) && (mouseX <=475) && (mouseY >= 290) && (mouseY <= 400) && (home_screen == true)) {
    home_screen = false;
    seconds = int(millis()/1000);
    previous = seconds;
    seconds = int(millis()/1000) - previous;
  }
}