ArrayList<Entity> entities = new ArrayList<Entity>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
int gametick = 0;
float gravConstant = 0.60;
boolean isLeft, isRight, isUp, isDown; 
float maxSpeedX = 20;
float maxSpeedY = 20;
float decelerationK = 0.98;
float decelerationK2 = 0.96;
float staticDecelR = 0;

String previousMap;
String currentMap = "2.txt";
String nextMap;
String checkPoint;

PImage background;
PImage bsod;



void setup() {
  size(1366, 768);
  frameRate(60);
  entities.add(new Player());
  entities.add(new Coin(width/2, height/2));
  strokeWeight(0);
  background = loadImage("Background.bmp");
  bsod = loadImage("GnomeCrash.bmp");
  background(255);
  obstacles = loadMap(currentMap);
  
}

void draw() {
  gametick += 1;
  image (background, 0, 0, width, height);
  renderALL();
  entityMove();
  playerAcc();
  fill(255);
  text(currentMap, 10, 10);
  if (currentMap == "8.txt"){   
     image (bsod, 0, 0, width, height);
  }
}


void renderALL() {
<<<<<<< HEAD
=======
  //background
>>>>>>> 4d78ca8957331eb312a25b117d60948a505d8ee7


  for (Obstacle obstacle : obstacles) {
    obstacle.render();
  }
  for (Entity entity : entities) {
    entity.render();
    //entity.debug();
  }
}

void entityMove() { // Moves any Entity
  for (Entity entity : entities ) {
    entity.move();
    entity.gravMove();
  }
  if ( ((Player) entities.get(0)).x > width) {
    moveNextMapEvent();
  }
  if ( ((Player) entities.get(0)).x < -((Player) entities.get(0)).entityWidth - 3) {
    movePrevMapEvent();
  }
  if (((Player) entities.get(0)).y > height) {
    deathEvent();
  }
<<<<<<< HEAD
}
=======
} 
>>>>>>> 4d78ca8957331eb312a25b117d60948a505d8ee7

void keyPressed() {
  // This executes if a key is pressed
  // Part of playerAcc
  // While forcing Playertype makes accMove equal to accMove * accMultiplier and implements MaxMoveMax
  // entities.get(0) gets entity number 0 which is the player
  // .accMove selects the variable accMove which is the accelerated movement (sum of pos, speed, etc.)
  // This is added to accMultiplier which is the rate at which we go faster (kind of acceleration)
  // If these are under the maximum speed allowed (accMoveMax)
  // Then the movement is set to their value, if not them the movement is set to the maximum value
  // setMove executes the jump function if isUp is true, (if arrowUp or W is pressed)

  if (abs((((Player) entities.get(0)).accMove + ((Player) entities.get(0)).accMultiplier)) > ((Player) entities.get(0)).accMoveMax) {
    ((Player) entities.get(0)).accMove = ((Player) entities.get(0)).accMoveMax;
  } else {
    ((Player) entities.get(0)).accMove = abs(((Player) entities.get(0)).accMove + ((Player) entities.get(0)).accMultiplier);
  }
  setMove(keyCode, true);
  if (isUp) {
    ((Player)entities.get(0)).jump();
  }
}

void moveNextMapEvent() {
  currentMap = nextMap;
  obstacles = loadMap(nextMap);
  entities.get(0).x = entities.get(0).entityWidth;
}
void movePrevMapEvent() {
  currentMap = nextMap;
  obstacles = loadMap(previousMap);
  entities.get(0).x = width;
}
void deathEvent() {
  entities.get(0).x = 200;
  entities.get(0).y = 676;
}

void victoryEvent() {
  PImage fg;
  fg = loadImage("Pictures\\Victory.bmp");
  image(fg, 0, 0);
}

void keyReleased() {
  setMove(keyCode, false);
}

boolean setMove(int k, boolean b) {
  switch (k) {
  case 87:
    return isUp = b;

  case 83:
    return isDown = b;

  case 65:
    return isLeft = b;

  case 68:
    return isRight = b;

  case UP: 
    return isUp = b;

  case DOWN:
    return isDown = b;

  case LEFT:
    return isLeft = b;

  case RIGHT:
    return isRight = b;
  default:
    return b;
  }
}
void playerAcc() {
  boolean someSortOfPlayerMovement = false;

  //if a pressed move left
  if (isLeft == true) {
    ((Player) entities.get(0)).speedX = Math.round(((Player) entities.get(0)).speedX - ((Player) entities.get(0)).accMove);
    someSortOfPlayerMovement = true;
  }
  //if d pressed move right
  if (isRight == true) {
    ((Player) entities.get(0)).speedX = Math.round(((Player) entities.get(0)).speedX + ((Player) entities.get(0)).accMove);
    someSortOfPlayerMovement = true;
  }

  if (isUp == true) {
    //((Player) entities.get(0)).jump();
  }

  if (! someSortOfPlayerMovement) {
    for (Entity entity : entities) {
      entity.speedX = 0;
    }
    //reset to default speed
    ((Player) entities.get(0)).accMove = ((Player) entities.get(0)).accMoveDefault;
    //println(((Player) entities.get(0)).accMove);
  }
}

//void playerAcc() {// Moves Player based on Accerelation and keyboard inputs

//if (keyPressed) {
//  if (key == 'a' || key == 'A'|| key == 'd'|| key == 'D') {

//    // While forcing Playertype makes accMove equal to accMove * accMultiplier and implements MaxMoveMax

//    if (abs((((Player) entities.get(0)).accMove * ((Player) entities.get(0)).accMultiplier)) > ((Player) entities.get(0)).accMoveMax) {
//      ((Player) entities.get(0)).accMove = ((Player) entities.get(0)).accMoveMax;
//    } else {
//      ((Player) entities.get(0)).accMove = abs(((Player) entities.get(0)).accMove * ((Player) entities.get(0)).accMultiplier);
//    }

//    if (key == 'a' || key == 'A') { // move left
//      ((Player) entities.get(0)).x = Math.round(((Player) entities.get(0)).x - ((Player) entities.get(0)).accMove) ;
//    }
//    if (key == 'd' || key == 'D') { // move right
//      ((Player) entities.get(0)).x = Math.round(((Player) entities.get(0)).x + ((Player) entities.get(0)).accMove) ;
//    }
//  } 
//  println(((Player) entities.get(0)).accMove);
//} else { // reset to default speed
//  ((Player) entities.get(0)).accMove = ((Player) entities.get(0)).accMoveDefault;
//  println(((Player) entities.get(0)).accMove);
//}
//}



boolean testPInBox(float px, float py, float bx, float by, float bw, float bh) { // tests if a point is in a box
  if ((px > bx && px < bx + bw) && (py > by && py < by + bh)) {
    return true;
  }
  return false;
}

boolean isValidChar(char curr) {
  return curr == 'a' ||
    curr == 'b' ||
    curr == 'c' ||
    curr == 'd' ||
    curr == 'b' ||
    curr == 'e' ||
    curr == 'f' ||
    curr == 'A' ||
    curr == 'B' ||
    curr == 'C' ||
    curr == 'D' ||
    curr == 'E' ||
    curr == 'F' ||
    curr == 'f' ||
    curr == ',' ||
    curr == '1' ||
    curr == '2' ||
    curr == '3' ||
    curr == '4' ||
    curr == '5' ||
    curr == '6' ||
    curr == '7' ||
    curr == '8' ||
    curr == '9' ||
    curr == '0';
}


ArrayList loadMap(String path) {
  String[] lines = loadStrings(path);
  String[] strLines = {};
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  Boolean comment;

  //interpreter
  for (String str : lines) {
    comment = false;
    String outputStr = "";
    for (int i = 0; i < str.length(); i++) {
      char curr = str.charAt(i);
      if (curr == '\"') {
        comment = !comment;
        continue;
      }
      if (comment) {
        continue;
      }
      if (isValidChar(curr)) {
        outputStr += curr;
      }
    }
    strLines = append(strLines, outputStr);
  }
  println("done interpeting");

  //str => int
  for (String strLine : strLines) {
    String[] numberStr = split(strLine, ',');

    if (numberStr.length >= 7) { //x1, y, x2, y2, r, g, b 
      obstacles.add(new Obstacle(int(numberStr[0]), int(numberStr[1]), int(numberStr[2]), int(numberStr[3]), int(numberStr[4]), int(numberStr[5]), int(numberStr[6])));
      println("ld map RGBmode", numberStr.length, numberStr[4], numberStr[5], numberStr[6]);
    } else if (numberStr.length == 5) {//x1, y1, x2, y2, #rgb4 (hex)
      obstacles.add(new Obstacle(int(numberStr[0]), int(numberStr[1]), int(numberStr[2]), int(numberStr[3]), unhex(numberStr[4])));
      println("ld map hexmode", numberStr.length );
    } else if (numberStr.length >= 3) {//x1, y1, x2, y2
      obstacles.add(new Obstacle(int(numberStr[0]), int(numberStr[1]), int(numberStr[2]), int(numberStr[3])));
      println("ld map posmode", numberStr.length, 255, 255, 255);
    }
  }
  println("done converting str[] => Obstacle[]");


  String[] slines = loadStrings(path);
  String text = join(slines, "\n");
  String[] NextMapRX =     match(text, "^@\\s*NEXTMAP\\s*=\\s*(.{0,4}\\x2Etxt)$");
  String[] PrevMapRX =     match(text, "^@\\s*PREVMAP\\s*=\\s*(.{0,4}\\x2Etxt)$");
  String[] CheckPointRX =  match(text, "^@\\s*CHECKPOINT\\s*=\\s*(.{0,4}\\x2Etxt)$");
  //String[] PlayerModelRX = match(text, "^@\\s*PLAYERMODEL\\s*=\\s*(.{0,18}png)$");
  //String[] BGimageRX =     match(text, "^@\\s*BGIMAGE\\s*=\\s*(.{0,18}\\x2Epng)$");
  //String[] BounceBox =     match(text, "^@\\s*BOUNCBOX\\s*=\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5})\\s{0,2}$");
  //String[] DeathBox =      match(text, "^@\\s*DEATHBOX\\s*=\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5})\\s{0,2}$");
  nextMap = NextMapRX[1];
  previousMap = PrevMapRX[1];
  checkPoint = CheckPointRX[1];
  println("mapVarsLoaded");
  return obstacles;
}
