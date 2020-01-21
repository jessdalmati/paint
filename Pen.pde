class Pen {
  Boolean penDown;
  Boolean drawOn;
  color stroke;
  int buttonX;
  int buttonY;
  
  Pen() {
    this.penDown = false;
    this.stroke = color(0);
    this.drawOn = false;
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
    if(isPenDown() && isDrawOn()) {
      strokeWeight(5);
      stroke(stroke);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
  
  void drawButton() {
    strokeWeight(1);
    stroke(0);
    ellipse(width - 30, 30, 30, 30);
  }
  
  void strokeColor(color stroke) {
    this.stroke = stroke;
  }
  
  Boolean mouseOver() {
    if(mouseX < width - 15 && mouseX > width - 45 && mouseY > 15 && 
      mouseY < 45) {
        return true;
      }
    return false;
  }
}
