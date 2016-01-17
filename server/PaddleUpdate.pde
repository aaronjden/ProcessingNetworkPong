void serverEvent(Server s1, Client c1) {
  p1 = !p1;
  println(p1);
}

void serverEvent1(Server s2, Client c2) {
  p2 = !p2;
}

void paddle1() {
  if (p1) {
    // Receive data1 from client
    c = s1.available();
    if (c != null) {
      input = c.readString();
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
    c = s2.available();
    if (c != null) {
      input = c.readString();
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

