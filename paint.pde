Pen[] pens;
Pen pen;
color paintColour;
Palette palette;

void setup() {
  size(600, 600);
  drawCanvas();
  createPens();
  pen = pens[0];
  palette = new Palette();
  paintColour = palette.getColour();
}

void createPens() {
  pens = new Pen[4];
  for(int i = 0; i < pens.length; i++) {
    Button button = new Button(i*75 + 325, 35, 20);
    pens[i] = new Pen(button, i + 1);
  }
}

void draw() {
  drawMenu();
  palette.show();
  for(int i = 0; i < pens.length; i++) {
    pens[i].paint();
  }
}

void mousePressed() {
  if(palette.mouseOver()) {
    paintColour = palette.getColour();
    for(int i = 0; i < pens.length; i++) {
      pens[i].strokeColor(paintColour);
    }
    return;
  }
  for(int i = 0; i < pens.length; i++) {
    if(pens[i].mouseOverButton()) {
      for(int j = 0; j < pens.length; j++) {
        pens[j].drawOff();
      }
      pen = pens[i];
      pen.strokeColor(paintColour);
      pen.drawOn();
      return;
    }
  }
  
  pen.penDown();
}

void mouseReleased() {
  pen.penUp();
}

void drawMenu() {
  rectMode(CORNER);
  fill(255);
  noStroke();
  rect(0, 0, width, 70);
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
