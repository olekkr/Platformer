ArrayList<Entity> entities = new ArrayList<Entity>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
int gametick = 0;


void setup() {
  size(1024, 512);
  entities.add(new Player());
  obstacles = loadMap("1.txt");
  strokeWeight(0);
}

void draw() {
  gametick += 1;
  background(255);
  drawMap(obstacles);
  entityMove();
  renderALL();
}

void renderALL() {
  for(Entity entity : entities){
    entity.render();
    entity.debug();
  }
}

void drawMap(ArrayList<Obstacle> obstacles) {
  for (Obstacle obstacle : obstacles) {
  obstacle.render();
  }
  println("finished drawing obsticles");
}

void entityMove() { // Moves any Entity
  //println(entities.get(0).x); // does not work rn for some reason
  for (Entity entity : entities ) {
    entity.move();
    entity.gravMove();
  }
}

void playerAcc(Player player) {// Moves Player based on Accerelation and keyboard inputs
  if (keyPressed) {
    if (key == 'a' || key == 'A'|| key == 'd'|| key == 'D') {

      //  println(((Player) entities.get(0)).accMove);

      // While forcing Playertype makes accMove equal to speedX * accMultiplier
      ((Player) entities.get(0)).accMove = entities.get(0).speedX * ((Player) entities.get(0)).accMultiplier;

      // println(((Player) entities.get(0)).accMove);
    }
  }
}

void checkCollisions() {
}

ArrayList loadMap(String path) {
  String[] lines = loadStrings(path);
  String[] strLines = {};
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  Boolean comment;

  //interpeter
  for (String str : lines) {
    comment = false;
    String outputStr = "";
    for (int i = 0; i < str.length(); i++) {
      char curr = str.charAt(i);
      if (curr == '#') {
        comment = !comment;
        continue;
      }
      if (comment) {
        continue;
      }
      if (curr == ',' || curr == '1' || curr == '2' || curr == '3' || curr == '4' || curr == '5' || curr == '6' || curr == '7' || curr == '8' || curr == '9' || curr == '0') {
        outputStr += curr;
      }
    }
    strLines = append(strLines, outputStr);
  }
  println("done interpeting");

  //str => int
  for (String strLine : strLines) {
    String[] numberStrs = split(strLine, ',');
    int[] tmpInt = {};
    for (String numberStr : numberStrs) {

      tmpInt = append(tmpInt, int(numberStr));
    }
    if (tmpInt.length >= 7) {
      obstacles.add(new Obstacle(tmpInt[0], tmpInt[1], tmpInt[2], tmpInt[3], tmpInt[4], tmpInt[5], tmpInt[6]));
      println("ld map", tmpInt.length, tmpInt[4], tmpInt[5], tmpInt[6]);
    } else if (tmpInt.length >= 3) {
      obstacles.add(new Obstacle(tmpInt[0], tmpInt[1], tmpInt[2], tmpInt[3]));
      println("ld map", tmpInt.length, 255, 255, 255);
    }
  }
  println("done converting str[] => Obstacle[]");

  return obstacles;
}
