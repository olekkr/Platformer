  class Player extends Entity {
  float accMove;
  float accMultiplier = 1.25;
  
  Player(){
    this.x = width/2-entityWidth/2+400;
    this.y = height/2;
    this.entityWidth = 64;
    this.entityHeight = 50;
    this.collidable = true;
    this.weight = true;
  }
  
  
  
}
