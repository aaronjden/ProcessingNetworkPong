import processing.net.*;

Server s1;
Server s2;
Server ball;
Client c1;
Client c2;

boolean p1 = false;
boolean p2 = false;

String input;
int data1[] = new int[4];
int data2[] = new int[4];
int ball1[] = new int[4];

int score1;
int score2;
boolean game;


void setup() {
  size(450, 255);
  s1 = new Server(this, 2345);  // Start a simple server on a port
  s2 = new Server(this, 2344);
  ball = new Server(this, 2346);
  noStroke();

  ballSetup();
}


void draw() {
  background(143);
  drawBall();
  paddle1();
  paddle2();

  s2.write(data1[0] + " " + data1[1] + " " + data1[2] + " " + data1[3] + "\n");
  s1.write(data2[0] + " " + data2[1] + " " + data2[2] + " " + data2[3] + "\n");
  ball.write(ball1[0] + " " + ball1[1] + " " + ball1[2] + " " + ball1[3] + "\n");
}
