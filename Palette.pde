class Palette {
  color[] colours;
  
  Palette() {
    colours = generateColours();
  }
  
  void show() {
    rectMode(CORNER);
    stroke(0);
    fill(225);
    rect(0, 0, 250, 70);
    rectMode(CENTER);
    for(int i = 0; i < colours.length; i++) {
      fill(colours[i]);
      rect(i%12*20 + 15, i/12*20 + 15, 20, 20);
    }
    int i = getSelected();
    if(i != -1) {
      fill(colours[i]);
      rect(i%12*20 + 15, i/12*20 + 15, 30, 30);
    }
  }
          
  color[] generateColours() {
    //https://lospec.com/palette-list/dawnbringer-32
    color[] colours = { #000000, #ffffff, #222034, #45283c, #663931, #8f563b,
     #df7126, #d9a066, #eec39a, #fbf236, #99e550, #6abe30, #37946e, 
       #4b692f, #524b24, #323c39, #3f3f74, #306082, #5b6ee1, #639bff, 
         #5fcde4, #cbdbfc, #9badb7, #847e87, #696a6a, #595652, #76428a, 
           #ac3232, #d95763, #d77bba, #8f974a, #8a6f30};
    return colours;
  }
  
  Boolean mouseOver() {
    if(mouseX > 5 && mouseX < 245 && mouseY > 5 && mouseY < 45) {
      return true;
    } else if(mouseY > 45 && mouseY < 65 && mouseX > 5 && mouseX < 165) {
      return true;
    }
    return false;
  }
  
  int getSelected() {
    if(mouseOver()) {
      int x = ((mouseX - 5)/20)%12;
      int y = ((mouseY - 5)/20)*12;
      
      return x + y;
    }
    return -1;
  }
  
  color getColour() {
    int i = getSelected();
    if(i != -1) {
      return colours[i];
    }
    return colours[0];
  }
}
