class Player extends Entity {
  float accMove;             //Move in current accelerated state
  float accMoveDefault = 4;  //Move with no acceleration speed (after a stop)
  float accMoveMax = 1.05;     //Max accelerated speed
  float accMultiplier = 0.5; //Acceleration
  float jump1Vel = -30;
  float jump2Vel = 0;
  int jumpStatus = 0;

  Player() {
    this.x = 300;
    this.y = height/2 -200;
    this.entityWidth = 33;
    this.entityHeight = 64;
    this.collidable = true;
    this.weight = true;
  }



  void jump() {
    if (this.jumpStatus == 0) {
      this.speedY = jump1Vel;
      this.jumpStatus = 1;
      this.dynamicDecelR = 0;
    }
    
  }
  
  void landingEvent(Obstacle obstacle){
    this.dynamicDecelR = obstacle.decelR;
    this.jumpStatus = 0;
    println("JUMP!");
  }
}
