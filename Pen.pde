class Pen {
  Boolean penDown;
  Boolean drawOn;
  color stroke;
  int strokeWeight;
  Button button;
  
  Pen(Button b, int sw) {
    this.penDown = false;
    this.stroke = color(0);
    this.drawOn = false;
    this.button = b;
    this.strokeWeight = sw;
  }
  
  void toggleDraw() {
    this.drawOn = !this.drawOn;
  }
  
  void drawOn() {
    this.drawOn = true;
  }
  
  void drawOff() {
    this.drawOn = false;
  }
  
  Boolean isDrawOn() {
    return this.drawOn;
  }
  
  void penUp() {
    penDown = false;
  }
  
  void penDown() {
    penDown = true;
  }
  
  Boolean isPenDown() {
    return this.penDown;
  }
  
  void paint() {
    if(isPenDown() && isDrawOn() && overCanvas()) {
      strokeWeight(strokeWeight);
      stroke(stroke);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    button.show();
  }
  
  void strokeColor(color stroke) {
    this.stroke = stroke;
  }
  
  Boolean mouseOverButton() {
    return button.mouseOver();
  }
  
  Boolean overCanvas() {
    if(pmouseX > 17 && pmouseX < width - 17 && pmouseY > 87 && pmouseY < height - 17
      && mouseX > 17 && mouseX < width - 17 && mouseY > 87 && mouseY < height - 17) {
      return true;
    }
    return false;
  }
}
