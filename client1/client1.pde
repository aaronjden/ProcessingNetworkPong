// 2B: Shared drawing canvas (Client)

import processing.net.*;

Client c;
Client c1;
Client ball;

String input;
String inpu;
int data[];
int bl[];

int paddle[] = new int[4];

void setup() {
  size(450, 255);
  // Connect to the server’s IP address and port­
  c = new Client(this, "127.0.0.1", 12344); // Replace with your server’s IP and port
  c1 = new Client(this, "127.0.0.1", 12345); // Replace with your server’s IP and port
  ball = new Client(this, "127.0.0.1", 12346);
  
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

  c.write(paddle[0] + " " + paddle[1] + " " + paddle[2] + " " + paddle[3] + "\n");
  
  ballUpdate();
  paddleUpdate();

  }


