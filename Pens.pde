class Pens {

  Pen[] pens;
  Pen selected;
  
  Pens() {
    this.pens = new Pen[4];
    for(int i = 0; i < pens.length; i++) {
      pens[i] = new Pen(new Button(300 + i*35, 0, 35), i + 2);
    }
    this.selected = pens[0];
    selected.drawOn();
    select();
  }
  
  void penDown() {
    selected.penDown();
  }
  
  void penUp() {
    selected.penUp();
  }
  
  void show() {
    for(int i = 0; i < pens.length; i++) {
      pens[i].button.show();
      pens[i].paint();
    }
  }
  
  void strokeColour(color stroke) {
    for(int i = 0; i < pens.length; i++) {
      pens[i].strokeColour(stroke);
    }
  }
  
  void drawOff() {
    for(int i = 0; i < pens.length; i++) {
      pens[i].drawOff();
    }
  }
  
  void changeSelected() {
    if(mouseOverButtons()) {
      selected = pens[getSelected()];
      drawOff();
      selected.drawOn();
      deselectAll();
      select();
    }
  }
  
  void deselectAll() {
    for(int i = 0; i < pens.length; i++) {
      pens[i].button.deselect();
    }
  }
  
  void select() {
    selected.button.select();
  }
  
  int getSelected() {
    for(int i = 0; i < pens.length; i++) {
      if(pens[i].mouseOverButton()) {
        return i;
      }
    }
    return -1;
  }
  
  Boolean mouseOverButtons() {
    if(mouseX > 300 && mouseX < 300 + 40*pens.length && mouseY > 0 && mouseY < 35) {
      return true;
    }
    return false;
  }
  
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

    void strokeColour(color stroke) {
      this.stroke = stroke;
    }

    Boolean mouseOverButton() {
      return button.mouseOver();
    }

    Boolean overCanvas() {
      if (pmouseX > 17 && pmouseX < width - 17 && pmouseY > 87 && pmouseY < height - 17
        && mouseX > 17 && mouseX < width - 17 && mouseY > 87 && mouseY < height - 17) {
        return true;
      }
      return false;
    }
  }
}
