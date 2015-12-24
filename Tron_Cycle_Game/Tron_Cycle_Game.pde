//An attempt at a Tron cycle game
void setup() {
  //sets screen size
  size(600, 600);
  //sets background color to be black
  background(0, 0, 0);
}

//bike variables
int px = width/5;
int py = height/2;
int vx = 2;
int vy = 0;
boolean bikeIsVertical = false;

//light trail stuff
PVector[] trail = new PVector[50];

void draw() {
  background(0, 0, 0);
  if (key == 'w') {
    vx = 0;
    vy = -2;
    bikeIsVertical = true;
  } else if (key == 'a') {
    vx = -2;
    vy = 0;
    bikeIsVertical = false;
  } else if (key == 's') {
    vx = 0;
    vy = 2;
    bikeIsVertical = true;
  } else if (key == 'd') {
    vx = 2;
    vy = 0;
    bikeIsVertical = false;
  }
  px += vx;
  py += vy;
  drawLightCycle1(px, py);

  ////light trail
  //for (int i = 49; i > -1; i--) {
  //  if (i != 0) {
  //    trail[i] = new PVector(trail[i-1].x, trail[i-1].y);
  //  } else {
  //    trail[i] = new PVector(px, py);
  //  }
  //}
  //fill(51, 236, 113);
  //for (int i = 10; i < 30; i++) {
  //  ellipse(trail[i].x, trail[i].y, 1, 1);
  //}
}

void drawLightCycle1(float x, float y) {
  if (bikeIsVertical) {
    ellipse(x, y, 10, 20);
  } else if (bikeIsVertical == false) {
    ellipse(x, y, 20, 10);
  }
}

void keyPressed() {
}