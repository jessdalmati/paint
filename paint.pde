Pen pen;

void setup() {
  size(600, 600);
  background(255);
  pen = new Pen();
}

void draw() {
  pen.drawButton();
  pen.paint();
}

void mousePressed() {
  if(pen.mouseOver()) {
    pen.toggleDraw();
  } else {
    pen.penDown();
  }
}

void mouseReleased() {
  pen.penUp();
}
