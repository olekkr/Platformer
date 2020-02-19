  class Player extends Entity {
  float accMove;             //Move in current accelerated state
  float accMoveDefault = 10; //Move with no acceleration speed (after a stop)
  float accMoveMax = 32;         //Max accelerated speed
  float accMultiplier = 1.1; //Acceleration
  
  Player(){
    this.x = width/2-entityWidth/2+400;
    this.y = height/2;
    this.entityWidth = 64;
    this.entityHeight = 50;
    this.collidable = true;
    this.weight = true;
  }
  
 
  
}
