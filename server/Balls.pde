float ball1[] = new float[4];

void ballSetup() {
  ball1[0] = width/2;
  ball1[1] = height/2;
  ball1[2] = 10;
  ball1[3] = ball1[2];
}

boolean ballUp = true;
int xSpeed = 0;
int ySpeed = 1;

void drawBall() {
  if (mousePressed) {
    game = !game;
  }
  fill(255);
  if (game) {
    moveBall();
    wallBounce();
    paddleBounce();
    ballReset();
    ellipse(ball1[0], ball1[1], ball1[2], ball1[3]);
  }
}

void moveBall() {
  ball1[0] += xSpeed;
  ball1[1] += ySpeed;
}

void wallBounce() {
  if (ball1[0] + ball1[3] == width || ball1[0] == ball1[3]) {
    xSpeed *= -1;
  }
}

void paddleBounce() {
  if ((ball1[1] - (ball1[3]/2) == data2[1] + data2[3] && ball1[0] > data2[0] && ball1[0] < data2[0] + data2[2]) 
    || (ball1[1] + (ball1[3]/2) == data1[1] && ball1[0] > data1[0] && ball1[0] < data1[0] + data1[2])) {
    ySpeed*=-1;
  }
}

void ballReset() {
  if (ball1[1] > height) {
    ball1[1] = height/2;
    ball1[0] = width/2;
  } else if (ball1[1] < 0) {
    ball1[1] = height/2;
    ball1[0] = width/2;
  }
}

