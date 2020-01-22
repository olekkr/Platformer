ArrayList<Entity> entities = new ArrayList<Entity>();
int[] vMap;
int[] map;

void setup() {
  size(1024, 512);
  entities.add(new Player());
  
  vMap = loadMap("v1.txt");
  map = loadMap("1.txt");
}

void draw() {
  drawMap(vMap);
  //for(int i = 0; i< 4; i++){
  //  print(map[i]);   
  //}
  //for(int i = 0; i < enteties.length; i++){
  
  //}
  //println(entities.get(0).x);
  for(int i = 0; i < map.length; i++){
  println(map[i]);
  }
}

int[] loadMap(String mapName) {
  String[] line = loadStrings(mapName)[0].split(" ");

  int[] map = new int[line.length];
  for (int i = 0; i < map.length; i++) {
    map[i] = (int(line[i]));
  }
  println(map[0], map[1], "test");
  return map;
}

void drawMap(int[] map) {
  for (int i= 1; i < map.length; i += 5) {
    fill(0);
    rect(map[i], map[i+1], map[i]+map[i+2], map[i+1]+map[i+3]);
    println("drawing:", map[i], map[i+1], map[i]+map[i+2], map[i+1]+map[i+3]);
  }
}

void entityMove() {
  if (keyPressed) {
    if (key == 'a' || key == 'A'|| key == 'd'|| key == 'D') {
    ;
    }
  }
}


void checkCollisions() {
}
