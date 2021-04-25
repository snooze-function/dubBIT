// INPUT KEYBOARD (CASE SENSITIVE!!!!)
public void keyPressed() {
  keyboardTriggers();
}


public void keyboardTriggers() {
  if (keyPressed) {  
    
    // SNOOZE FUNCTION TEST
    if (key == ' ') { // space key
      //bitmaskTEST();
      //bitmaskTable.getRow(4);
      nextBitmaskId();
    }

    if (key == 's') { // ADD NEW BITMASK TO TABLE
      addBitmaskTo_bitmaskTable();
    }

    if (key == 'i') { // INVERT
      ledInvert();
    }
    if (key == 'r') { // RANDOM
      ledRandomMap();
      //System.out.println("wtf");
    }
    if (key == 'y') { // CLEAR GRID
      ledMap(0,0,0,0,0,0,0,0);
    }    
    if (key == 'x') { // DISPLAY ALL
      ledMap(255,255,255,255,255,255,255,255);
    }
    if (key == 'c') { // COPY ARRAY
      copyArray();
    }
    if (key == 'v') { // COPY ARRAY
      pasteArray();
    }
    if (key == 'b') { // UNUSED
      previousBitmaskId();
      //println(binary);
    }
    if (key == 'n') { // SHIFT LEFT
      ledShiftOverwriteLeft();
      //ledRandomMap();
      //System.out.println("wtf");
    }
    if (key == 'm') { // SHIFT RIGHT
      ledShiftOverwriteRight();
      //ledShiftRight();
      //key(0, 1, 1); // example
      //buttons[1] ^= 1; // example
      //System.out.println("wtf");
    }
    if (key == 'l') { // LOOP BITMASKS
      bitmaskLoop = !bitmaskLoop;
    }
    if (key == 'd') { // LOOP BITMASKS
      bitmaskLoopDirection ^= 1;
      //println(bitmaskLoopDirection);
    }
    
    
    
    
    
    if (key == '1') { // BITMASK
      ledMap(255,255,255,255,0,0,0,0);
    }
    if (key == '2') { // BITMASK
      ledMap(0,0,0,0,255,255,255,255);
    }
    if (key == '3') { // BITMASK
      ledMap(1,2,4,8,16,32,64,128);
    }
    if (key == '4') { // BITMASK
      ledMap(0,1,3,7,15,31,63,127);
    }
    if (key == '5') { // BITMASK
      ledMap(127,127,34,127,127,34,127,127);
    }
    if (key == '6') { // BITMASK
      ledMap(127,127,230,230,230,230,127,127);
    }
    if (key == '7') { // BITMASK
      ledMap(67,127,127,67,67,127,127,67);
    }
    if (key == '8') { // BITMASK
      ledMap(127,41,127,23,23,127,41,127);
    }
  }
  
  dirty = true;
}
