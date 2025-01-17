class Player extends Entity {
  float accMove;             //Move in current accelerated state
  float accMoveDefault = 4;  //Move with no acceleration speed (after a stop)
  float accMoveMax = 1.05;     //Max accelerated speed
  float accMultiplier = 0.5; //Acceleration
  float jump1Vel = -20;
  float jump2Vel = -17;
  int jumpStatus = 0; // 0:on the ground, 1:after 1 jump, 2:after 2jumps  
  int playerPoints = 0;
  
  Player() {
    img = loadImage("pictures\\GnomeRight.png");
    this.x = 300;
    this.y = height/2 -200;
    this.entityWidth = 30;
    this.entityHeight = 50;
    this.collidable = true;
    this.weight = true;
  }



  void jump() {
    println("jumpstatus", this.jumpStatus);
      if (this.jumpStatus == 0) {
      this.speedY = jump1Vel;
      this.jumpStatus = 1;
    } else if (jumpStatus == 1) {
      this.speedY = jump2Vel;
      this.jumpStatus = 2;
    }
  }

  void landingEvent(Obstacle obstacle) {
    this.jumpStatus = 0;
  }
}
