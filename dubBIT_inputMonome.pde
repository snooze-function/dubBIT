// INPUT MONOME
public void key(int x, int y, int s) {
  // *MOMENTARY* 
  //buttons[y%8*8 + x%8] = s * 1;
  
  // *TOGGLE*
  if(s == 1) {
    buttons[y%8*8 + x%8] ^= 1;        
  }
  
  // BITMASK LOOP ON/OFF
  if(x == 7 & y == 7 & s == 1) {
    bitmaskLoop = !bitmaskLoop;
  }
  
  // BITMASK LOOP DIRECTION
  if(x == 0 & y == 7 & s == 1) {
    bitmaskLoopDirection ^= 1;
  }
  
  
  //// example
  //if(buttons[0] == 1) {
    //ledMap(255,0,255,0,0,0,255,0);
  //}
  
  
  // INPUT FEEDBACK
  //System.out.println("x = " + x + " *** " + "y = " + y);
  //System.out.println("buttons[" + (y%8*8 + x%8) + "]");
  //System.out.println("led[" + y + "][" + x + "]" + " *** " + "buttons[" + (y%8*8 + x%8) + "]" + " " + s);
  //System.out.println("led[" + y + "][" + x + "]" + " *** " + "buttons[" + (y%8*8 + x%8) + "]" + " " + s); 
  
  dirty = true; 
}

// + + + + + + + + + + + + + + + + +
// + + + CHECK THIS OUT  + + + + + +
// + + + + + + + + + + + + + + + + +
