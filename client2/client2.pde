// 2B: Shared drawing canvas (Client)

import processing.net.*;

Client c;
Client c1;
Client ball;

String input;
int data[];
int balls[];

int xPos;
int yPos;
int xSize;
int ySize;

int myRect[] = new int[4];

void setup() {
  size(450, 255); 
  background(204);

  // Connect to the server’s IP address and port­
  c = new Client(this, "127.0.0.1", 12345); // Replace with your server’s IP and port
  c1 = new Client(this, "127.0.0.1", 12344); // Replace with your server’s IP and port
  ball = new Client(this, "127.0.0.1", 12346);
  myRect[1] = 220;
  myRect[2] = 100;
  myRect[3] = 20;
  noStroke();
}

void draw() {
  background(150);
  myRect[0] = mouseX;
  fill(0, 0, 255);
  rect(myRect[0], myRect[1], myRect[2], myRect[3]);

  c.write(myRect[0] + " " + myRect[1] + " " + myRect[2] + " " + myRect[3] + "\n");

  // Receive data from server
  if (c1.available() > 0) {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    data = int(split(input, ' '));  // Split values into an array

    fill(255);
    rect(data[0], data[1], data[2], data[3]);
  }
}
