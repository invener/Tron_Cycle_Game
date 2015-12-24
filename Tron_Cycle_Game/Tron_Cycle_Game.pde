//game state tracking variables
boolean gameIsOver = false;
boolean frameCounter = false;
String loser = "unkown";

//bike variables
int px = width/5;
int py = height/2;
int vx = 2;
int vy = 0;
boolean bikeIsVertical = false;

int px2 = 500;
int py2 = height/2;
int vx2 = 2;
int vy2 = 0;
boolean bikeIsVertical2 = false;

//light trail stuff
int sizeOfArray = 100;
PVector[] trail = new PVector[sizeOfArray];

int sizeOfArray2 = 100;
PVector[] trail2 = new PVector[sizeOfArray2];

void setup() {
  //sets screen size
  size(600, 600);
  //sets background color to be black
  background(0, 0, 0);
  //initializes array for light cycle trail
  for (int i = 1; i < sizeOfArray; i++) {
    trail[i] = new PVector(px, py);
  }
  for (int i = 1; i < sizeOfArray2; i++) {
    trail2[i] = new PVector(px2, py2);
  }
}

void draw() {
  if (gameIsOver == false) {
    background(0, 0, 0);
    line(0, 0, 0, height-1);
    line(0, height-1, width-1, height-1);
    line(0, 0, width-1, 0);
    line(width-1, 0, width-1, height-1);
    drawCompleteBike();
    drawSecondCompleteBike();
    drawLightTrail();
    drawLightTrail2();
    reasonsForLoss();
  }
  if (gameIsOver == true) {
    background(0);
    println("Game Over");
    println(loser);
    textSize(25);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
    text(loser, width/2, height/2 + 50);
  }
  frameCounter = true;
}

void drawLightCycle(float x, float y, boolean isVertical) {
  if (isVertical) {
    ellipse(x, y, 10, 20);
  } else if (isVertical == false) {
    ellipse(x, y, 20, 10);
  }
}

void keyPressed() {
}

void drawCompleteBike() {
  if (key == 'w') {
    if (vy != 2) {
      vx = 0;
      vy = -2;
    }
    bikeIsVertical = true;
  } else if (key == 'a') {
    if (vx != 2) {
      vx = -2;
      vy = 0;
    }
    bikeIsVertical = false;
  } else if (key == 's') {
    if (vy != -2) {
      vx = 0;
      vy = 2;
    }
    bikeIsVertical = true;
  } else if (key == 'd') {
    if (vx != -2) {
      vx = 2;
      vy = 0;
    }
    bikeIsVertical = false;
  }
  //update position with appropriate velocity
  px += vx;
  py += vy;
  //draw the lightcycle
  drawLightCycle(px, py, bikeIsVertical);
}

void drawSecondCompleteBike() {
  if (keyCode == UP) {
    if (vy2 != 2) {
      vx2 = 0;
      vy2 = -2;
    }
    bikeIsVertical2 = true;
  } else if (keyCode == LEFT) {
    if (vx2 != 2) {
      vx2 = -2;
      vy2 = 0;
    }
    bikeIsVertical2 = false;
  } else if (keyCode == DOWN) {
    if (vy2 != -2) {
      vx2 = 0;
      vy2 = 2;
    }
    bikeIsVertical2 = true;
  } else if (keyCode == RIGHT) {
    if (vx2 != -2) {
      vx2 = 2;
      vy2 = 0;
    }
    bikeIsVertical2 = false;
  }
  //update position with appropriate velocity
  px2 += vx2;
  py2 += vy2;
  //draw the lightcycle
  drawLightCycle(px2, py2, bikeIsVertical2);
}

void drawLightTrail() {
  //Light trail
  //draws light trail
  stroke(255);
  fill(255);
  for (int i = 1; i < sizeOfArray; i++) {
    ellipse(trail[i].x, trail[i].y, 1, 1);
  }
  //assigns new values to array
  for (int i = sizeOfArray-1; i > 0; i--) {
    if (i > 1 && i < trail.length) {
      trail[i] = new PVector(trail[i-1].x, trail[i-1].y );
    }
    if (i == 1) {
      trail[i] = new PVector(px, py);
    }
  }
}

void drawLightTrail2() {
  //Light trail
  //draws light trail
  stroke(255);
  fill(255);
  for (int i = 1; i < sizeOfArray2; i++) {
    ellipse(trail2[i].x, trail2[i].y, 1, 1);
  }
  //assigns new values to array
  for (int i = sizeOfArray-1; i > 0; i--) {
    if (i > 1 && i < trail2.length) {
      trail2[i] = new PVector(trail2[i-1].x, trail2[i-1].y );
    }
    if (i == 1) {
      trail2[i] = new PVector(px2, py2);
    }
  }
}

void reasonsForLoss() {
  if (frameCounter) {
    for (int i = 2; i < trail.length; i++) {
      if (px == trail[i].x && py == trail[i].y) {
        gameIsOver = true;
        loser = "P1 loses";
      }
      if (px2 == trail2[i].x && py2 == trail2[i].y) {
        gameIsOver = true;
        loser = "P2 loses";
      }
      if (px == trail2[i].x && py == trail2[i].y) {
        gameIsOver = true;
        loser = "P1 loses";
      }
      if (px2 == trail[i].x && py2 == trail[i].y) {
        gameIsOver = true;
        loser = "P2 loses";
      }
    }
  }
  if (px < 0 || px > width || py < 0 || py > height) {
    gameIsOver = true;
    loser = "P1 loses";
  }
  if (px2 < 0 || px2 > width || py2 < 0 || py2 > height) {
    gameIsOver = true;
    loser = "P2 loses";
  }
}