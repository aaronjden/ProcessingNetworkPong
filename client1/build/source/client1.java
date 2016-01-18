import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.net.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class client1 extends PApplet {

// 2B: Shared drawing canvas (Client)



Client c1;
Client c2;
Client ball;

String input;
int data[];
int bl[];

int paddle[] = new int[4];

public void setup() {
  size(450, 255);
  // Connect to the server\u2019s IP address and port\u00ad
  c1 = new Client(this, "127.0.0.1", 2344); // Replace with your server\u2019s IP and port
  c2 = new Client(this, "127.0.0.1", 2345); // Replace with your server\u2019s IP and port
  ball = new Client(this, "127.0.0.1", 2346);

  paddle[1] = 20;
  paddle[2] = 100;
  paddle[3] = 20;
  noStroke();
}

public void draw() {
  background(150);
  paddle[0] = mouseX;
  fill(255, 0, 0);
  rect(paddle[0], paddle[1], paddle[2], paddle[3]);

  c1.write(paddle[0] + " " + paddle[1] + " " + paddle[2] + " " + paddle[3] + "\n");

  ballUpdate();
  paddleUpdate();

  }
public void ballUpdate() {
  // Receive data from server
  if (ball.available() > 0) {
    input = ball.readString();
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    bl = PApplet.parseInt(split(input, ' '));  // Split values into an array

    fill(255);
    ellipse(bl[0], bl[1], bl[2], bl[3]);
    input = null;
  }
}

public void paddleUpdate() {
  // Receive data from server
  if (c1.available() > 0) {
    input = c1.readString();
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    data = PApplet.parseInt(split(input, ' '));  // Split values into an array

    fill(255);
    rect(data[0], data[1], data[2], data[3]);
    input = null;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "client1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
