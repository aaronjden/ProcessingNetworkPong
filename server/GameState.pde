boolean startScreen = false;
boolean game = true;
boolean pause = false;
boolean gameOver = false;

int score1 = 0;
int score2 = 0;

void playGame() {
  if (startScreen) {
    textAlign(CENTER);
    text("Click The Mouse To \n Start!", height/2, width/2);
    if (mousePressed) {
      startScreen = false;
      game = true;
    }
  } else if (game) {
    drawBall();
    paddle1();
    paddle2();
    s2.write(data1[0] + " " + data1[1] + " " + data1[2] + " " + data1[3] + "\n");
    s1.write(data2[0] + " " + data2[1] + " " + data2[2] + " " + data2[3] + "\n");
    ball.write(ball1[0] + " " + ball1[1] + " " + ball1[2] + " " + ball1[3] + "\n");
  } else if (pause) {
    text("Click The Mouse To Resume", height/2, width/2);
    if (mousePressed) {
      pause = false;
      game = true;
    }
  }
}

