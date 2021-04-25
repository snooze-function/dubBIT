//
// LED
//

void ledUpdate() {
  
  int offset = 8;
  
  for(int y=0;y<8;y++) {
    for(int x=0;x<8;x++) {
      led[y][x] = buttons[y*8 + x%8] * 15;
      led[y][x + offset] = buttons[y*8 + x%8] * 15;
      led[y + offset][x] = buttons[y*8 + x%8] * 15;
      led[y + offset][x + offset] = buttons[y*8 + x%8] * 15;
    }
  }
}

void ledUpdate2() { // # UNUSED
  for(int y=0;y<8;y++) {
    for(int x=0;x<8;x++) {
      //led[y][x] = buttons[buttonIndex] * 15;
      led[y][x] = buttons[y*8 + x] * 15;
      led[y][x + 8] = buttons[y*8 + x] * 15;
      led[y + 8][x] = buttons[y*8 + x] * 15;
      led[y + 8][x + 8] = buttons[y*8 + x] * 15;
    }
  }
}

public void ledTest() {
  
  //int buttons [] = new int[monomeSize];
  
  for(int i = 0; i < monomeSize - 1; i++) {
    buttons[i] = 0;
    buttons[buttonIndex] ^= 1;
  }
  
  if(buttonIndex < monomeSize - 1) {
  buttonIndex++ ;
  }
  else {
    buttonIndex = 0;
  }

}

public void ledBlinkSkip4Fast() {
  
  //int buttons [] = new int[monomeSize];
  
  for(int i = 0; i < monomeSize - 1; i+=4) {
    buttons[i] = 0;
    buttons[buttonIndex] ^= 1;
  }
  
  if(buttonIndex < monomeSize - 1) {
  buttonIndex++;
  }
  else {
    buttonIndex = 0;
  }

}

public void ledBlinkSkip2Fast() {
  
  //int buttons [] = new int[monomeSize];
  
  for(int i = 0; i < monomeSize - 1; i++) {
    buttons[i] = 0;
    buttons[buttonIndex] ^= 1;
  }
  
  if(buttonIndex < monomeSize - 1) {
  buttonIndex+=2;
  }
  else {
    buttonIndex = 0;
  }

}

public void ledBlinkSkip2() {
  
  //int buttons [] = new int[monomeSize];
  
  for(int i = 0; i < monomeSize - 1; i+=2) {
    buttons[i] = 0;
    buttons[buttonIndex] ^= 1;
  }
  
  if(buttonIndex < monomeSize - 1) {
  buttonIndex++;
  }
  else {
    buttonIndex = 0;
  }

}

public void ledRunBlinkSkip() {
  
  //int buttons [] = new int[monomeSize];
  
  for(int i = 0; i < monomeSize - 1; i++) {
    buttons[i] = 0;
    buttons[buttonIndex] ^= 1;
  }
  
  if(buttonIndex < monomeSize - 1) {
  buttonIndex++;
  }
  else {
    buttonIndex = 0;
  }

}

public void ledRun() {
  
  //int buttons [] = new int[monomeSize];
  
  for(int i = 0; i < monomeSize - 1; i++) {
    buttons[i] = 0;
    buttons[buttonIndex] = 1;
  }
  
  if(buttonIndex < monomeSize) {
  buttonIndex++;
  }
  else {
    buttonIndex = 0;
  }

}

public void ledInvert() {
 
  for (int i = 0; i < 64; i++) {
    buttons[i] ^= 1; // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
  }
}

public void ledInvertNEW() {
 
  for (int i = 0; i < 63; i++) {
    buttons[i] = buttons[i+1]; // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
  }
}

public void ledShiftOverwriteLeft() {
 
  for (int i = 0; i < 63; i++) {
    buttons[i] = buttons[i+1]; // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
  }
}

public void ledShiftOverwriteLeftA() {
 
  for (int i = 0; i < 63; i++) {
    buttons[i] = buttons[i+1%63]; // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
  }
}

public void ledShiftOverwriteRight() {
 
  for (int i = 63; i > 0; i--) {
    buttons[i] = buttons[i-1]; // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
  }
}

public void ledCover() {
  
  buttons[buttonIndex] ^=1;
  
  if(buttonIndex < monomeSize - 1) {
  buttonIndex++;
  }
  else {
    buttonIndex = 0;
  }
}

public void ledSkip() {
  
  buttons[buttonIndex] ^=1;
  
  if(buttonIndex < monomeSize - 1) {
  buttonIndex+=2;
  }
  else {
    buttonIndex = 0;
  }
}

public void ledSingleBlink() {
  
  for(int i = 0; i < monomeSize - 1; i++) {
    buttons[buttonIndex] ^=1;
  }

}

public void ledBlink() {
  
  for(int i = 0; i < monomeSize - 1; i++) {
    buttons[i] ^=1;
  }

}
// # UNUSED + BUG bitmask 8x gleich, randomMap wird nicht verändert (array) 
public void ledRandomMapALT() {
  
  int randomMap = int(random(255));
  
  ledMap(randomMap,randomMap, randomMap,randomMap, randomMap,randomMap, randomMap,randomMap);

}

public void ledRandomMap() {
  
  for(int i=0;i<8;i++) {
    
    //int randomMap = int(random(255));
    row0 = int(random(255));
    row1 = int(random(255));
    row2 = int(random(255));
    row3 = int(random(255));
    row4 = int(random(255));
    row5 = int(random(255));
    row6 = int(random(255));
    row7 = int(random(255));
    ledMap(row0,row1, row2, row3, row4, row5, row6,row7);
  }
}

//TODO reihenfolge der bitmask umkehren
public void ledMapALT(int y0, int y1, int y2, int y3, int y4, int y5, int y6, int y7) { 
  
  int bitmaskIndex = 63;
  
  //y0 = y0
  y1 = y1 << 8;
  y2 = y2 << 16;  // Binary: 00000000110011000000000000000000
  y3 = y3 << 24;  // Binary: 11111111000000000000000000000000  
  //y4 = y4
  y5 = y5 << 8;
  y6 = y6 << 16;  // Binary: 00000000110011000000000000000000
  y7 = y7 << 24;  // Binary: 11111111000000000000000000000000  

  
  bitmask___stringALT = binary(y4 | y5 | y6 | y7) + binary(y0 | y1 | y2 | y3);
  System.out.println(bitmask);
  
  for (int i = 0; i < 64; i++) {
    buttons[i] = (bitmask___stringALT.charAt(bitmaskIndex)) % 48; // -48/%48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
    bitmaskIndex--;
  }
  
  System.out.println("// WRITE BITMASK TO BUTTON ARRAY");
}

//TODO reihenfolge der bitmask umkehren
public void ledMap(int y0, int y1, int y2, int y3, int y4, int y5, int y6, int y7) { 
  
  int bitmaskIndex = 63;
  
  //y0 = y0
  y1 = y1 << 8;
  y2 = y2 << 16;  // Binary: 00000000110011000000000000000000
  y3 = y3 << 24;  // Binary: 11111111000000000000000000000000  
  //y4 = y4
  y5 = y5 << 8;
  y6 = y6 << 16;  // Binary: 00000000110011000000000000000000
  y7 = y7 << 24;  // Binary: 11111111000000000000000000000000  

  
  bitmask___stringALT = binary(y4 | y5 | y6 | y7) + binary(y0 | y1 | y2 | y3);
  System.out.println(bitmask);
  
  for (int i = 0; i < 64; i++) {
    int value = (bitmask___stringALT.charAt(bitmaskIndex)) -48; //
    buttons[i] = value; // -48/%48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
    bitmaskIndex--;
  }
  
  System.out.println("// WRITE BITMASK TO BUTTON HOOOO-ARRAY");
}

//TODO reihenfolge der bitmask umkehren
public void ledHIERWASNEUESBAUEN(int y0, int y1, int y2, int y3, int y4, int y5, int y6, int y7) { 
  
  int bitmaskIndex = 63;
  
  //y0 = y0
  y1 = y1 << 8;
  y2 = y2 << 16;  // Binary: 00000000110011000000000000000000
  y3 = y3 << 24;  // Binary: 11111111000000000000000000000000  
  //y4 = y4
  y5 = y5 << 8;
  y6 = y6 << 16;  // Binary: 00000000110011000000000000000000
  y7 = y7 << 24;  // Binary: 11111111000000000000000000000000  

  
  bitmask___stringALT = binary(y4 | y5 | y6 | y7) + binary(y0 | y1 | y2 | y3);
  System.out.println(bitmask);
  
  for (int i = 0; i < 64; i++) {
    buttons[i] = (bitmask___stringALT.charAt(bitmaskIndex)) - 48; // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
    bitmaskIndex--;
  }
  
  System.out.println("// WRITE BITMASK TO BUTTON ARRAY");
}

public void pasteArray() {  
  arrayCopy(buttonsTemp, buttons);
}

public void copyArray() {
  arrayCopy(buttons, buttonsTemp);
}

public void ledStepper() {
  ledMap(STEP_TIME_INDEX%127, STEP_TIME_INDEX%63, STEP_TIME_INDEX * 2, STEP_TIME_INDEX * 4, STEP_TIME_INDEX * 4, STEP_TIME_INDEX * 2, STEP_TIME_INDEX%63, STEP_TIME_INDEX%127);
}

public void copyArrayRight() {
  arrayCopy(buttons, 0, buttonsTemp, 8, 56);
  arrayCopy(buttonsTemp, buttons);
}



// + + + + + + + + + + + + + + + + +
// + + alte bitmask funktionen + + +
// + + + + + + + + + + + + + + + + +
/*
public void ledMapUNUSED(int y0, int y1, int y2, int y3, int y4, int y5, int y6, int y7) {
  bitmaskConvertUNUSED(y0, y1, y2, y3, y4, y5, y6, y7);
  bitmaskWriteUNUSED();
      
}

public void bitmaskConvertUNUSED(int y0, int y1, int y2, int y3, int y4, int y5, int y6, int y7) {
  String row0 = binary(y0, 8);
  String row1 = binary(y1, 8);
  String row2 = binary(y2, 8);
  String row3 = binary(y3, 8);
  String row4 = binary(y4, 8);
  String row5 = binary(y5, 8);
  String row6 = binary(y6, 8);
  String row7 = binary(y7, 8);
  
  // mask = row0 + row1 + row2 + row3 + row4 + row5 + row6 + row7;
  bitmask = row7 + row6 + row5 + row4 + row3 + row2 + row1 + row0;
  
  //println(mask);
  System.out.println("// BITMASK TO ARRAY CONVERSION");
}

public void bitmaskWriteUNUSED() {
  
  int bitmaskIndex = 63;
  
  for (int i = 0; i < 64; i++) {
      // bitmask invertiert je zeile 00000001 wird 10000000
      //c1 = mask.charAt(index);
      // write bitmask to 1st quadrant
      buttons[i] = (bitmask.charAt(bitmaskIndex)) - 48; // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
      // -48 da 0 und 1 als string dargestellt werden, und daher die werte 48 und 49 haben
      // ledDisplay(x, y, step[page][y][x] = mask.charAt(index));
      bitmaskIndex--;
      //System.out.println("// WRITE BITMASK TO STEP ARRAY");
      //System.out.println(step[page][y][x]);
      //dirty = true;

  } 
  
  System.out.println("// WRITE BITMASK TO STEP ARRAY");
}
*/
