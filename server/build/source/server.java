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

public class server extends PApplet {



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

public void setup() {
  size(450, 255);
  s1 = new Server(this, 2345);  // Start a simple server on a port
  s2 = new Server(this, 2344);
  ball = new Server(this, 2346);
  noStroke();

  ballSetup();
}


public void draw() {
  background(143);
  playGame();

}
public void ballSetup() {
  ball1[0] = width/2;
  ball1[1] = height/2;
  ball1[2] = 10;
  ball1[3] = ball1[2];
}

boolean ballUp = true;
int xSpeed = 0;
int ySpeed = 1;

public void drawBall() {
  if (mousePressed) {
    game = !game;
  }
  fill(255);
  if (game) {
    moveBall();
    wallBounce();
    paddleBounce();

    ellipse(ball1[0], ball1[1], ball1[2], ball1[3]);
  }
}

public void moveBall() {
  ball1[0] += xSpeed;
  ball1[1] += ySpeed;
}

public void wallBounce() {
  if (ball1[0] + ball1[3] == width || ball1[0] == ball1[3]) {
    xSpeed *= -1;
  }
}

public void paddleBounce() {
  if ((ball1[1] - (ball1[3]/2) == data2[1] + data2[3] && ball1[0] > data2[0] && ball1[0] < data2[0] + data2[2]) 
  || (ball1[1] + (ball1[3]/2) == data1[1] && ball1[0] > data1[0] && ball1[0] < data1[0] + data1[2])) {
    ySpeed*=-1;
  }
}

boolean startScreen = true;
boolean game = false;
boolean pause = false;
boolean gameOver = false;

public void playGame(){
  if (startScreen){
    textAlign(CENTER);
    text("Click The Mouse To \n Start!", height/2, width/2);
    if (mousePressed){
      startScreen = false;
      game = true;
    }
  } else if (game){
    drawBall();
    paddle1();
    paddle2();
    s2.write(data1[0] + " " + data1[1] + " " + data1[2] + " " + data1[3] + "\n");
    s1.write(data2[0] + " " + data2[1] + " " + data2[2] + " " + data2[3] + "\n");
    ball.write(ball1[0] + " " + ball1[1] + " " + ball1[2] + " " + ball1[3] + "\n");
  } else if (pause){
    text("Click The Mouse To Resume", height/2, width/2);
  }
}
public void serverEvent(Server s1, Client c1) {
  p1 = true;
  p2 = true;
//  println("p1" + p1);
}

public void paddle1() {
  if (p1) {
    // Receive data1 from client
    c1 = s1.available();
    if (c1 != null) {
      input = c1.readString();
      input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
      data1 = PApplet.parseInt(split(input, ' '));  // Split values into an array
      // Draw line using received coords

      fill(0, 0, 255);
      rect(data1[0], data1[1], data1[2], data1[3]);
    } else {
      for (int i = 0; i<data1.length; i++) {
        data1[i] = 0;
      }
    }
  }
}

public void paddle2() {
  if (p2) {
    // Receive data1 from client
    c2 = s2.available();
    if (c2 != null) {
      input = c2.readString();
      input = input.substring(0, input.indexOf("\n")); // Only up to the newline
      data2 = PApplet.parseInt(split(input, ' ')); // Split values into an array
      fill(255, 0, 0);
      rect(data2[0], data2[1], data2[2], data2[3]);
    } else {
      for (int i = 0; i<data2.length; i++) {
        data2[i] = 0;
      }
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "server" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
