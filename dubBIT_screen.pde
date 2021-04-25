//
// SCREEN
//

public void screenGrid() {
  // get currrent page from led[][] and display page onscreen red
  for(int x=0;x<8;x++) {
    for(int y=0;y<8;y++) {
      //ledDisplay(x, y, step[page][y][x]);
      //led[y][x] = step[page][y][x] * 15;
      screenGridButtons(x, y, led[y][x] % 14); // %14 um aus  0 und 15 wieder 0 und 1 zu machen
      //System.out.println(step[page][y][x]);
    }
  }
  //REDRAW TRANSPARENT BACKGROUND OVER(!) screenGrid
  fill(20, 100); // muss nach screenGrid() und vor screenText
  rect(0,0,width,height);
    
}

public void screenGridButtons(int x, int y, int z) {
  
  fill(0, z * 200, 0, 50);
  
  int spacing = height/8; // full window
  int buttonWidth = x * spacing + (width/2 - spacing * 4);
  int buttonHeight = y * spacing + (height/2 - spacing * 4);
  
  rect(buttonWidth, buttonHeight, spacing, spacing);
  
  textAlign(CENTER, CENTER);
  fill(0, 255, 0);
  textSize(24);
  text(buttons[y%8*8 + x%8], x * spacing + spacing/2, y * spacing + spacing/2);
  //rect(x * spacing + width/2 - spacing * 8, y * spacing + height/4 * 3, spacing, spacing);
  //System.out.println(z);
}

public void screenText() {
  
  // APP NAME
  fill(0, 255, 0,100);
  stroke(0, 255, 0,100);
  rect(width/32, height/32 * 2, width - width/16, height/16);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(height/16);
  text(appName, width/2, height/32 * 3);

  // APP AUTHOR
  textAlign(CENTER, CENTER);
  textSize(12);
  text(appAuthor + "\n" + appDate, width/2, height/32 * 25);
  
  // GITHUB LINK
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20);
  textSize(16);
  text("https://github.com/snooze-function", width/2, height/16 * 14);
  
  // BITMASK ID + NAME + CATEGORY
  textAlign(LEFT, LEFT);
  fill(200);
  textSize(16);
  text("id = " + id, width/16, height/32 * 7);
  text("name = " + name, width/16, height/32 * 9);
  text("category = " + category, width/16, height/32 * 11);
  
  //text(decimalMap, width/2, height/32 * 15);
  //text(binaryRow0 + "\n" + binaryRow1 + "\n" + binaryRow2 + "\n" + binaryRow3 + "\n" + binaryRow4 + "\n" + binaryRow5 + "\n" + binaryRow6 + "\n" + binaryRow7, width/2, height/32 * 15);
  
  // BINARY ROW 0 - 7
  //textAlign(CENTER, CENTER);
  //fill(100);
  //textSize(32);
  //text(binaryRow0, width/2, height/32 * 11);
  //text(binaryRow1, width/2, height/32 * 13);
  //text(binaryRow2, width/2, height/32 * 15);
  //text(binaryRow3, width/2, height/32 * 17);
  //text(binaryRow4, width/2, height/32 * 19);
  //text(binaryRow5, width/2, height/32 * 21);
  //text(binaryRow6, width/2, height/32 * 23);
  //text(binaryRow7, width/2, height/32 * 25);  
}
