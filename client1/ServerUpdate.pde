void ballUpdate() {
  // Receive data from server
  if (ball.available() > 0) {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    bl = int(split(input, ' '));  // Split values into an array

    fill(255);
    ellipse(bl[0], bl[1], bl[2], bl[3]);
    input = null;
  }
}

void paddleUpdate() {
  // Receive data from server
  if (c1.available() > 0) {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    data = int(split(input, ' '));  // Split values into an array

    fill(255);
    rect(data[0], data[1], data[2], data[3]);
    input = null;
  }
}

