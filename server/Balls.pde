void ballSetup() {
  ball1[0] = width/2;
  ball1[1] = height/2;
  ball1[2] = 10;
  ball1[3] = ball1[2];
}

boolean ballUp = true;
int xSpeed = 10;
int ySpeed = 0;

void drawBall() {
  game = true;
  fill(255);
  if(game){
    moveBall();
    wallBounce();
    paddleBounce();

    ellipse(ball1[0], ball1[1], ball1[2], ball1[3]);
  }
}

void moveBall() {
  ball1[0] += xSpeed;
  ball1[1] += ySpeed;
}

void wallBounce() {
  if(ball1[0] == width-ball1[3] || ball1[0] == ball1[3]){
    xSpeed *= -1;
  }
}

void paddleBounce() {
  if(ball1[1] - ball1[3] == data1[1] || ball1[1] + ball1[3] == data2[1] - data2[3]){
    ySpeed*=-1;
  }
}
