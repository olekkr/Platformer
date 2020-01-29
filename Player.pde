  class Player extends Entity {
  float accMove;
  float accMultiplier = 1.25;
  boolean weight = true;
  
  
  Player() {
    this.x = width/2;
    this.y = 0;
    this.entityWidth = 64;
    this.entityHeight = 500;
    this.collision = false;
    this.weight = true;
    this.speedX = 0;
    this.speedY = -10;
  }
  
  
  
}
