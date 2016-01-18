import processing.net.*;

Server s1;
Server s2;
Server ball;

Client c1;
Client c2;

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
  playGame();
}

