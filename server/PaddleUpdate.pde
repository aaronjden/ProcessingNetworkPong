boolean p1 = false;
boolean p2 = false;

int data1[] = new int[4];
int data2[] = new int[4];

String input;

void serverEvent(Server s1, Client c1) {
  p1 = true;
  p2 = true;
//  println("p1" + p1);
}

void paddle1() {
  if (p1) {
    // Receive data1 from client
    c1 = s1.available();
    if (c1 != null) {
      input = c1.readString();
      input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
      data1 = int(split(input, ' '));  // Split values into an array
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

void paddle2() {
  if (p2) {
    // Receive data1 from client
    c2 = s2.available();
    if (c2 != null) {
      input = c2.readString();
      input = input.substring(0, input.indexOf("\n")); // Only up to the newline
      data2 = int(split(input, ' ')); // Split values into an array
      fill(255, 0, 0);
      rect(data2[0], data2[1], data2[2], data2[3]);
    } else {
      for (int i = 0; i<data2.length; i++) {
        data2[i] = 0;
      }
    }
  }
}
