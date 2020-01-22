ArrayList<Entity> enteties = new ArrayList<Entity>();
int[] vMap;
int[] map;

void setup() {
  size(1024, 512);
  enteties.add(new Player());
  
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
  println(entities[0].x);
}

int[] loadMap(String mapName) {
  String[] linesLS = loadStrings(mapName);
  String liness = linesLS[0];
  String[] lines = liness.split(",");
  int[] map = new int[lines.length];
  for (int i = 0; i < lines.length; i++) {
    map[i] = (int(lines[i]));
  }
  return map;
}

void drawMap(int[] map) {
  for (int i= 1; i < map.length; i += 5) {
    fill(0);
    rect(map[i], map[i+1], map[i]+map[i+2], map[i+1]+map[i+3]);
    println("drawing:", map[i-1], map[i], map[i+1], map[i]+map[i+2], map[i+1]+map[i+3]);
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
