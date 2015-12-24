int sizeOfArray = 50;
PVector[] trail = new PVector[sizeOfArray];

void setup() {
  frameRate(1);
  size(400, 400);
  background(255);
  stroke(0);
  //sets values of the array
  for (int i = 0; i < sizeOfArray; i++) {
    trail[i] = new PVector(1/50*i*20 + 20, int(random(20, 380)));
  }
}

void draw() {
  background(255);
  fill(200, 150, 170, 150);
  for (int i = 0; i < sizeOfArray; i++) {
    ellipse(trail[i].x, trail[i].y, 5, 5);
  }
  //for (int i = 1; i < sizeOfArray; i++) {
  //  trail[i] = new PVector(trail[i-1].x , trail[i].y );
  //}
}