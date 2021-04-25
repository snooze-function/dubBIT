// + + + + + + + + + + + + + + + + +
// + + String Table Functions  + + +
// + + + + + + + + + + + + + + + + +

//TODO bitmasktable data
// >table[]
//  >bitmasks[bitmaskTable.rows] i < x
//   >decimal SPLIT + JOIN(nf()nfs()) ", " [bitmaskTable.rows] i < 8
//    >row0-row7 i < 8
//     --->getint
//   >binary SPLIT + JOIN(nf()nfs()) ", " [bitmask.rows] i < 8
//    >row0-row7
//     --->getint



// load table
public void loadBitmaskTable() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  bitmaskTable = loadTable("bitmaskTable--BRANCH.csv", "header");
  
  println(bitmaskTable.getRowCount() + " total rows in table");
  TableRow bitmaskTableRow = bitmaskTable.getRow(0);
    
  id = bitmaskTableRow.getInt("id");
  category = bitmaskTableRow.getString("category");
  name = bitmaskTableRow.getString("name");
  decimalMap = bitmaskTableRow.getString("decimalMap");
  decimalMapSplit = split(bitmaskTableRow.getString("decimalMap"), ", ");
  binaryMapSplit = split(bitmaskTableRow.getString("binaryMap"), " ");
  binary = join(binaryMapSplit, "");
  
  binaryRow0 = binary.substring(0, 8);
  binaryRow1 = binary.substring(8, 16);
  binaryRow2 = binary.substring(16, 24);
  binaryRow3 = binary.substring(24, 32);
  binaryRow4 = binary.substring(32, 40);
  binaryRow5 = binary.substring(40, 48);
  binaryRow6 = binary.substring(48, 56);
  binaryRow7 = binary.substring(56, 64);
  binaryMap = binaryRow0 + binaryRow1 + binaryRow2 + binaryRow3 + binaryRow4 + binaryRow5 + binaryRow6 + binaryRow7;
  
  // You can access iterate over all the rows in a table
  for (int i = 0; i < bitmaskTable.getRowCount(); i++) {

  }
}
  
//bitmaskTableRow = bitmaskTable.getRow(i);

public void writeBitmaskIdBinary() {
    
    TableRow bitmaskTableRow = bitmaskTable.getRow(id);
    
    id = bitmaskTableRow.getInt("id");
    category = bitmaskTableRow.getString("category");
    name = bitmaskTableRow.getString("name");
    decimalMap = bitmaskTableRow.getString("decimalMap");
    decimalMapSplit = split(bitmaskTableRow.getString("decimalMap"), ", ");
    binaryMapSplit = split(bitmaskTableRow.getString("binaryMap"), " ");
    //binaryMap = split(bitmaskTableRow.getString("binaryMap"), "; ");
    binary = join(binaryMapSplit, "");
    
    getBinarySubstrings();
        
    // print binary
    for (int i = 0; i < monomeSize; i++) {      
      //binaryMap = bitmaskTableRow.getString("binaryMap");
      //binary = "1111111111111111111111111111111111111111111111111111111111111111";
      buttons[i] = binary.charAt(i) - 48;
      //println(binary);
      //println((binary.charAt(i)) - 48);
    }
}

public void getBinarySubstrings() {
  binaryRow0 = binary.substring(0, 8);
  binaryRow1 = binary.substring(8, 16);
  binaryRow2 = binary.substring(16, 24);
  binaryRow3 = binary.substring(24, 32);
  binaryRow4 = binary.substring(32, 40);
  binaryRow5 = binary.substring(40, 48);
  binaryRow6 = binary.substring(48, 56);
  binaryRow7 = binary.substring(56, 64);
  binaryMap = binaryRow0 + binaryRow1 + binaryRow2 + binaryRow3 + binaryRow4 + binaryRow5 + binaryRow6 + binaryRow7;
}

public void updateBinaryWithButtonStates() {
  
}

public void nextBitmaskId() {
  if (id < bitmaskTable.getRowCount() - 1) {
    id++;
  }
  else {
    id = 0;
  }
  writeBitmaskIdBinary();
}

public void previousBitmaskId() {
  if (id > 0) {
    id--;
  }
  else {
    id = bitmaskTable.getRowCount() - 1;
  }
  writeBitmaskIdBinary();
}

public void bitmaskTableLoop() {
  
  if (bitmaskLoopDirection == 0) {
    nextBitmaskId();
  }
  else {
    previousBitmaskId();
  }
}

// write table
public  void addBitmaskTo_bitmaskTable() {
  
  binary = "";
  
  // get current button states
  //binary = buttons;
  // print binary
  for (int i = 0; i < monomeSize; i++) {      
    //binaryMap = bitmaskTableRow.getString("binaryMap");
    //binary = "1111111111111111111111111111111111111111111111111111111111111111";
    binary = binary + nf(buttons[i]);
    //println(binary);
    //println((binary.charAt(i)) - 48);
  }
  
  //println(binary);
  getBinarySubstrings();
  binaryMap = binaryRow0 + " " + binaryRow1 + " " + binaryRow2 + " " + binaryRow3 + " " + binaryRow4 + " " + binaryRow5 + " " + binaryRow6 + " " + binaryRow7;
  //println(binaryMap);
  
  // Create a new row
  TableRow bitmaskTableRow = bitmaskTable.addRow();
  // Set the values of that row
  bitmaskTableRow.setInt("id", bitmaskTable.getRowCount() - 1);
  bitmaskTableRow.setString("category", "NEW");
  bitmaskTableRow.setString("name", "NEW");
  bitmaskTableRow.setString("decimalMap", "");
  bitmaskTableRow.setString("binaryMap", binaryMap);

  //// If the table has more than 10 rows
  //if (bitmaskTable.getRowCount() > 10) {
    //// Delete the oldest row
    //table.removeRow(0);
  //}

  // Writing the CSV back to the same file
  saveTable(bitmaskTable, "data/bitmaskTable--BRANCH.csv");
  // And reloading it
  loadBitmaskTable();
}
 
/*     
 *  //TableRow bitmaskTableRow = bitmaskTable.getRow(i);
    // You can access the fields via their column name (or index)
    //int id = bitmask.getInt("id");
    //String category = bitmaskTable.getString("category");
    //String name = bitmaskTable.getString("name");
    //String decimalMap = bitmaskTable.getString("decimalMap");
    //String binaryMap = bitmaskTable.getString("binaryMap");
    
    //decimalMap = split(bitmaskTableRow.getString("decimalMap"), ", ");
    //binaryMap = split(bitmaskTableRow.getString("binaryMap"), ", ");
    
    //binaryMap = split(bitmaskTableRow.getString("binaryMap"), ", ");
    
    // Make a Bubble object out of the data read

    // get rows from map
    for (i = 0; i < 8; i++) {
      decimal[i] = split(bitmask.getString("decimal64map"), ", ");
      binary[i] = split(bitmask.getString("binary64map"), ", ");
    }
        
    //bitmaskTable.getRow(4);
    
    // get id
    //bitmask.getInt(3);
    
    //bitmask[i] = new bitmask(name);
    //bitmask[i] = new bitmask(name);
    //bubbles[i] = new Bubble(x, y, d, n);
    // bitmask = new bitmask[bitmaskTable.getRowCount()];
    // decimal64map = new decimal64map[table.getRowCount()];
    // binary64map = new binary64map[table.getRowCount()];  
*/

/*
// get rows from map
for (i = 0; i < 8; i++) {
  decimal[i] = split(bitmask.getString("decimal64map"), ", ");
  binary[i] = split(bitmask.getString("binary64map"), ", ");
}

// get decimal
for (i = 0; i < 8; i++) {
  decimal = decimal64map.getInt[i];    
  binary = binaryMap.getString[i];  
}
*/

/*  
public void loopThroughTable () {
    // You can access iterate over all the rows in a table
  for (int i = 0; i < bitmaskTable.getRowCount(); i++) {
    //TableRow bitmaskTableRow = bitmaskTable.getRow(i);
    // You can access the fields via their column name (or index)
    //int id = bitmask.getInt("id");
    //String category = bitmaskTable.getString("category");
    //String name = bitmaskTable.getString("name");
    //String decimalMap = bitmaskTable.getString("decimalMap");
    //String binaryMap = bitmaskTable.getString("binaryMap");
    
    //decimalMap = split(bitmaskTableRow.getString("decimalMap"), ", ");
    //binaryMap = split(bitmaskTableRow.getString("binaryMap"), ", ");
    
    //binaryMap = split(bitmaskTableRow.getString("binaryMap"), ", ");
    
    // Make a Bubble object out of the data read
    
    //bitmaskTable.getRow(4);
    
    // get id
    //bitmask.getInt(3);
    
    //bitmask[i] = new bitmask(name);
    //bitmask[i] = new bitmask(name);
    //bubbles[i] = new Bubble(x, y, d, n);
    // bitmask = new bitmask[bitmaskTable.getRowCount()];
    // decimal64map = new decimal64map[table.getRowCount()];
    // binary64map = new binary64map[table.getRowCount()];  
  }
}
*/
