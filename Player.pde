class Player extends Entity {
  float accMove;             //Move in current accelerated state
  float accMoveDefault = 4;  //Move with no acceleration speed (after a stop)
  float accMoveMax = 1.05;     //Max accelerated speed
  float accMultiplier = 0.5; //Acceleration
  float jump1Vel = -20;
  float jump2Vel = -17;
  int jumpStatus = 0; // 0:on the ground, 1:after 1 jump, 2:after 2jumps

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
      this.dynamicDecelR = 0; //resets deceleration 
    }
    else if(jumpStatus == 1){
      this.speedY = jump2Vel;
      this.jumpStatus = 2;
    }
    
  }
  
  void landingEvent(Obstacle obstacle){
    this.dynamicDecelR = obstacle.decelR;
    this.jumpStatus = 0;
    println("JUMP!");
  }
}
