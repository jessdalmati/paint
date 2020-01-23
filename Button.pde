class Button {
  int posX;
  int posY;
  int side;
  Boolean selected;
  
  Button(int x, int y, int s) {
    this.posX = x;
    this.posY = y;
    this.side = s;
    this.selected = false;
  }
  
  void show() {
    fill(255);
    rectMode(CORNER);
    stroke(0);
    strokeWeight(1);
    rect(posX, posY, side, side);
    if(mouseOver() || selected) {
      selected();
    }
  }
  
  void select() {
    this.selected = true;
  }
  
  void deselect() {
    this.selected = false;
  }
  
  void selected() {
    fill(255);
    rectMode(CORNER);
    stroke(200);
    strokeWeight(3);
    rect(posX + 2, posY + 2, side - 4, side - 4);
  }
  
  Boolean mouseOver() {
    if(mouseX > posX && mouseX < posX + side && mouseY > posY && mouseY < posY + side) {
      return true;
    }
    return false;
  }
  
}
