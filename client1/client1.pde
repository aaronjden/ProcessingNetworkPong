// 2B: Shared drawing canvas (Client)

import processing.net.*;

Client c1;
Client c2;
Client ball;

String input;
int data[];
int bl[];

int paddle[] = new int[4];

void setup() {
  size(450, 255);
  // Connect to the server’s IP address and port­
  c1 = new Client(this, "127.0.0.1", 2344); // Replace with your server’s IP and port
  c2 = new Client(this, "127.0.0.1", 2345); // Replace with your server’s IP and port
  ball = new Client(this, "127.0.0.1", 2346);

  paddle[1] = 20;
  paddle[2] = 100;
  paddle[3] = 20;
  noStroke();
}

void draw() {
  background(150);
  paddle[0] = mouseX;
  fill(255, 0, 0);
  rect(paddle[0], paddle[1], paddle[2], paddle[3]);

  c1.write(paddle[0] + " " + paddle[1] + " " + paddle[2] + " " + paddle[3] + "\n");

  ballUpdate();
  paddleUpdate();

  }
