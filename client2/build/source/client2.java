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

public class client2 extends PApplet {

// 2B: Shared drawing canvas (Client)



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

public void setup() {
  size(450, 255);
  background(204);

  // Connect to the server\u2019s IP address and port\u00ad
  c = new Client(this, "127.0.0.1", 2345); // Replace with your server\u2019s IP and port
  c1 = new Client(this, "127.0.0.1", 2344); // Replace with your server\u2019s IP and port
  ball = new Client(this, "127.0.0.1", 2346);
  myRect[1] = 220;
  myRect[2] = 100;
  myRect[3] = 20;
  noStroke();
}

public void draw() {
  background(150);
  myRect[0] = mouseX;
  fill(0, 0, 255);
  rect(myRect[0], myRect[1], myRect[2], myRect[3]);

  c.write(myRect[0] + " " + myRect[1] + " " + myRect[2] + " " + myRect[3] + "\n");

  // Receive data from server
  if (c1.available() > 0) {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    data = PApplet.parseInt(split(input, ' '));  // Split values into an array

    fill(255);
    rect(data[0], data[1], data[2], data[3]);
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "client2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
