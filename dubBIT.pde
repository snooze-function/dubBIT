// 11110000 11110000 11110000 11110000
// ________ ________ ________ ________
// dubBIT__ ________ ________ ________
// ________ SNOOZE__ FUNCTION ____2021
// FEATURES ________ ________ ________
// ________ ________ ________ ________
// 11110000 11110000 11110000 11110000
// ________ ________ ________ ________
// CLEAR GRID ON START
// MIRROR 4 QUADRANTS INPUT+LED
// TOGGLE BANK 16x8
// KEYBOARD INPUT
// COUNTER FUNKTION(timer, STEP_TIME)
// ________ ________ ________ ________
// 11110000 11110000 11110000 11110000
// 00001111 00001111 00001111 00001111
//
// LEDsDANCE, LEDcDANCE
//
//
// KEEP IT SIMPLE
// INITIALIZE FUNCTIONS
//
//
//
//
// - - - LIBRARIES - - - - - - - - - -
// - - - - - - - - - - - - - - - - - -
import org.monome.Monome;
import oscP5.*;

// - - - DECLARE VARIABLES - - - - - -
// - - - - - - - - - - - - - - - - - -
// - TABLES DECLARE
// A Table object
Table bitmaskTable;
int id;
String category;
String name;
String decimalMap;
String binaryMap;
int decimal;
String binary;
String [] bitmask;
String [] decimalMapSplit;
String [] binaryMapSplit;
String binaryRow0;
String binaryRow1;
String binaryRow2;
String binaryRow3;
String binaryRow4;
String binaryRow5;
String binaryRow6;
String binaryRow7;
//String [] decimal;
//String [] binary;

// - MONOME DECLARE
Monome m;
boolean dirty;
boolean bitmaskLoop;
int bitmaskLoopDirection;
int monomeSize;
int buttonsWidth;
int buttonsHeight;
int[][] led;
int[] buttons;
int[] buttonsTemp;
//int[] bitmasks; //TODO einbauen
int row0,row1, row2, row3, row4, row5, row6, row7; //TODO arrayList o.ä.? TABLE
int buttonIndex;
int timer;
int STEP_TIME = 10; // langsamer STEP_TIME = 10 -> zu STEP_TIME = 20;
int STEP_TIME_INDEX;
String bitmask___stringALT;

// - TEXT DECLARE
String appName;
String appAuthor;
String appDate;

public void setup() {
  
  // - - - INITIALIZE VARIABLES  - - -
  // - - - - - - - - - - - - - - - - -
  // - SCREEN INITIALIZE  
  //size(360,140);
  //size(683,345); // screen/4
  size(400,400);
  //size(683,345);
  background(100);
  stroke(255,204);
  
  // - TABLE INITIALIZE
  loadBitmaskTable();
  
  // - MONOME INITIALIZE
  m = new Monome(this);  
  dirty = true;
  bitmaskLoop = false;
  bitmaskLoopDirection = 0;
  monomeSize = 64; // *64* *128* *256* **512**
  //led = new int[8 + monomeSize%255%128%64 * 8][8 + monomeSize%255%12%64 * 8];
  led = new int[16][16];// oder int[][] led = new int[buttonIndex/16 + buttonIndex%128/16*2][x = buttonIndex/16 + buttonIndex%256/16];
  buttons = new int[monomeSize];
  buttonsTemp = new int[monomeSize];
  //bitmasks = new int[monomeSize];
  buttonIndex = 0;
  
  // - TEXT INITIALIZE  
  PFont silverfinster;  // "Silverfinster-x3L2K.ttf"
  PFont monospace;  // "FreeMono.ttf"
  // The font "Silverfinster-x3L2K.ttf" must be located in the 
  // current sketch's "data" directory to load successfully
  silverfinster = createFont("Silverfinster-x3L2K.ttf", 32);
  monospace = createFont("FreeMono.ttf", 32);
  textFont(silverfinster);
  //textFont(monospace);
  appName = "insane in the mainframe"; //dubBIT__LEDcDANCE__dubbit__ledcDance__scrllCsv
  appAuthor = "snooze-function";
  appDate = "2021";
}
  
public void draw() {

// TRIGGER SOMETHING
  if(timer == STEP_TIME) {
    
    if(bitmaskLoop) {
      bitmaskTableLoop();
    }
    
    if(STEP_TIME_INDEX < monomeSize) {
      STEP_TIME_INDEX++;
    } else {
      STEP_TIME_INDEX = 0;
    }
      
    // DISPLAY BINARY ON CONSOLE
    //println(vodoo); //NEU (inactive)
    
    // DISPLAY BINARY ON CONSOLE
    // println(binary);
    //!!!!println(binaryMap);
    
    timer = 0;
    dirty = true;
    
    //System.out.println("**TRIGGER**");
  }
  else timer++;
  //System.out.println("// timer = " + timer);
  
  if(dirty) {
    //TODO var-bright
    // int highlight;        
       
    // UPDATE led[][] from buttons[]
    ledUpdate();
    //ledUpdate2();
    
    // UPDATE GRID
    m.refresh(led);
    dirty = false;
  }

  // DISPLAY TEXT ON SCREEN
  screenText();
  
  // DISPLAY GRID ON SCREEN
  screenGrid();

  // REDRAW TRANSPARENT BACKGROUND OVER(!) screenGrid
  //fill(20, 230); // muss nach screenGrid() und vor screenText
  //rect(0,0,width,height);
  

}
