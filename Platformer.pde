ArrayList<Entity> entities = new ArrayList<Entity>();
ArrayList<Obstacle> Obstacles = new ArrayList<Obstacle>();
ArrayList<int[]> map;
int gametick = 0;


void setup() {
  size(1024, 512);
  entities.add(new Player());
  map = loadMap("1.txt");
  strokeWeight(0);
}

void draw() {
  gametick += 1;
  drawMap(map);
  entityMove();
  //for(int i = 0; i< 4; i++){
  //  print(map[i]);   
  //}
}

void renderALL() {
}

void drawMap(ArrayList<int[]> map) {
  for (int[] coors : map) {
    fill(0);
    if(coors.length == 7){ //sets color if specified
      fill(coors[4], coors[5], coors[6]);
    }
    rect(coors[0], coors[1], coors[2], coors[3]);
    //println("drawing:", map[i-1], map[i], map[i+1], map[i]+map[i+2], map[i+1]+map[i+3]);
  }
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
  ArrayList<int[]> map = new ArrayList<int[]>();
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
    if(tmpInt.length > 3){
       map.add(tmpInt);
       println("ld map",tmpInt.length, tmpInt[0]);
    }
  }
  println("done converting");

  return map;
}
