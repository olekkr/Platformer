ArrayList<Entity> entities = new ArrayList<Entity>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
int gametick = 0;


void setup() {
  size(1024, 512);
  entities.add(new Player());
  obstacles = loadMap("1.txt");
  strokeWeight(0);
  stroke(0);
  frameRate(30);
}

void draw() {
  gametick += 1;
  background(255);
  renderALL();
  entityMove();
  playerAcc();
}

void renderALL() {
  for (Obstacle obstacle : obstacles) {
    obstacle.render();
  }
  for (Entity entity : entities) {
    entity.render();
    entity.debug();
  }
}

void entityMove() { // Moves any Entity
  //println(entities.get(0).x); // does not work rn for some reason
  for (Entity entity : entities ) {
    entity.move(obstacles);
    entity.gravMove();
  }
}

void playerAcc() {// Moves Player based on Accerelation and keyboard inputs
  if (keyPressed) {
    if (key == 'a' || key == 'A'|| key == 'd'|| key == 'D') {

      // While forcing Playertype makes accMove equal to accMove * accMultiplier
      ((Player) entities.get(0)).accMove = abs(((Player) entities.get(0)).accMove) * ((Player) entities.get(0)).accMultiplier;

      if (key == 'a' || key == 'A') { // move left
        ((Player) entities.get(0)).x = Math.round(((Player) entities.get(0)).x - ((Player) entities.get(0)).accMove) ;
      }
      if (key == 'd' || key == 'D') { // move right
        ((Player) entities.get(0)).x = Math.round(((Player) entities.get(0)).x + ((Player) entities.get(0)).accMove) ;
      }
    }
  } else { // 
    ((Player) entities.get(0)).accMove = ((Player) entities.get(0)).accMoveDefault;
  }
}

void checkCollision() {
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
      if (
        curr == 'a' ||
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
        curr == '0'
        ) {
        outputStr += curr;
      }
    }
    strLines = append(strLines, outputStr);
  }
  println("done interpeting");

  //str => int
  for (String strLine : strLines) {
    String[] numberStr = split(strLine, ',');

    if (numberStr.length >= 7) { //x1, y1, x2, y2, r, g, b 
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

  return obstacles;
}
