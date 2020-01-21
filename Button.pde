class Button {
  int posX;
  int posY;
  int radius;
  
  Button(int x, int y, int r) {
    this.posX = x;
    this.posY = y;
    this.radius = r;
  }
  
  void show() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    if(mouseOver()) {
      ellipse(posX, posY, radius*2 + 10, radius*2 + 10);
    } else {
      ellipse(posX, posY, radius*2, radius*2);
    }
  }
  
  Boolean mouseOver() {
    if(mouseX < posX + radius && mouseX > posX - radius && mouseY > posY - radius && 
      mouseY < posY + radius) {
        return true;
      }
    return false;
  }
  
}
