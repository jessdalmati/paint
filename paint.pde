color paintColour;
Palette palette;
Pens pens;

void setup() {
  size(600, 600);
  drawCanvas();
  palette = new Palette();
  paintColour = palette.getColour();
  pens = new Pens();
}

void draw() {
  drawMenu();
  palette.show();
  pens.show();
}

void mousePressed() {
  if(palette.mouseOver()) {
    paintColour = palette.getColour();
    pens.strokeColour(paintColour);
    return;
  } else if(pens.mouseOverButtons()) {
    pens.changeSelected();
    return;
  }
  pens.penDown();
}

void mouseReleased() {
  pens.penUp();
}

void drawMenu() {
  strokeWeight(1);
  rectMode(CORNER);
  fill(255);
  noStroke();
  rect(0, 0, width, 70);
  stroke(0);
  fill(225);
  rect(250, 0, 50, 70);
  fill(paintColour);
  rect(255, 5, 40, 60);
}

void drawCanvas() {
  background(#DDDCF2);
  fill(255);
  noStroke();
  rect(15, 85, 570, 500);
  strokeWeight(5);
  stroke(200);
  line(17, 585, 585, 585);
  line(585, 585, 585, 87);
  stroke(150);
  strokeWeight(1);
  line(583, 583, 587, 587);
  line(15, 583, 19, 587);
  line(583, 85, 587, 89);
}
