  class Player extends Entity {
  float accMove;             //Move in current accelerated state
  float accMoveDefault = 10; //Move with no acceleration speed (after a stop)
  float accMultiplier = 1.1; //Acceleration
  
  Player(){
    this.collision = true;
    this.weight = true;
  }
  
 
  
}
