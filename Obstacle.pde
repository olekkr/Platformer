class Obstacle{
  int posX1;
  int posY1;
  int posX2;
  int posY2;
  int id; 
  
 Obstacle(int x1, int y1, int x2, int y2,int gameTick){
  id = int(random(99))+gameTick*1000;
  this.posX1 = x1;
  this.posY1 = y1;
  this.posX2 = x2;
  this.posY2 = y2;
 }
 
 boolean testCollision(int x, int y){
   if(((x < this.posX2 && x > this.posX1) || (x > this.posX2 && x < this.posX1)) && ((y < this.posY2 && y > this.posY1) || (y > this.posY2 && y < this.posY1))){
   print("collided");
   return true;
   }
   return false;
 }
}