import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Platformer extends PApplet {

ArrayList<Entity> enteties = new ArrayList<Entity>();
int[] vMap;
int[] map;

public void setup(){
  
  enteties.add(new Player());
  vMap = loadMap("v1.txt");
  map = loadMap("1.txt");
}

public void draw(){
  drawMap(vMap);
  //for(int i = 0; i< 4; i++){
  //  print(map[i]);   
  //}
}

public int[] loadMap(String mapName){
  String[] linesLS = loadStrings(mapName);
  String liness = linesLS[0];
  String[] lines = liness.split(",");
  int[] map = new int[lines.length];
  for(int i = 0; i < lines.length; i++){
    map[i] = (PApplet.parseInt(lines[i]));
  }
  return map;
}

public void drawMap(int[] map){
  for(int i= 1; i < map.length; i += 5){
  fill(0);
  rect(map[i],map[i+1],map[i]+map[i+2],map[i+1]+map[i+3]);
  println("drawing:", map[i-1], map[i], map[i+1], map[i]+map[i+2], map[i+1]+map[i+3]);
  }
}

public void playerMove(){}
public void checkCollisions(){}
class Entity {
  
  int x;
  int y;
  int entityWidth;
  int entityHeight;
  Boolean collision;
  int speedX;
  int speedY;
  
  
  Entity(){
    this.x = width/2;
    this.y = height/2;
    this.entityWidth = width/64;
    this.entityHeight = height/64;
    this.collision = false;
  
  }
  
}
class Player extends Entity {
  
  
  
  
  
}
  public void settings() {  size(1024,512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Platformer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
