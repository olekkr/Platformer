  class Player extends Entity {
  float accMove;             //Move in current accelerated state
  float accMoveDefault = 4;  //Move with no acceleration speed (after a stop)
  float accMoveMax = 1.05;     //Max accelerated speed
  float accMultiplier = 0.5; //Acceleration
  
  Player(){
    this.x = width/2-entityWidth/2;
    this.y = height/2;
    this.entityWidth = 64;
    this.entityHeight = 50;
    this.collidable = true;
    this.weight = true;
  }
  
 
  
}
