void setup() {
  size(600, 800);
  background(255);
}

void draw() {
  //Sets 0,0 to the center of the canvas because I like it like that. You can change it if you want, it makes very little difference
  translate(width/2, height/2);
  stroke(255,0,0);
  polygon(7, 150, 0, 0, "CENTER"); //perameters are the number of sides, the length of the sides, the x position, the y position and the polyMode
  //rotate(radians());
}

void polygon(int sides, int len, int polyX, int polyY, String polyMode) {
  pushMatrix();
  //Finding the exterior angle for the regular polygon
  float tdeg = 360/float(sides);
  //Setting the position of the polygon
  translate(polyX, polyY);
  
  //Just does stuff that took me ages to work out and it's basically rectMode but for the polygon
  if (polyMode == "VERTEX") {
    translate(0,0);
  }
  if (polyMode == "CENTER") {
   float midRad = (len/2)*(tan(radians((180-tdeg)/2))); 
   translate(len/2, midRad);
  }
  
  //Actually drawing it
  line(0, 0, -len, 0);
  for (int i = sides-1; i > 0; i--) {
    translate(-len, 0);
    rotate(radians(tdeg));
    line(0, 0, -len, 0);
  }
  popMatrix();
}