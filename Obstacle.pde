class Obstacle{
  int posX1;
  int posY1;
  int posX2;
  int posY2;
  int id; 
  color COLOR;
  
 Obstacle(int x1, int y1, int x2, int y2, int RED, int GREEN, int BLUE){//RGB mode
  id = int(random(999))+millis()*1000;
  this.posX1 = x1;
  this.posY1 = y1;
  this.posX2 = x2;
  this.posY2 = y2;
  this.COLOR = unhex("FF" + str(RED) + str(GREEN) + str(BLUE));
  println("obstacle color", hex(this.COLOR));
 }
 Obstacle(int x1, int y1, int x2, int y2){
  id = int(random(999))+millis()*1000;//posmode
  this.posX1 = x1;
  this.posY1 = y1;
  this.posX2 = x2;
  this.posY2 = y2;
  this.COLOR = #FF00FF;
  println("obstacle color", hex(this.COLOR));
 }
 Obstacle(int x1, int y1, int x2, int y2, color COLOR){//hexmode
   id = int(random(999))+millis()*1000;
  this.posX1 = x1;
  this.posY1 = y1;
  this.posX2 = x2;
  this.posY2 = y2;
  this.COLOR = COLOR;
  println("obstacle color", hex(this.COLOR));
 }
 
 boolean testCollision(int x, int y){
   if(((x < this.posX2 && x > this.posX1) || (x > this.posX2 && x < this.posX1)) && ((y < this.posY2 && y > this.posY1) || (y > this.posY2 && y < this.posY1))){
   print("collided");
   return true;
   }
   return false;
 }
 
 void render(){
   fill(COLOR);
   rect(this.posX1/1,this.posY1/1,this.posX2/1,this.posY2/1);
 }
}
