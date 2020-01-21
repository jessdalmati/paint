Pen[] pens;
Pen pen;

void setup() {
  size(600, 600);
  drawCanvas();
  createPens();
  pen = pens[0];
}

void createPens() {
  pens = new Pen[5];
  for(int i = 0; i < pens.length; i++) {
    Button button = new Button(i*115 + 70, 35, 20);
    pens[i] = new Pen(button, i + 1);
  }
}

void draw() {
  drawMenu();
  for(int i = 0; i < pens.length; i++) {
    pens[i].paint();
  }
}

void mousePressed() {
  for(int i = 0; i < pens.length; i++) {
    if(pens[i].mouseOverButton()) {
      pen = pens[i];
      pen.toggleDraw();
      return;
    }
  }
  
  pen.penDown();
}

void mouseReleased() {
  pen.penUp();
}

void drawMenu() {
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
